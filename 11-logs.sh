#!/bin/bash
userid=$(id -u)
log_folder="/var/log/shell_script"
log_file="/var/log/shell_script/$0.logfile"
if [ $userid -ne 0 ];then
echo "Please enter with root access"
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

dnf install nginx -y  &>> $log_file
validate $? "nginx installed"

dnf install mysql -y &>> $log_file
validate $? "mysql installed"
