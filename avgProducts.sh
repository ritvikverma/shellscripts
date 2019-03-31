#!/bin/bash
accessCount=0
fileCount=0
for file in *.log
do
    access=`cut -f4 "$file" | grep "/products/" | sort -u | wc -l`
    let "accessCount=$accessCount+$access"
    let "fileCount=$fileCount+1"
done
let "average=$accessCount/$fileCount"
echo "Average access: $average"