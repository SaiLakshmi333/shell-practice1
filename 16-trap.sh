#!/bin/bash
set -e
trap 'echo "there is an error in $LINENO, command: $BASH_COMMAND"' ERR
user_id=$(id -u)
log_folder="/var/log/shell_script"
log_file="/var/log/shell_script/$0.log"
if [ $user_id -ne 0 ];then
echo "please enter with root access"
exit 1
fi
mkdir -p $log_folder


for package in $@
do 
dnf list installed $package &>> $log_file
if [ $? -ne 0 ]; then
echo "$package not installed ...installing now" | tee -a $log_file
dnf install $package -y &>>$log_file

else
echo "$package already installed" | tee -a $log_file
fi
done 

