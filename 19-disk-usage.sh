#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m" 
Message=""

disk_usage=$(df -hT | grep -v Filesystem )
disk_threshold=3

while IFS= read -r line
do
USAGE=$(echo $line | awk '{print $6}'| cut -d "%" -f1)
PARTITION=$(echo $line | awk '{print $7}')

if[ "$USAGE" -ge "$disk_threshold" ]; then
Message+="DISK is Full on $USAGE:$PARTITION" \n
fi

done <<< $disk_usage

echo -e "$Message"