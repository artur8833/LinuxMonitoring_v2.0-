#!/bin/bash
export log_file="$(pwd)/1.log"
START=$(date +%s.%N)
START_DATE=$(date +%H:%M:%S:%3N)

if ! [ -n "$3" ]
then 
    echo "Необходиммо ввести 3 параметра:"
    echo "Параметр 1 - список букв английского алфавита, используемый в названии папок (не более 7 знаков)."
    echo "Параметр 2 - список букв английского алфавита, используемый в имени файла и расширении (не более 7 знаков для имени, не более 3 знаков для расширения)."
    echo "Параметр 3 - размер файлов (в килобайтах, но не более 100)."
else 
    absolut_path="$1"
    source valid.sh 
fi


END=$(date +%s.%N)
STOP_DATE=$(date +%H:%M:%S:%3N)
DIFF=$(awk -v num1="$END" -v num2="$START" 'BEGIN { printf "%.1f", (num1 - num2) }')

echo "Time start script (in second) = $START_DATE"
echo "Time start script (in second) = $START_DATE">> $log_file 
echo "Time end script (in second) = $STOP_DATE"
echo "Time end script (in second) = $STOP_DATE">> $log_file 
echo "Script execution time (in seconds) = $DIFF" 
echo "Script execution time (in seconds) = $DIFF">> $log_file