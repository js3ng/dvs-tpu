##########################################################################
Instructions for Environment Installation to run the following smoothly
pip
git
cmake
libcaer
pyaer
##########################################################################

####Download and Copy following files from CPU to mendel(EdgeTPU)
scp Downloads/get-pip.py mendel@ipaddr:/home/mendel
scp Downloads/cmake-3.14.5.tar.gz mendel@<ipaddr>:/home/mendel
scp <your edgetpu compiled tflite model> mendel@<ipaddr>:/home/mendel 
scp <your remote inference python code> mendel@<ipaddr>:/home/mendel
scp <pyaer wheel file> mendel@<ipaddr>:/home/mendel

####Run the following commands in the exact order
python3 --version #make sure python version >= 3.5
python3 get-pip.py #Install latest pip
sudo apt-get install build-essential pkg-config libusb-1.0-0-dev #install libcaer dependencies
sudo apt install git #install git for cloning libcaer, pyaer

# Update cmake to latest version
tar -xvzf cmake-3.14.5.tar.gz
cd cmake-3.14.5
cmake .
make
sudo make install

########## ONLY if CMAKE_ROOT not found error, do the following##################
sudo apt-get remove cmake cmake data
export CMAKE_ROOT=/usr/local/share/cmake-3.14
exit
ssh mendel@<ipaddr>
cmake --version #This MUST point to the correct version! 3.14

# Install and build libcaer from source
git clone https://github.com/inivation/libcaer.git
cd ../libcaer
cmake -DCMAKE_INSTALL_PREFIX=/usr .
make
sudo make install

# Install pyaer
pip install pyaer<wheel file>
vim /usr/local/bin/python3.5/dist-packages/pyaer/device.py #Commend or remove cv2 import

# Run your model!
python3 <inference.py> --model <tflite>
