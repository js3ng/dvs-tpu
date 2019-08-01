"""DAVIS240 Foosball Tracking and Path Prediction Test.
Telluride 2019

Author: Rajkumar Kubendran, UCSD
Based on DAVIS 240 Pyaer and CNN Tracking and Prediction models from Jonah Sengupta
EdgeTPU Dev Team - Jonah, Raj and Andreas
"""
import numpy as np
import socket
import argparse
import threading
import time
from edgetpu.basic import edgetpu_utils
from edgetpu.classification.engine import ClassificationEngine
from edgetpu.detection.engine import DetectionEngine
from pyaer import libcaer
from pyaer.davis import DAVIS



# Create a UDP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
ipaddr = "192.168.167.14"
port_num = 5000
server_address = (ipaddr, port_num)

device = DAVIS(noise_filter=False)

print ("Device ID:", device.device_id)
if device.device_is_master:
    print ("Device is master.")
else:
    print ("Device is slave.")
print ("Device Serial Number:", device.device_serial_number)
print ("Device String:", device.device_string)
print ("Device USB bus Number:", device.device_usb_bus_number)
print ("Device USB device address:", device.device_usb_device_address)
print ("Device size X:", device.dvs_size_X)
print ("Device size Y:", device.dvs_size_Y)
print ("Logic Version:", device.logic_version)
print ("Background Activity Filter:",
       device.dvs_has_background_activity_filter)


device.start_data_stream()
# set new bias after data streaming
# device.set_bias_from_json("/home/neuromorph/pyaer/scripts/configs/davis240c_config.json")

def chunk_evs_pol(times, addrs, size=[2, 240, 180], ds_w=1, ds_h=1):
    ee = addrs
    chunks = np.zeros(size, dtype='int8')
    pol, x, y = ee[:, 2], (ee[:, 0] // ds_w).astype(np.int), (ee[:, 1] // ds_h).astype(np.int)
    np.add.at(chunks, (pol, x, y), 1)
    return chunks

parser = argparse.ArgumentParser()
parser.add_argument(
   '--model_track', help='File path of Ball Tracker CNN Tflite model.', required=True)
parser.add_argument(
   '--model_predict', help='File path of Ball Path Prediction Tflite model.', required=True)
args = parser.parse_args()

# Initialize engine.
track_engine = ClassificationEngine(args.model_track)
predict_engine = ClassificationEngine(args.model_predict, track_engine.device_path())
# Run inference.

def get_event(device):
    data = device.get_event("events")

    return data

davis_image = np.zeros((180,240))

dt = 0.02
decay_time = 0.02
decay_scale = np.exp(-dt/decay_time)

now = None
coord_prev = np.array((120,90))
first_flag = 1

past_time = time.time()
step = 0


while True:
    try:
        data = get_event(device)
        if data is not None:
            (pol_events, num_pol_event,
             special_events, num_special_event,
             frames_ts, frames, imu_events,
             num_imu_event) = data

            davis_image *= decay_scale

            if pol_events is None:
                continue

            t, x, y, p = pol_events.T

            t = t.astype(float) / 1000000

            p = np.where(p, 1, -1)
            if now is None:
                now = t[0]

            if np.max(t) >= now + dt:
                now = np.max(t) - dt
            dts = dt - (t - now)

            np.add.at(davis_image, [y, x], p * np.exp(-dts / decay_time))

            now += dt
            davis_image_tf = np.expand_dims(davis_image, axis = 2)
            davis_image_tf = np.reshape(davis_image_tf, (1,180,240,1))

            input_tensor = np.asarray(davis_image_tf).flatten() * 255
            track_input = input_tensor.astype('uint8')
            track = track_engine.RunInference(track_input)
            # print(track.shape)
            coord= np.unravel_index(np.argmax(track[0,:,:,0], axis = None),track[0,:,:,0].shape)

            cnt = 1
            if(coord != (130,16)):
                # print("Ball Coordinates = ", coord)

                coord = np.array(coord)
                if first_flag:
                    first_flag = 0
                    velocity_prev = 0
                else:
                    dt_new = time.time() - past_time
                    # print(dt_new)
                    past_time = time.time()

                    coord = np.array((0.1*(coord)+0.9*(coord_prev)), dtype = 'int')
                    # velocity = (coord - coord_prev) / (dt_new)
                    velocity = np.array((0.1 * ((coord - coord_prev) / (dt_new)) + 0.9 * velocity_prev), dtype='int')
                    velocity_prev = velocity
                    coord_prev = coord
                    # coord_prev[:, 1:9] = coord_prev[:, 0:8]
                    inp = np.hstack((coord,velocity))
                    # print(inp)

                    predict = predict_engine.RunInference(np.reshape(inp, (1,4)))
                    pred_coord = np.array(np.reshape(predict,(50,2)), dtype = 'int')
                    # print(pred_coord)

                    message = str(coord).encode('ascii')+str(pred_coord).encode('ascii')

                    # Send data over UDP
                    print('sending {!r}'.format(message))
                    sent = sock.sendto(message, server_address)

                cnt = 1
                step +=1
                # print(step)
                if step == 1000:
                    break
            else:
                cnt += 1
                # print("stuck at 130, 16")

        else:
            pass

    except KeyboardInterrupt:
        device.shutdown()
        sock.close()
        break




