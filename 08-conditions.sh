#!/bin/bash

NUMBER=$1

#gt - greater than
#lt - less than
#eq - equal
#ne - not equal
#ge - greater than equal
#le - less than equal

if [ $NUMBER -gt  20 ]; then
    echo "Given number is greater than  20"
elif [ $NUMBER -eq 20 ]
    echo "Given number is equal to 20"
else
    echo "Given number $NUMBER is less than 20"
fi