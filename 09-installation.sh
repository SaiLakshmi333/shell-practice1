#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ];then
echo "Please enter with root access"
exit 1
fi
echo "installing nginx"
dnf install nginx -y
if [ $? -ne 0 ];then
echo "Installation failed"
else
echo "Installation success"
fi
