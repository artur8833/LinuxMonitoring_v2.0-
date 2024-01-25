#!/bin/bash

lines=$(( $(wc -l < "1.log") - 3))

for ((i=1;i<=lines;i++))
do
    read -r line
    path=$(echo "$line" | awk -F "  " '{print $1}')
    find $path -exec rm -rf {} +

done < 1.log
