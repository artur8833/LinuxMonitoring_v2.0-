#!/bin/bash

if [ ! -d "$absolut_path" ]
then 
    echo "No such directory" 
elif [[ ! "$2" =~ ^[0-9]+$ ]]
then 
    echo "параметр 2 должен быть числом"
elif [[ ! "$3" =~ ^[a-zA-z]+$ ]]
then
    echo "параметр 3 cостоит только из букв английского алфавита"
fi
