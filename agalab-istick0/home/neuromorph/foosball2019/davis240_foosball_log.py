from __future__ import print_function

import numpy as np
import cv2

from pyaer import libcaer
from pyaer.davis import DAVIS

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


davis_image = np.zeros((180,240))

dt = 0.02
decay_time = 0.02
decay_scale = np.exp(-dt/decay_time)

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

            if cv2.waitKey(1) & 0xFF == ord('q'):
                break

    except KeyboardInterrupt:
        device.shutdown()
        sock.close()
        break
