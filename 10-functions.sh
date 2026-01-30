#!/bin/bash
userid=$( id -u)
if [ $userid -ne 0 ];then
echo "Please enter with root access"
exit 1
fi


validate(){ 
if [ $1 -ne 0 ];then
echo "$2 failed"
exit 1
else
echo "$2 success"
fi
}

echo "installing nginx..."
dnf install nginx -y
validate $? "installing nginx"

echo "installing sql..."
dnf install mysql -y
validate $? "installing mysql"



