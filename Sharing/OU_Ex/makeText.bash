#!/bin/bash
echo "Hay nhap ten file ban muon tao ra"
read newFile
while read text; do
	if [ "$text" != "exit" ]; then
		echo "$text" >> "$newFile";
	else
		break
	fi
done
