#!/bin/bash
highestCount=0
highestWord=""
highestFile=""
for file in *.txt
do
  keywordCount=(`./getKeyword.sh "$file"`)
  if [ "$highestCount" -lt "${keywordCount[1]}" ]
  then
    highestCount="${keywordCount[1]}"
    highestWord="${keywordCount[0]}"
    highestFile=$file
  fi
  wordCount=(`wc -w "$file"`)
  echo "$file: ${wordCount[0]} words"
  echo "Keyword: ${keywordCount[0]}"
  grep ${keywordCount[0]} "$file" | head -n 3
  echo
done

echo "The word is: '$highestWord' in $highestFile"
