"""A demo to predict foosball"""
import numpy as np
import argparse
from edgetpu.classification.engine import ClassificationEngine
from PIL import Image
import bisect
import time
import socket

print("Waiting...")
# Create a UDP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
ipaddr = ""
port_num = 5000
server_address = (ipaddr, port_num)
sock.bind(server_address)

sock2 = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
ipaddr2 = "192.168.167.14"
port_num2 = 5050
server_address2 = (ipaddr2, port_num2)

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
velocity_prev = 0
past_time = time.time()
coord_prev = np.array((120,90))

while True:
    try:
        # Receive data over UDP
        data, address = sock.recvfrom(4096)
        inputarray = np.frombuffer(data, dtype='int64')

        coord = np.array((inputarray[0],inputarray[1]))
#        print(coord)
        dt_new = time.time() - past_time
        # print(dt_new)
        past_time = time.time()

        coord = np.array((0.1 * (coord) + 0.9 * (coord_prev)), dtype='int')
        # velocity = (coord - coord_prev) / (dt_new)
        velocity = np.array((0.1 * ((coord - coord_prev) / (dt_new)) + 0.9 * velocity_prev), dtype='int')
        velocity_prev = velocity
        coord_prev = coord
        inp = np.hstack((coord, velocity))
        # print(inp)

        input_tensor = np.asarray(inp).flatten()
#        input_tensor = np.reshape(inp, (1, 4))
        donjon = input_tensor.astype('uint8')

        latency, predict = engine.RunInference(donjon)


#        print(latency, predict)

        pred_coord = np.array(np.reshape(predict, (50, 2)), dtype='int')
        print(pred_coord)
        # pred_coord = pred_coord[0:9,:]
        bad_idx_x = pred_coord[:, 0] >= 180
        bad_idx_y = pred_coord[:, 1] >= 240
        pred_coord_x = pred_coord[:, 0]
        pred_coord_x[bad_idx_x] = 179
        # print(pred_coord_x)
        pred_coord_y = pred_coord[:, 1]
        pred_coord_y[bad_idx_y] = 239

#        message = np.array((pred_coord_x[0:49], pred_coord_y[0:49]), dtype='int')#.tobytes()
        message = np.array(pred_coord, dtype='int')
        message = np.append(message, coord).tobytes()
        # Send data
        # print('sending {!r}'.format(message))
        sent = sock2.sendto(message, server_address2)



    except KeyboardInterrupt:
        break


