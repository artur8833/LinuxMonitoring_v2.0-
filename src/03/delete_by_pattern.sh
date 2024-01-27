#!/bin/bash
echo "Start find by pattern"

mapfile -t pattern_path < <(find / -name "*_250124" 2>/dev/null)

for files in "${pattern_path[@]}"
do 

    find $files -exec rm -rf {} + 2>/dev/null

done