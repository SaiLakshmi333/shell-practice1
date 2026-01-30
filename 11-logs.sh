#!/bin/bash
userid=$(id -u)
logs_folder="/var/log/shell_script/"
logs_file="/var/log/shell_script/$0.log"

mkdir -p $logs_folder
if [ $userid -ne 0 ]; then
echo "Please enter with root access"
exit 1
fi

validate(){
    if [ $1 -ne 0 ];then
    echo "$2 is failed" | tee -a $logs_file
    exit 1
    echo "$2 is success" | tee -a $logs_file
    fi
}

dnf install nginx -y  &>>$logs_file
validate $? "nginx installed" 

dnf install mysql -y &>>$logs_file
validate $? "mysql installed"
