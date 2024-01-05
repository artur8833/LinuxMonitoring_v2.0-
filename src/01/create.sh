#!/bin/bash

foldername=$3
len_foldername=$(echo -n "$3" | wc -m)
date=$(date "+%d%m%y")

filename=$(echo $5 | cut -d. -f1)
len_filename=$(echo -n "$filename" | wc -m)

# echo "$filename"
# echo "$len_filename"
echo "$foldername"
# echo "$len_foldername"

start_position=1
last_position=1


function myfunc() {
    local original_string=$2
    len=$1
    echo "$len"
    while (($len<4))
    do
        original_string="$original_string${original_string: -1}"
        len=$[ $len + 1 ]
    done
    echo "$len"
    echo "$original_string"
}

foldername=$(myfunc $len_foldername $foldername)
echo "$foldername"


while (($len_foldername<4))
do
    foldername="$foldername${foldername: -1}"
    ((len_foldername++))
done


# рабоатет 
# for (( i=1; i<=$2 ; i++ ))
# do
#     if (((($len_foldername+7))>=255))
#     then 
#         ((count++))
#         len_foldername=$(echo -n "$3" | wc -m)
#         foldername=$3
#         ((middle_position++))

#         if((count>1))
#         then 
#             ((start_position++))
#             ((last_position++))
#         fi
#     fi
    
#     mkdir "$foldername"_"$date" ; cd "$foldername"_"$date"
    
#     # for (( i=1; i<=$4 ; i++ ))
#     # do 

#     # done

#     foldername="${foldername:0:start_position}${foldername:middle_position:1}${foldername:last_position:len_foldername}"
#     ((len_foldername++))
# done