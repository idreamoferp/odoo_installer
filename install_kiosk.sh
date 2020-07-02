#!/bin/bash
sudo apt-get install xdotool unclutter sed

cp kiosk.sh /home/pi/kiosk.sh
cp kiosk.service /etc/systemd/system/kiosk.service
systemctl daemon-reload
systemctl enable kiosk.service
systemctl start kiosk.service
