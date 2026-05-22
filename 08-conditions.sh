#!/bin/bash

NUMBER=$1

#gt - greater than
#lt - less than
#eq - equal
#ne - not equal
#ge - greater than equal
#le - less than equal

if [ $NUMBER -ge  20 ]; then
    echo "Given number is greater than or equal to 20"
fi