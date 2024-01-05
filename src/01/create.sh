#!/bin/bash

filename=$3
len_filename=$(echo -n "$3" | wc -m)
date=$(date "+%d%m%y")

start_position=1
last_position=1

echo "${filename:0:1}${filename:0:1}${filename:1:len_filename}"


while (($len_filename<4))
do
    filename="$filename${filename: -1}"
    ((len_filename++))
done

for (( i=1; i<=$2 ; i++ ))
do
    if (((($len_filename+7))>=255))
    then 
        ((j++))
        len_filename=$(echo -n "$3" | wc -m)
        filename=$3
        ((middle_position++))

        if((j>1))
        then 
            ((start_position++))
            ((last_position++))
        fi
    fi
    
    mkdir "$filename"_"$date" ; cd "$filename"_"$date"
    filename="${filename:0:start_position}${filename:middle_position:1}${filename:last_position:len_filename}"
    ((len_filename++))
done