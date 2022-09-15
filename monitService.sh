#!/bin/bash
echo
echo "##################################################################"
echo
date
ls /var/run/httpd/httpd.pid &> /dev/null

if [ $? -eq 0 ]
then
    echo "Httpd process is running"
    echo
else
    echo "Httpd process is NOT Running"
    echo
    echo "Starting the process"
    echo
    systemctl start httpd
    if [ $? -eq 0 ]
    then
        echo "Process started successfully."
        echo
    else
        echo "Process Starting Failed, please contact the admin."
        echo
        
    fi
fi
echo "##################################################################"
echo
