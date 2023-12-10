#!/bin/bash

marker=0
markerd=0
markerv=0
markerh=0
suff=""

for var in $@
do
	if [[ $var == "--" ]]
	then
		marker=1
	elif [[ $var == "-d" ]] && [[ $marker == 0 ]]
	then
		markerd=1
	elif [[ $var == "-v" ]] && [[ $marker == 0 ]]
	then
		markerv=1
	elif [[ $var == "-h" ]] && [[ $marker == 0 ]]
	then
		markerh=1
	elif [[ $var == "-*" ]] && [[ $marker == 0 ]]
	then
		echo option does not exist >&2
		exit 2
	else
		suff=$var
	fi
done

