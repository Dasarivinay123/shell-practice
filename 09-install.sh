#!bin/bash

USERID=$(id -u)

#check root access or not

if [ $USERID -ne 0]; then
    echo "Please run this script with root access"
    exit 1
fi

# first arg -> what are trying to install
#second arg -> exit code
VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "Installing $1 is ...FAILED"
        exit 1
    else 
        echo "Installing $1 ....SUCESS"
    fi
}
dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "MYSQL is already installed...SKIPPING"
else    
    echo "installing mysql"
    dnf install mysql -y
    VALIDATE MYSQL $?
fi

dnf list installed nginx

if [ $? -eq 0 ]; then
    echo "nginx is already installed...SKIPPING"
else    
    echo "installing nginx"
    dnf install nginx -y
     VALIDATE nginx $?
fi

