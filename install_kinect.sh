#install lib_usb
apt-get install libudev-dev -y
wget -O libusb.tar.bz2 https://github.com/libusb/libusb/releases/download/v1.0.23/libusb-1.0.23.tar.bz2
tar xvjf libusb.tar.bz2
cd libusb-1.0.23
./configure
make
sudo make install
cd ..

#install libfreenect
apt-get install -y cmake cmake-curses-gui pkg-config

git clone https://github.com/OpenKinect/libfreenect.git
cd libfreenect
mkdir build
cd build
cmake ..
make
make install
cd ..

#install wrapper for python3
cd wrappers/python
python3 setup.py install
cd ..
