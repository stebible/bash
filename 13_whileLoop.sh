#!/bin/bash


counter=0


while [ $counter -lt 5 ]
do
	echo "counter is: $counter"
	#counter=$(( $counter + 1 ))
	(( counter++ ))
	sleep 1
done

