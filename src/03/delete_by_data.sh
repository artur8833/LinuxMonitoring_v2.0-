#!/bin/bash

echo "Введите датуи время формата yyyy-mm-dd hh:mm начала удаления"
read data_time_start
echo "Введите датуи время формата yyyy-mm-dd hh:mm конца удаления"
read data_time_finish

if [[ ! "$data_time_start" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}$ ]] || [[ ! "$data_time_finish" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}$ ]]
then 
    echo "Не верный формат времени. Введите дату и время формата yyyy-m-d hh:mm"   
else
    mapfile -t all_path < <(find / -newermt "$data_time_start" ! -newermt "$data_time_finish" 2>/dev/null)
    for files in "${all_path[@]}"
    do 
        if [[ $files =~ _[0-9]{6}$ ]]
        then 
            find $files -exec rm -rf {} +
        fi
    done
fi
