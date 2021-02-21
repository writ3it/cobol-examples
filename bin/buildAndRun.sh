#!/bin/bash

# $1 = ${workspaceFolder}
# $2 = ${file}
mkdir -p $1/build
dirPath=$(dirname "$2")
fileName=$(basename "$2" .cbl)
prefix=${fileName:0:3}

filesStr=''

for files in "$dirPath/$prefix*.cbl"; do
    for file in $files; do
        filesStr=$filesStr' '$file
    done
done


cobc -I$1/CopyBooks -I$1/CopyBooks/Public -x -o $1/build/$fileName $filesStr || exit 1
cd $1/build; ./$fileName
