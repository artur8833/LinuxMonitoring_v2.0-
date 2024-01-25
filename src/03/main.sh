#!/bin/bash

if ! [ $# -eq 1 ]
then 
    echo "Необходиммо ввести параметр очистки(ОДНО число):"
    echo "1-По лог файлу"
    echo "2-По дате создания"
    echo "3-По маске времени"
elif [[ "$1" -eq 1 ]]
then 
    source delete_by_log.sh
elif [[ "$1" -eq 2 ]]
then 
    source delete_by_data.sh
elif [[ "$1" -eq 3 ]]
then
    source delete_by_pattern.sh
else 
   echo "Параметр должен быть числом от 1 до 3"
fi

