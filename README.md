# BENCH AUTOMATION COMPUTER

To make a portable automation computer you need the following:
## Hardware components

•	Raspberry Pi 3(any RPi with 40-pin), it comes with integrated Wi-Fi and Bluetooth capabilities.

•	PiCamera/USB camera, I have used USB camera.

•	PiFace Relay Plus/ KeyStudio, for interfacing of appliances with the RPi.

•	3.2 inch RPi Touchscreen, for displaying screen of RPi.

•	Power adapter (min. 5V), to boot up the Pi.

•	SD card (16GB and above), to install the Raspbian OS.

•	DHT11/DHT22 sensor, for temperature and humidity. 

•	Breadboard

•	Jumper wires

•	Resistor

## Software Components

•	Raspbian OS. Download from https://www.raspberrypi.org/downloads/raspbian.

•	Python3

•	Tkinter, for designing the bench application.

•	Microsoft Remote Desktop Manager, for remotely accessing the Pi.

•	Text editor(Sublime/Visual Studio)

•	PuTTY, to access the terminal of Pi for installing XRDP, a remote protocol after which remote connection is established b/w Pi and desktop/laptop.

The system is divided into 4 modules:
### •	Display Module- 
1.	Install the OS zip file and then unzip to obtain the image file. Use etcher.io to copy this file onto the SD card.

2.	Integrate the LCD with the Pi. If you are using 3.2 inch LCD then you can utilize the pins of the Pi. (See the pin diagram of RPi to get an idea of the voltage and GPIO pins).

3.	Boot the Pi by inserting the SD card into the slot.

4.	Connect the Pi to your network & remember the IP of the Pi (as it is required for establishing the connection b/w Pi and laptop). To know the IP, open terminal in the Pi & type
ifconfig wlan0 (this would give the IP address)

5.	Install PuTTY on your laptop and enter the IP address (Pi) & set the configuration. After the connection is established a terminal window popup.
It would prompt you to enter the password: raspberry (default) & you’ll have access to Pi’s terminal.

6.	Install xrdp protocol on Pi by entering the following cmd:

`sudo apt-get install xrdp`

`sudo reboot`

Then install remote desktop manager on the laptop. Select the Microsoft Remote Desktop then enter the host name as the IP add of the Pi.
### •	Camera Module- 
1.	Integrate the USB camera to one of the four ports of the Pi.

2.	Install sudo apt-get install fswebcam.

3.	Then you can take images by typing sudo fswebcam banner image2.jpg.

The images are saved in the file manager. Menu>Accessories>File Manager. You can also specify your own destination.

4.	Make a directory mkdir webcam

5.	Open nano editor in Pi sudo nano webcam.sh

Use the code to take a photo and storing it by date. You can use various cmd such as `–r` (resolution), `--no-banner` (to remove banner from below the image) and others.

`#!/bin/bash`

`DATE=$(date +"%Y-%m-%d_%H%M")`

`fswebcam -r 1280x720 --no-banner /home/pi/webcam/$DATE.`

Make the file executable sudo chmod +x webcam.sh & then run ./webcam.sh

### •	Sensor Module- 
1.	Integrate the DHT11 (3 pins) sensor using jumper wires and breadboard to the RPi. Use pins 1(Vcc), 6(GND) & 7(data pin). 

2.	Open terminal

`mkdir dht11`

`cd dht11`

`sudo apt-get install git`

`git clone https://github.com/adafruit/Adafruit_Python_DHT.git`

`cd Adafruit_Python_DHT`

`sudo apt-get install build-essential python-dev` (Check if python development tools are installed, if not then install them).

`sudo python3 setup.py install`

`cd examples`

`python3 Adafruit_DHT.py`

`sudo python3 Adafruit_DHT.py 11 4` (giving the sensor(11/22) and the data pin(in RPi))

This would give you temperature and humidity reading on the terminal.

•	Relay Module- Work under development.


### Screenshots
 
 ![1](https://user-images.githubusercontent.com/22126720/38153965-12064dbc-348d-11e8-8eeb-0080f4004b34.png)

        
          Screenshot 1- Camera Module
 
 
 ![2](https://user-images.githubusercontent.com/22126720/38153808-3068b610-348c-11e8-9b82-b5e7701ba7b2.jpg)
 
          Screenshot 2- Display Module


![3](https://user-images.githubusercontent.com/22126720/38153850-655ecb70-348c-11e8-92d3-b83e44fe5d50.png) 

         Screenshot 3- Sensor Module
 
           
### Bench Automation Application
This app provides an interface for normal users to use various features of the Pi. Build using Tkinter, a Python GUI. For this you need a text editor, I’m using sublime text. To execute the bench_computer.py file. Go to the folder where the file is saved (in my case Desktop).

`cd Desktop` 

`python3 bench_computer.py`

#### NOTE:

•	You can buy the hardware components from element14.com.

•	The project is under development.

•	Working on Relay Module, recording videos through USB camera & bench application is under development.

--------------------------------------------------------------------------------------------------------------------------------

If you like the project and have used the source code anywhere, would love to hear from you at [![Say Thanks!](https://img.shields.io/badge/SayThanks.io-%E2%98%BC-1EAEDB.svg)](https://saythanks.io/to/ushukla%40buffalo.edu)











