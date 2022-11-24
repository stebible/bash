#!/bin/bash

FOLDER="/home/vagrant/projectFolder"

#Get all files in the folder
#ls -l $FOLDER | awk '{print $8,$9}' >> text.log

#time=$(ls -l $FOLDER | cut -d ' ' -f8)


count=0

while read line
do
	file=$(echo $line | awk '{print $2}')
	time=$(echo $line | awk '{print $1}')
	
	if [[ -z $line ]]
	then
	continue
	fi
	(( count++ ))
	echo "filename: $file, time: $time, $count" 	
done < logs


#Add files into a text files

