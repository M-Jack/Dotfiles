#!/bin/sh

echo "Hello world!"
BASEDIR=$(dirname "$0")
NOT_LINK_LIST="LICENSE README.md link_dotfiles.sh background.jpg"

to_copy (){
	for NOT_LINK_NAME in $NOT_LINK_LIST
	do
		if [ "$1" = $NOT_LINK_NAME ]
		then
			return 1 
		fi
	done
	return 0
}

for FILE_PATH in $BASEDIR/*
do 
	
	FILE_NAME=$(basename $FILE_PATH)
	if to_copy $FILE_NAME
	then
		ln -svi $FILE_PATH "$HOME/.$FILE_NAME"
	fi
done
