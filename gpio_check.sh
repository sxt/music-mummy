#!/bin/sh

echo "4" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio4/direction

ON=`cat /sys/class/gpio/gpio4/value`
PLAYING=0

echo  'On: ' $ON

  if [ $ON = 1 ]
  then
    echo 'GPIO 4 is ON'
  else
    echo 'GPIO 4 is OFF'
  fi

# Clean up
echo "4" > /sys/class/gpio/unexport
