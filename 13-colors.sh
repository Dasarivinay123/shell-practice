#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
#check root access or not

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root access"
    exit 1
fi

# first arg -> what are trying to install
#second arg -> exit code
VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "$TIMESTAMP [ERROR] Installing $1 is ... $R FAILED $N" | tee -a $LOGS_FILE
        exit 1
    else 
        echo "$TIMESTAMP [INFO] Installing $1 ... $G SUCCESS $N" | tee -a $LOGS_FILE
    fi
}
for package in $@
do
   echo "$TIMESTAMP [INFO] installing $package"
   dnf list installed $package &>> $LOGS_FILE
    if [ $? -eq 0 ]; then
        echo "$TIMESTAMP [INFO] $package is already installed... $Y SKIPPING $N" | tee -a $LOGS_FILE
    else    
        echo "$TIMESTAMP [INFO] installing $package"
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE "Installing $package" $?
    fi
done


