#!/bin/bash
userid= $(id-u)
if [$userid -ne 0]
then
echo "Please enter with root acess"
else
dnf install inginx;
if [$? -ne 0]
then
echo " installing nginx failuer"
else
echo "installed successfully"
fi