"""DAVIS240 Foosball CNN Test.
Telluride 2019

Author: Rajkumar Kubendran
Based on DAVIS 240 Pyaer and CNN from Jonah Sengupta
"""
from __future__ import print_function

import numpy as np
import cv2
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


# Constants describing the training process.
MOVING_AVERAGE_DECAY = 0.9999     # The decay to use for the moving average.
NUM_EPOCHS_PER_DECAY = 350.0      # Epochs after which learning rate decays.
LEARNING_RATE_DECAY_FACTOR = 0.1  # Learning rate decay factor.

INITIAL_LEARNING_RATE = 0.001      # Initial learning rate.
EVAL_BATCH_SIZE = 5
BATCH_SIZE = 5
# for CamVid
IMAGE_HEIGHT = 90
IMAGE_WIDTH = 120
IMAGE_DEPTH = 3

NUM_CLASSES = 2
NUM_EXAMPLES_PER_EPOCH_FOR_TRAIN = 27298
NUM_EXAMPLES_PER_EPOCH_FOR_TEST = 101
NUM_EXAMPLES_PER_EPOCH_FOR_EVAL = 1
TEST_ITER = NUM_EXAMPLES_PER_EPOCH_FOR_TEST / BATCH_SIZE


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

clip_value = 3
histrange = [(0, v) for v in (180, 240)]


def get_event(device):
    data = device.get_event("events")

    return data

model_file = "./model_quant_eval.h5"
max_steps = 20000
test_ckpt = "./model.ckpt-19999"
image_w = 120
image_h = 90
image_c = 3
# testing should set BATCH_SIZE = 1
batch_size = 1

davis_image = np.zeros((180,240))

dt = 0.02
decay_time = 0.1
decay_scale = np.exp(-dt/decay_time)

now = None


model = tf.keras.models.load_model(model_file)
model.summary()
img = np.zeros((180,240))


# fig = plt.figure()
# ax = fig.add_subplot(111)
#
# def animate(data):
#     tstart = time.time()                   # for profiling
#     data=np.random.randn(10,10)
#     im=plt.imshow(data)
#
#     for i in np.arange(1,200):
#         data=np.random.randn(10,10)
#         im.set_data(data)
#         fig.canvas.draw()                         # redraw the canvas
#     print 'FPS:' , 200/(time.time()-tstart)
#
# win = fig.canvas.manager.window
# fig.canvas.manager.window.after(100, animate)

with tf.keras.backend.get_session() as sess:
    sess = tf.Session(config=tf.ConfigProto(allow_soft_placement=True, log_device_placement=True))
    # g = sess.graph()
    tf.contrib.quantize.create_eval_graph()
    sess.run(tf.global_variables_initializer())
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
                # z = np.zeros(davis_image_tf.shape)
                # davis_image_tf = np.append(davis_image_tf, z, axis = 2)
                # davis_image_tf = np.append(davis_image_tf, z, axis = 2)
                davis_image_tf = np.reshape(davis_image_tf, (1,180,240,1))
                # if frames.shape[0] != 0:

                davis_rsh = davis_image_tf[0,:,:,0]
                prediction = model.predict(davis_image_tf)
                # print(prediction.shape)
                coord= np.unravel_index(np.argmax(prediction[0,:,:,0], axis = None),prediction[0,:,:,0].shape)
                print("Ball Coordinates = %s", coord)
                img = np.zeros((180,240))
                img[coord[0]-10:coord[0]+10,coord[1]-10:coord[1]+10] = 255
                cv2.imshow("coord", img)
                cv2.imshow("events", davis_image)
                # fig = plt.figure(1)
                # plt.imshow(img)
                # plt.show()
                # plt.close(fig)
                # im.set_data(img)
                # im.axes.figure.canvas.draw()
                # plt.imshow(prediction[0,:,:,0])
                # print("Predicted=%s", prediction)
                # cv2.imshow("frame", np.reshape(im, (90,120)))

                # print("Number of events:", num_pol_event, "Number of Frames:",
                #       frames.shape, "Exposure:",
                #       device.get_config(
                #           libcaer.DAVIS_CONFIG_APS,
                #           libcaer.DAVIS_CONFIG_APS_EXPOSURE))

                if cv2.waitKey(1) & 0xFF == ord('q'):
                    break
            else:
                pass

        except KeyboardInterrupt:
            device.shutdown()
            break

        
# plt.show()



