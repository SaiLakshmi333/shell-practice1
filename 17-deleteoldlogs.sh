#!/bin/bash
log_dir="/home/ec2-user/app-logs"
log_file="$log_dir/$0.log"

if [ ! -d "$log_dir" ]; then
echo "log directory not exist"
exit 1
fi

files_to_delete=$(find $log_dir -name "*.log" -mtime +14)
#echo "$files_to_delete"

while IFS= read -r filepath; do 
echo "deleting the file : $filepath"
rm -f $filepath
echo "deleted the file :$filepath"
done <<< $files_to_delete