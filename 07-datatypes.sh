#!/bin/bash
a=1
b=2
sum=$(($a+$b))
echo "total is : $sum"

list=("apple" "mango" "grape")
echo "the first fruit is : ${list[0]}"
echo "end second fruit is : ${list[1]}"
echo "third fruit is : ${list[@]}