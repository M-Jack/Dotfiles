#!/bin/sh

BASEDIR=$(dirname "$0")
NOT_LINK_LIST="LICENSE README.md link_dotfiles.sh"

# Test if the first argument is in the list of NOT_LINK_LIST which is the list
# of file not to be copied
to_copy (){
	for NOT_LINK_NAME in $NOT_LINK_LIST
	do
		if [ "$1" = "$NOT_LINK_NAME" ]
		then
			return 1 
		fi
	done
	return 0
}

# Move to the directory of the script
cd $BASEDIR

# Loop over all the file in the directory recursively
for FILE_PATH in $(find -P * -not -path '*/\.*' -type f)
do 
	
	FILE_NAME=$(basename $FILE_PATH)
	if to_copy $FILE_NAME
	then
		TARGET="$HOME/.$FILE_PATH"
		RESOLVE_LINK=$(readlink $TARGET)
		FULL_FILE_PATH=$(readlink -f $FILE_PATH)
		if [ "$RESOLVE_LINK" = "$FULL_FILE_PATH" ]
		then
			echo "$TARGET already points to $FILE_PATH"
		else
			[ $(dirname $FILE_PATH) != "." ] && \
				echo "mkdir -p $HOME/.$(dirname $FILE_PATH)"
			ln -svi "$FULL_FILE_PATH" "$TARGET"
		fi
	fi
done
