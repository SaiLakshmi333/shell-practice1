#!/bin/bash
timestamp=$(date)
echo "the script executed at : $timestamp"

starttime=$(date +%s)
sleep 10
endtime=$(date +%s)


totaltime=$(($startime-$endtime))
echo "total time executed : $totaltime"