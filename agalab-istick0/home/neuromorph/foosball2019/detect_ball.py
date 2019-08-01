"""A demo to detect foosball"""
import numpy as np
import argparse
from edgetpu.classification.engine import ClassificationEngine
from PIL import Image
import bisect
import time
import socket

from pyaer import libcaer
from pyaer.davis import DAVIS

# Create a UDP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
ipaddr = "192.168.167.97"
port_num = 5000
server_address = (ipaddr, port_num)

device = DAVIS(noise_filter=True)


print("DEVICE ID:", device.device_id)
if device.device_is_master:
    print("Device is master.")
else:
    print("Device is slave.")
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
#device.set_bias_from_json("./scripts/configs/davis240c_config.json")

clip_value = 3
histrange = [(0, v) for v in (180, 240)]

def find_first(a, tgt):
    return bisect.bisect_left(a, tgt)

def chunk_evs_pol(times, addrs, size=[2, 240, 180], ds_w=1, ds_h=1):
    ee = addrs
    chunks = np.zeros(size, dtype='int8')
    pol, x, y = ee[:, 2], (ee[:, 0] // ds_w).astype(np.int), (ee[:, 1] // ds_h).astype(np.int)
    np.add.at(chunks, (pol, x, y), 1)
    return chunks

image = np.zeros((240,180,2))

parser = argparse.ArgumentParser()
parser.add_argument(
   '--model', help='File path of Tflite model.', required=True)
args = parser.parse_args()

# Initialize engine.
engine = ClassificationEngine(args.model)
# Run inference.

dt = .01
decay_time = 0.01
decay_scale = np.exp(-dt/decay_time)
t0 = 0
while True:
    try:
        data = device.get_event()
        if data is not None:
            (pol_events, num_pol_event,
             special_events, num_special_event,
             frames_ts, frames, imu_events,
             num_imu_event) = data


            if pol_events is None: continue

            chunk = chunk_evs_pol(pol_events[:,0],pol_events[:,1:]).swapaxes(0,1).swapaxes(1,2)

            dt = (pol_events[-1,0] - t0)/1000000
            t0 = pol_events[-1,0]
            image *= np.exp(-dt/decay_time)
            image+= chunk

            #print(image.sum())

            #if pol_events is None:
            #    continue

            ## print (pol_events.shape)
            ## print (pol_events[0,:])
            #t, x, y, p, valid = pol_events.T

            #t = t.astype(float)/1000000

            #if now is None:
            #    now = t[0]

            #

            ##if np.max(t) >= now + dt:
            ##    now = np.max(t)-dt
            #dts = dt - (t - now)
            #print(np.exp(-dts/decay_time))
            #np.add.at(image, [x,y,p], np.exp(-dts/decay_time))

            #now += dt

            input_tensor = np.asarray(image).flatten()*255
            donjon =  input_tensor.astype('uint8')
            
            latency, raw_result = engine.RunInference(donjon)

#            print(int(raw_result[0]),int(raw_result[1]))
#            raw_result = int(raw_result)
            message = np.array((raw_result[0],raw_result[1]), dtype = 'int').tobytes() #encode('ascii')# + str(int(raw_result[1])).encode('ascii')

            # Send data over UDP
            # print('sending {!r}'.format(message))
            sent = sock.sendto(message, server_address)



            #print ("Number of events:", num_pol_event, "Number of Frames:",
            #       frames.shape, "Exposure:",
            #       device.get_config(
            #           libcaer.DAVIS_CONFIG_APS,
            #           libcaer.DAVIS_CONFIG_APS_EXPOSURE))

        else:
            pass
#        t1 = time.time()
#        if (0.3-(t1-t0)) >0:
#            time.sleep(0.3-(t1-t0))

    except KeyboardInterrupt:
        device.shutdown()
        break

#if __name__ == '__main__':


  
# for result in engine.ClassifyWithInputTensor(input_tensor, 0.0, top_k=3):
#   print ('---------------------------')
#   print (labels[result[0]])
#   print ('Score : ', result[1])
