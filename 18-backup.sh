#!/bin/bash
user_id=$(id -u)
log_dir="/var/log/shell_script"
log_file="$log_dir/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m" 
source_dir=$1
dest_dir=$2
days=${3:-14}
if [ $user_id -ne 0 ];then
echo -e "$R please access with root user $N"  
exit 1
fi

usage(){
 echo -e  "$R USAGE :: sudo backup <source_dir> <dest_dir> <days>[default 14 days]$N" 
}

log(){
    echo -e "$(date "+%Y-%m-%d %H-%M-%s")| $1 " 
}

if [ $# -lt 2 ];then
usage 
fi

if [ ! -d $source_dir ];then
echo "source directory not exist" 
exit 1
fi

if [ ! -d $dest_dir ];then
echo "destination directory" 
exit 1
fi

# find files

find_files=$(find $source_dir -name "*.log" -type f -mtime +$days) 

log "backup started"
log "Source directory  : $source_dir" 
log "Destination Directory : $dest_dir" 
log "days : $days" 

if [ -z "${find_files}" ];then
log "no files present to archive"
else
log "files found to archive :$find_files"
time_stamp=$(date +%F-%H-%M-%S)
zip_file="$dest_dir/app-logs-$time_stamp.tar.gz"
echo "Archive name:$zip_file"
fi


