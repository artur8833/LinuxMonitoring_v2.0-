#!/bin/bash

codes=("200" "201" "400" "401" "403" "404" "500" "501" "502" "500")
metods=("GET" "POST" "PUT" "PATCH" "DELETE")
agents=("Mozilla" "Google" "Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")

for ((days=0;days<=4;days++))
do
    hours=$(shuf -i 0-24 -n1)
    dates=$(date +%d/%m/%Y: -d "$days days")
    times=$(date +:%H:%M:%S)
    file_name="log_file_$days"
    maximum_line=$(shuf -i 100-1000 -n1)
    for ((current_line=1; current_line < $maximum_line;current_line++))
    do
        times=$(date +%H:%M:%S -d "$(shuf -i 1-900 -n1) seconds")
        ip=$(shuf -i 0-255 -n4 | tr '\n' '.' | sed 's/.\{1\}$//')
        url="http://www.random.com/$(shuf -i 0-1000 -n1))"
        echo "$ip - - [$dates$times] \"${metods[$(shuf -i 0-4 -n1)]} $url\" ${codes[$(shuf -i 0-9 -n1)]} ${agents[$(shuf -i 0-8 -n1)]}">>logs_$days.log
    done

done 