#!/bin/bash

#turn off power managmane screen timeout and screen saver
xset s noblank
xset s off
xset -dpms

#removes the mouse from the screen when idle for n seconds
unclutter -idle 0.5 -root &

#remove and chromium warnings from popping up
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences


#launch chromium
/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk http://localhost &

#switch between the tabs in chromium every n seconds
while true; do
      xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab;
      sleep 15
done
