#!/bin/bash

if ! [ -n "$6" ]
then 
    echo "Необходиммо ввести 6 параметров:"
    echo "Параметр 1 - это абсолютный путь" 
    echo "Параметр 2 - количество вложенных папок."      
    echo "Параметр 3 - список букв английского алфавита, используемый в названии папок (не более 7 знаков)."    e
    echo "Параметр 4 - количество файлов в каждой созданной папке."
    echo "Параметр 5 - список букв английского алфавита, используемый в имени файла и расширении (не более 7 знаков для имени, не более 3 знаков для расширения)."
    echo "Параметр 6 - размер файлов (в килобайтах, но не более 100)."
else 
    absolut_path="$1"
fi

source valid.sh 

