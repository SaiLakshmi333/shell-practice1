#!/bin/bash

$TO_ADDRESS=$1
$SUBJECT=$2
$EMAIL_BODY=$3
$alert_type=$4
$Message=$5
$Server_IP=$(curl //169.254.169.254/latest/meta-data/local-ipv4)
$To_Team=$6
$final_message_body=$(echo $Message_body | sed -e 's/[]\/$*.^[]/\\&/g')
$final_message=$(sed -e "s/To_team/$To_team/g" -e "s/Server_IP/$Server_IP/g" -e "s/Message/$Final_message_body/g" templete.html)

{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo "$final_message"
echo "$EMAIL_BODY"
} | msmtp "$TO_ADDRESS"