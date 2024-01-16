#!/bin/bash

foldername=$1
len_foldername=$(echo -n "$1" | wc -m)
date=$(date "+%d%m%y")

filename=$(echo $2 | cut -d. -f1)
len_filename=$(echo -n "$filename" | wc -m)
file_extension=$(echo $2 | cut -d. -f2)

size_file=$(echo "$3" | grep -o '^[0-9]*')

middle_position_for_folder=0
start_position_for_folder=1
last_position_for_folder=1

middle_position_for_filename=0
start_position_for_filename=1
last_position_for_filename=1

Free_space_GB=$(df -h / | tail +2 | head -2 | awk '{printf("%d", $4)}')

# добавляем все пути в которые можно что-то записать в массив 
mapfile -t all_path < <(find  /home/artur/school/DO4_LinuxMonitoring_v2.0-1/src/test -type d -writable ! -path '*/bin*' ! -path '*/sbin*' 2>/dev/null)
arr_size=${#all_path[*]}
((arr_size--))
# echo "arr_size==$arr_size"

function addWords() {
    original_string=$2
    len=$1
    while (($len<5))
    do
        original_string="$original_string${original_string: -1}"
        len=$[ $len + 1 ]
    done
    echo "$original_string"
}

function CreateName(){
    name=$1
    start_position=$2
    middle_position=$3
    last_position=$4
    len=$5
    name="${name:0:start_position}${name:middle_position:1}${name:last_position:len}"
    echo "$name"
}

foldername=$(addWords $len_foldername $foldername)
len_foldername=$(echo -n "$foldername" | wc -m)

filename=$(addWords $len_filename $filename)
len_filename=$(echo -n "$filename" | wc -m)

Free_space_GB=$(df -h / | tail +2 | head -2 | awk '{printf("%d", $4)}')

for path in "${all_path[@]}"
do
    echo "$path">>text.txt
done


while [ $Free_space_GB -gt 1 ]
do
    random_folder=$(shuf -i 0-$arr_size -n1)
    random_file=$(shuf -i 0-10 -n1)

    current_folder=$(find ${all_path[$random_folder]} -mindepth 1 -type d 2>/dev/null | wc -l )
    
    if (((($len_foldername+7))>=248))
    then 
        ((count_for_folder++))
        
        len_foldername=$(echo -n "$1" | wc -m)
        foldername=$1
        ((middle_position_for_folder++))

        if((count_for_folder>1))
        then 
            ((start_position_for_folder++))
            ((last_position_for_folder++))
        fi
    fi
    
    foldername=$(CreateName $foldername $start_position_for_folder $middle_position_for_folder $last_position_for_folder $len_foldername)
    len_foldername=$(echo -n "$foldername" | wc -m)

    # echo "foldername==$foldername"

    if (((($current_folder))<100))
    then
        # echo "$random_folder"
        # echo "${all_path[$random_folder]}" 
        cd "${all_path[$random_folder]}"
        # mkdir "$foldername"_"$date"
        echo "$(pwd)/$foldername"_"$date" >> $log_file
    fi

    Free_space_GB=$(df -h / | tail +2 | head -2 | awk '{printf("%d", $4)}')

    # echo "Free_space_GB==$Free_space_GB"

    for ((j=1;j<=$random_file && Free_space_GB > 1;j++))
    do 
        if (((($len_filename+7))>=248))
        then 
            ((count_for_filename++))
            filename=$(echo $2 | cut -d. -f1)
            len_filename=$(echo -n "$filename" | wc -m)
            ((middle_position_for_filename++))

            if((count_for_filename>1))
            then 
                ((start_position_for_filename++))
                ((last_position_for_filename++))
            fi
        fi

        filename=$(CreateName $filename $start_position_for_filename $middle_position_for_filename $last_position_for_filename $len_filename)
        len_filename=$(echo -n "$filename" | wc -m)
        echo "filename==$filename"
        # fallocate -l "$size_file"KB "$filename"."$file_extension"_"$date"
        echo -e "$(pwd)/$filename"."$file_extension"_"$date  $date  $size_file"kb"" >> $log_file
        Free_space_GB=$(df -h / | tail +2 | head -2 | awk '{printf("%d", $4)}')

    done
done






