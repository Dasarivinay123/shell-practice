#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
#check root access or not

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

# first arg -> what are trying to install
#second arg -> exit code
VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "Installing $1 is ...FAILED" | tee -a $LOGS_FILE
        exit 1
    else 
        echo "Installing $1 ....SUCCESS" | tee -a $LOGS_FILE
    fi
}
dnf list installed mysql &>> $LOGS_FILE

if [ $? -eq 0 ]; then
    echo "MYSQL is already installed...SKIPPING" | tee -a $LOGS_FILE
else    
    echo "installing mysql"
    dnf install mysql -y &>> $LOGS_FILE
    VALIDATE MYSQL $?
fi

dnf list installed nginx

if [ $? -eq 0 ]; then
    echo "nginx is already installed...SKIPPING" | tee -a $LOGS_FILE
else    
    echo "installing nginx"
    dnf install nginx -y &>> $LOGS_FILE
     VALIDATE nginx $?
fi

