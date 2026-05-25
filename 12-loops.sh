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
for package in $@
do
   echo "installing $package"
   dnf list installed $package
    if [ $? -eq 0 ]; then
        echo "$package is already installed...SKIPPING" | tee -a $LOGS_FILE
    else    
        echo "installing $package"
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE "Installing $package" $?
    fi

    dnf list installed $package

    if [ $? -eq 0 ]; then
        echo "$package is already installed...SKIPPING" | tee -a $LOGS_FILE
    else    
        echo "installing $package"
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE "Installing $package" $?
    fi
done


