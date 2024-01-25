#!/bin/bash
echo "Start find by pattern"


mapfile -t pattern_path < <(find / -name "*_250124" 2>/dev/null)

for files in "${pattern_path[@]}"
do 

    find $files -exec rm -rf {} + 2>/dev/null

done

# find / -regextype posix-extended -regex './^[a-zA-Z]_[0-9]{6}' 2>/dev/null 

# mapfile -t all_path < <(find / -type d -name "*_24[0-9][0-9][0-9][0-9]")

# find / -type d -regex '_[0-9]{6}$' 2>/dev/null >> pattern.txt