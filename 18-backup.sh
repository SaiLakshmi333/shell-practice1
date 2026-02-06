#!/bin/bash
user_id=$(id -u)
log_folder="/var/log/shell_script"
log_file="/var/log/shell_script/backup.log"

mkdir -p $log_folder
if [ $user_id -ne 0 ];then
echo "please enter with root access"
exit 1
fi

usage(){
    echo "USAGE::sudo backup <source_dir> <dest_dir> <days> default 14 days"
    exit1
    fi}

if [ $# -ne 2 ];then
usage
fi
