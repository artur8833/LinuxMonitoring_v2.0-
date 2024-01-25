#!/bin/bash

codes=(200 201 400 401 403 404 500 501 502 500)
metods=(GET POST PUT PATCH DELETE)


for ((days=1;days<=5;days++))
do
    file_name="log_file_$days"
    echo "$file_name"
    maximum_line=$(shuf -i 100-1000 -n1)
    echo "$maximum_line" 
    for ((current_line=1; current_line < $maximum_line;current_line++))
    do
        ip=$(shuf -i 0-255 -n4 | tr '\n' '.' | sed 's/.\{1\}$//')
        echo "$ip ${codes[$(shuf -i 0-9 -n1)]} ${metods[$(shuf -i 0-4 -n1)]}"
    done

done 