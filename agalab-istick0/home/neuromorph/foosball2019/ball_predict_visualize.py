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


print("Waiting")
# Create a UDP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
ipaddr = ""
port_num = 5050
server_address = (ipaddr, port_num)
sock.bind(server_address)


past_time = time.time()
step = 0

while True:
    try:

        data, address = sock.recvfrom(4096)
        inputarray = np.frombuffer(data, dtype='int64')
        # print("Received Data through UDP")
        pred_coord = np.array(np.reshape(inputarray, (51, 2)), dtype='int')
        print("Ball Coord",pred_coord[50,:])
        bad_idx_x = pred_coord[:, 0] >= 180
        bad_idx_y = pred_coord[:, 1] >= 240
        pred_coord_x = pred_coord[:, 0]
        pred_coord_x[bad_idx_x] = 179
        # print(pred_coord_x)
        pred_coord_y = pred_coord[:, 1]
        pred_coord_y[bad_idx_y] = 239
        img = np.zeros((180, 240))
        # img[pred_coord_x[50] - 10:pred_coord_x[50] + 10, pred_coord_y[50] - 10:pred_coord_y[50] + 10] = 255
        # img[pred_coord_x, pred_coord_y] = 255
        img[pred_coord[50,0] - 10:pred_coord[50,0] + 10, pred_coord[50,1] - 10:pred_coord[50,1] + 10] = 255
        img[pred_coord[:,0], pred_coord[:,1]] = 255
        cv2.imshow("Ball Track and Path Prediction - TPU", img)


        if cv2.waitKey(1) & 0xFF == ord('q'):
            break


    except KeyboardInterrupt:
        sock.close()
        break

        




