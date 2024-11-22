#!/bin/bash
read s1;read s2;read s3
if [ "$s1" -lt "$s2" ]
then
	if [ "$s2" -lt "$s3" ]
	then 
		echo "$s3 la so lon nhat"
	else
		echo "$s2 la so lon nhat"
	fi
else
	echo "$s1 la so lon nhat"
fi
