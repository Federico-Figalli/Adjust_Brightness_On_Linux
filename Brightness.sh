#!/bin/sh
clear
echo '################################################'
echo '#                                              #'
echo '#      Based on bash 'xrandr' command            #'
echo '#                                              #'
echo '#    Script for regulate monitor brightness    #'
echo '#                                              #'
echo '################################################'
echo ''
echo ' Output avaiable are: '
echo ''
echo ' 1)LVDS  2)VGA  3)HDMI  4)DP '
echo ''
read -p ' Insert the number of graphic port: ' ANSWER
echo ''
read -p ' Insert a value to 0.1 (min) at 1 (max): ' BRING
while :
do
     case $ANSWER in 
        1)
          xrandr --output LVDS-1 --brightness $BRING
          break;;
        2)
          xrandr --output VGA-1 --brightness $BRING
          break;;
        3)
          xrandr --output HDMI-1 --brightness $BRING
          break;;
        4)
          xrandr --output DP-1 --brightness $BRING
          break;;
        *)
          echo 'Invalid graphic port,$BRING is a non correct option number';;
      esac
done
echo ""
echo " Brightness monitor regulated!" # working only with ""
echo ""
  	
	
