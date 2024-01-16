#!/bin/bash

while IFS= read -r line
do

path=$(echo "$line" | awk -F "  " '{print $1}')

echo "$path"

# find $path -exec rm -rf {} +

done < 1.log