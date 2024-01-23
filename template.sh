#!/bin/bash
# Description here 
# to Execute: ./script-name.sh filename.txt /filepath

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
done 

# reset IFS 
IFS="$exifs"

echo "All done" 

