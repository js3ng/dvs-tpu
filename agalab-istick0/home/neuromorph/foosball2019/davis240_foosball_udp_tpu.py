"""DAVIS240 Foosball CNN Test.
Telluride 2019

Author: Rajkumar Kubendran
Based on DAVIS 240 Pyaer and CNN from Jonah Sengupta
"""
from __future__ import print_function

import numpy as np
import cv2
import socket
import tensorflow as tf
from tensorflow.python.framework import ops
from tensorflow.python.framework import dtypes

import os, sys
import math
from datetime import datetime
import time
# from PIL import Image
from math import ceil
from tensorflow.python.ops import gen_nn_ops
import matplotlib.pyplot as plt


from pyaer import libcaer
from pyaer.davis import DAVIS



# Create a UDP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
ipaddr = "192.168.167.16"
port_num = 5000
server_address = (ipaddr, port_num)#('localhost', 10000)

# sock2 = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
# ipaddr2 = ""
# port_num2 = 5050
# server_address2 = (ipaddr2, port_num2)

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
device.set_bias_from_json("/home/neuromorph/pyaer/scripts/configs/davis240c_config.json")



def get_event(device):
    data = device.get_event("events")

    return data

ball_track_file = "./quant_cnn_eval.h5" #Path to ball tracker model
ball_predict_file = "./quant_pp_model_eval_3.h5" #Path to ball prediction model

davis_image = np.zeros((180,240))

dt = 0.02
decay_time = 0.02
decay_scale = np.exp(-dt/decay_time)

now = None

coord_prev = np.array((120,90))
first_flag = 1


model_t = tf.keras.models.load_model(ball_track_file)
model_t.summary()
img = np.zeros((180,240))
# model_p = tf.keras.models.load_model(ball_predict_file)
# model_p.summary()


past_time = time.time()
step = 0
with tf.keras.backend.get_session() as sess:
    sess = tf.Session(config=tf.ConfigProto(allow_soft_placement=True, log_device_placement=True))
    tf.contrib.quantize.create_eval_graph()
    sess.run(tf.global_variables_initializer())
    flops = tf.profiler.profile(sess.graph, options=tf.profiler.ProfileOptionBuilder.float_operation())
    print(flops.total_float_ops)
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


                past_time = time.time()
                track = model_t.predict(davis_image_tf)
                dt_new = time.time() - past_time
                #print(dt_new)
                # print(track.shape)
                coord= np.unravel_index(np.argmax(track[0,:,:,0], axis = None),track[0,:,:,0].shape)
                img = np.zeros((180,240))
                # img[coord[0] - 10:coord[0] + 10, coord[1] - 10:coord[1] + 10] = 255
                # cv2.imshow("track", img)
                # cv2.imshow("events", davis_image)
                img2 = np.zeros((180, 240))
                cnt = 1
                if(coord != (130,16)):
                    # print("Ball Coordinates = ", coord)


                    img[coord[0]-10:coord[0]+10,coord[1]-10:coord[1]+10] = 255
                    cv2.imshow("track", img)
                    cv2.imshow("events", davis_image)

                    message = np.array((coord[0],coord[1]), dtype = 'int').tobytes()
                    # message = str(coord).encode('ascii')+str(pred_coord).encode('ascii')

                    # Send data
                    #print('sending {!r}'.format(message))
                    #sent = sock.sendto(message, server_address)

                    # data, address = sock.recvfrom(4096)
                    # inputarray = np.frombuffer(data, dtype='int64')
                    #
                    # pred_coord = np.array(np.reshape(inputarray, (50, 2)), dtype='int')
                    # # print(pred_coord)
                    # bad_idx_x = pred_coord[:, 0] >= 180
                    # bad_idx_y = pred_coord[:, 1] >= 240
                    # pred_coord_x = pred_coord[:, 0]
                    # pred_coord_x[bad_idx_x] = 179
                    # # print(pred_coord_x)
                    # pred_coord_y = pred_coord[:, 1]
                    # pred_coord_y[bad_idx_y] = 239
                    # img2[coord[0] - 10:coord[0] + 10, coord[1] - 10:coord[1] + 10] = 255
                    # img2[pred_coord_x, pred_coord_y] = 255
                    # cv2.imshow("pred", img2)

                    cnt = 1
                    step +=1
                    # print(step)
                    # if step == 1000:
                    #     break
                else:
                    cnt += 1
                    print("stuck at 130, 16")
                if cv2.waitKey(1) & 0xFF == ord('q'):
                    break
            else:
                pass

        except KeyboardInterrupt:
            device.shutdown()
            sock.close()
            break

        
# plt.show()



