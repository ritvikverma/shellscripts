#!/bin/bash
for file in *.log
do
  topPage=(`./getProductAccess.sh "$file" | cut -f2 | sort -r | uniq -c | sort -n -r | head -n 1`)
  echo "$file: ${topPage[1]}"
  echo "Last three product page access:"
  grep "/products/" "$file" | tail -n 3
  echo
done