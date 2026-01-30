#!/bin/bash
echo "all args passed to the script : $@"
echo "number of args passed to the script : $#"
echo "script name : $0"
echo "present working directory : $PWD"
echo "user data : $USER"
echo "home user : $HOME"
echo "pid :$$"
sleep 10 &
echo "background process : $!"
echo "all args passed :$*"