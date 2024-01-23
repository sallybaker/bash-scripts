#!/bin/bash
# Description here 
# to Execute: ./get-hashes.sh /tmp/input-file.txt /tmp/output-file.txt

input=$1
echo "$input" 
output=$2 
echo "output"

#capture IFS value 
# Note: this step is required to deal with filepaths that include spaces 
exifs="$IFS"
IFS=$'\n'

for line in $(cat $input) 
do 
    echo "processing: $line"
    filename=$(basename $line) 
    hash=$(md5sum "$line" | awk '{print $1}')
    newline="$line|$filename|$hash"
    echo "$newline" >> $output
done 

# reset IFS 
IFS="$exifs"

hashCount=$(wc -l $output)
echo "$hashCount Hash files generated"
echo "All done" 

