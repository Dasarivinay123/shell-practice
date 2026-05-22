#!bin/bash

#data-types###
NUM1=10
NUM2=15

SUM=$(($NUM1+$NUM2))
echo "Sum is: $SUM"

#Array
Movies=("RRR","Varanasi","Pushpa")
echo "Movis are: ${MOVIES[@]}"