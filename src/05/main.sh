#!/bin/bash

codes=("200" "201" "400" "401" "403" "404" "500" "501" "502" "500")


for ((i=0; i<=4 ;i++))
do 
    file_name="logs_$i.log"
    # echo "$file_name"
    mass_logs=()
    lines=$(wc -l < "logs_$i.log") 
    echo "$lines"
    
    if [[ "$1" -eq 1 ]]
    then
        echo "$file_name"
        echo "$(awk '{print $0}' $file_name | sort -k 7)" >> "logs_sort_by_codes_$i.log"

    elif [[ "$1" -eq 2 ]]
    then 
        echo "$(awk '{print $1}' $file_name | sort -u)">>"unique_ip_from_$file_name.log"
    elif [[ "$1" -eq 3 ]]
    then
        # awk '$(NF-1) ~ /^[45][0-9][0-9]$/ {print $0}' log.txt | sort
        echo "$(awk '$7 ~ /[45]/' $file_name)">>"logs_sort_by_codes(4xx,5xx)_$i.log"
    elif [[ "$1" -eq 4 ]]
    then
        echo "$(awk '$7 ~ /[45]/' $file_name | sort -u)">>"unique_ip_with_error_codes_from_$file_name.log"
    fi
    echo "$i -------"
done 