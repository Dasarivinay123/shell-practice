#!bin/bash

USERID=$(id -u)

#check root access or not

if [ $USERID -ne 0]; then
    echo "Please run this script with root access"
    exit 1
fi

dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "MYSQL is already installed...SKIPPING"
else    
    echo "installing mysql"
    dnf install mysql -y
    if [ $? -ne 0 ]; then
        echo "Installing Mysql is ...FAILED"
        exit 1
    else 
        echo "Installing Mysql ....SUCESS"
    fi
fi