#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ];
then
echo "Please enter with root acess"
exit 1
fi
echo "installing nginx"
dnf install inginx -y
if [$? -ne 0];
then
echo " installing nginx failuer"
exit 1
else
echo "installed successfully"
fi