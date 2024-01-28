#!/bin/bash

codes=("200" "201" "400" "401" "403" "404" "500" "501" "502" "500")

for ((i=0; i<=4 ;i++))
do 
    file_name="logs_$i.log"
    # echo "$file_name"
    mass_logs=()
    lines=$(wc -l < "logs_$i.log") 
    echo "$lines"
    
#    while IFS= read -r line; do
#         mass_logs+=("$line")
#     done < "$file_name"
    
    if [[ "$1" -eq 1 ]]
    then
        echo "$file_name"
        echo "$(awk '{print $0}' $file_name | sort -k 7)" >> "logs_sort_by_codes_$i.log"

    elif [[ "$1" -eq 2 ]]
    then 
        echo "$(awk '{print $1}' $file_name | sort -u)">>"unique_ip_from_$file_name.log"
    elif [[ "$1" -eq 2 ]]
    then
    
    fi
    echo "$i -------"
    # mapfile -t mass_logs < <(find / -name "$file_name" 2>/dev/null)
    # echo "$mass_logs" 
    # for logs in "${mass_logs[@]}"
    # do 
    #     echo "$logs"
    # done
done 