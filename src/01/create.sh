#!/bin/bash

foldername=$3
len_foldername=$(echo -n "$3" | wc -m)
date=$(date "+%d%m%y")

filename=$(echo $5 | cut -d. -f1)
len_filename=$(echo -n "$filename" | wc -m)

# echo "$filename"
# echo "$len_filename"
# echo "$foldername"
# echo "$len_foldername"

start_position=1
last_position=1

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
    len=$2
    if (((($2+7))>=255))
    then 
        ((count++))
        len=$(echo -n "$3" | wc -m)
        foldername=$3
        ((middle_position++))

        if((count>1))
        then 
            ((start_position++))
            ((last_position++))
        fi
    fi
    name="${name:0:start_position}${name:middle_position:1}${name:last_position:len_foldername}"
    ((len++))
    echo "$name"
}

addWords "$len_foldername" "$foldername"
echo "foldername= $foldername"
echo "len_foldername= $len_foldername"
# filename=$(addWords $len_filename $filename)
# echo "filename= $filename"
# echo "len_filename= $len_filename"




# рабоатет 

for (( i=1; i<=$2; i++ ))
do

    # if (((($len_foldername+7))>=255))
    # then 
    #     ((count++))
    #     len_foldername=$(echo -n "$3" | wc -m)
    #     foldername=$3
    #     ((middle_position++))

    #     if((count>1))
    #     then 
    #         ((start_position++))
    #         ((last_position++))
    #     fi
    # fi



    # mkdir "$foldername"_"$date" ; cd "$foldername"_"$date"
    foldername=$(CreateName $foldername $len_foldername)

    filename=$(CreateName $filename)
    
    
    # foldername="${foldername:0:start_position}${foldername:middle_position:1}${foldername:last_position:len_foldername}"
    # echo "$foldername"
    # echo "$len_foldername"
    # echo "$filename"
    # ((len_foldername++))
done



