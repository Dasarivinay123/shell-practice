#!/bin/bash

START_TIME=$(date +%s)

echo "Script execution started"

sleep 5

echo "Script execution completed"

END_TIME=$(date +%s)

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "Total execution time: $TOTAL_TIME seconds"