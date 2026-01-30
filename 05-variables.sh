#!/bin/bash
timestamp=$(date)
echo "the script executed at : $timestamp"
starttime=$(date+%s)
endtime=$(date+%s)
sleep 10
echo "total time executed : (($startime-$endtime))"