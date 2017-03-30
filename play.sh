#!/bin/sh

echo "19" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio19/direction

ON=`cat /sys/class/gpio/gpio19/value`
PLAYING=0

echo  'On: ' $ON

while [ 1 -eq 1 ]
do
  if [ $ON = 1 ]
  then
    echo 'GPIO 19 is ON'
    if [ $PLAYING = 0 ]
    then
       echo 'Music is not playing - starting....'
       PLAYING=1
       #mpg321 spitfire.mp3&
       mpg321 -g 80 -z --list playlist.txt &
    fi
  elif [ $PLAYING = 1 ]
  then
    echo 'GPIO 19 is OFF, music is playing - stopping...'
    pkill -SIGKILL mpg321
    PLAYING=0
  fi

  echo 'sleeping for 1s...'
  sleep 1
  ON=`cat /sys/class/gpio/gpio19/value`

done

# Clean up
echo "19" > /sys/class/gpio/unexport
