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

<<<<<<< HEAD
if [[ $markerh == 1 ]] 
then
	echo  формат ввода: tusk.sh [-d] [-v] [-h] файл1 [файл2] ... суффикс
	echo  команда переименовывает файлы добавляя суффикс перед расширением
	echo -h : выводит эту справку
       	echo -d : выводит имена старых файлов и то как они будут выглядеть после переименования, без изменения имен 
	echo -v : выводит имена переименованных файлов
	
	exit 0
fi
=======

marker=0

for var in $@
do
	if [[ $marker == 0 ]] &&  [[ "$var" != -* ]] && [[ $var == *.* ]] 
	then	
		old_name=""
		new_name=${var%.*}${suff}.${var##*.}
		
		if [[ $markerd == 0 ]] 
		then
			echo $var $new_name
		fi
		
		if [[ $markerd == 1 ]] 
		then
			old_name=$var
		fi
		
		if [[ $markerv == 1 ]] || [[ $markerd == 1 ]]  
		then
			echo $old_name $new_name
		fi
	elif [[ $var == -- ]]
	then
		marker=1
	fi
done
>>>>>>> testing_main_function
