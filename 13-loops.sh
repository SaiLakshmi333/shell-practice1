#!/bin/bash
user_id=$(id -u)
log_folder="/var/log/shell_script"
log_file="/var/log/shell_script/$0.log"
if [ $user_id -ne 0 ];then
echo "please enter with root access"
exit 1
fi
mkdir -p $log_folder
validate() {
    if [ $1 -ne 0 ];then
    echo "$2 is failed" | tee -a $log_file
    exit 1
    else 
    echo "$2 is success" | tee -a $log_file
    fi
}

for package in $@
do 
dnf list $package installed &>> $log_file
if [ $1 -ne 0 ]; then
echo "$package not installed ...installing now"
dnf install $package -y &>> $log_file
validate $? "$package installation"
else
echo "$package already installed"
fi

done 

