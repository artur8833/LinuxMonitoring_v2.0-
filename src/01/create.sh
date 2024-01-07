#!/bin/bash

foldername=$3
len_foldername=$(echo -n "$3" | wc -m)
date=$(date "+%d%m%y")

filename=$(echo $5 | cut -d. -f1)
len_filename=$(echo -n "$filename" | wc -m)
file_extension=$(echo $5 | cut -d. -f2)

echo "file_extension=$file_extension"

middle_position_for_folder=0
start_position_for_folder=1
last_position_for_folder=1

middle_position_for_filename=0
start_position_for_filename=1
last_position_for_filename=1

# функция приведения названия к 4 символам 
function addWords() {
    original_string=$2
    len=$1
    while (($len<4))
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

for (( i=1; i<=$2; i++ ))
do
  if (((($len_foldername+7))>=255))
    then 
        ((count_for_folder++))
        
        len_foldername=$(echo -n "$3" | wc -m)
        foldername=$3
        ((middle_position_for_folder++))

        if((count_for_folder>1))
        then 
            ((start_position_for_folder++))
            ((last_position_for_folder++))
        fi
    fi



    foldername=$(CreateName $foldername $start_position_for_folder $middle_position_for_folder $last_position_for_folder $len_foldername)
    len_foldername=$(echo -n "$foldername" | wc -m)

    mkdir "$foldername"_"$date" ; cd "$foldername"_"$date"
    
    for ((j=1;j<=$4;j++))
    do 
        if (((($len_filename+7))>=255))
        then 
            ((count_for_filename++))
            filename=$(echo $5 | cut -d. -f1)
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
        
        fallocate -l 2K "$filename"."$file_extension"_"$date"
        
    done

done 


