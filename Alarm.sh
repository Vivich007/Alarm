#!/usr/bin/env bash 

# Written By Woland

# Simple Alarm clock script

#Dependency:
#          mpv
#          figlet 
#          sleep

# https://github.com/wolandark
# https://github.com/wolandark/BASH_Scripts_For_Everyone

if [[ -z $1 ]]; then
	echo -e "\n\t Usage: ./Alarm.sh 8h for 8 hours of sleep"
	echo -e "\t\t./Alarm.sh 10s for 10 seconds of sleep"
	echo -e "\t\t See man sleep\n"
	exit 0
fi

sleep "$1";
figlet "sleep time over"

alarm=(
	"/c/Users/Chisara/Downloads/alarm1.mp3"
	"/c/Users/Chisara/Downloads/alarm2.mp3"
	"/c/Users/Chisara/Downloads/alarm3.mp3"
	"/c/Users/Chisara/Downloads/alarm4.mp3"
	"/c/Users/Chisara/Downloads/alarm5.mp3"
)

for ((i=0; i<${#alarm[@]}; i++)); do
  figlet -f slant "Wake Up-$((i+1))"
  sleep 1; mpv --no-audio-display --no-resume-playback "${alarm[i]}" &
  sleep 45; killall mpv
  sleep 5m;
done