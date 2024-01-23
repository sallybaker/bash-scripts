#!/bin/bash
# Moves files to a specified folder
# to Execute: ./mv-to-x.sh filename.txt /filepath

input=$1
echo "$input" 
filepath=$2 
echo "$filepath"

#capture IFS value 
# Note: this step is required to deal with filepaths that include spaces 
exifs="$IFS"
IFS=$'\n'

for line in $(cat $input) 
do 
    filename=$(basename $line) 
    echo "processing: $line" 
    mv "$line" "$filepath/$filename"
    echo "$filepath/$filename" >> /tmp/mv-output.txt
done 

# reset IFS 
IFS="$exifs"

mvCount=$(wc -l /tmp/mv-output.txt)
echo "$mvCount files moved" 
echo "All done" 