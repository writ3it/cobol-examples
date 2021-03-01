#!/bin/bash

# $1 = ${workspaceFolder}
# $2 = ${file}
mkdir -p $1/build
mkdir -p $1/build/precompiled/
dirPath=$(dirname "$2")
fileName=$(basename "$2" .cbl)
prefix=${fileName:0:3}
jclFileName=$dirPath/$fileName.jcl

echo "jcl: $jclFileName"

#
# FUNCTIONS
#

source mainframeUtil.sh

#
# MAIN CODE
#
if test -f "$jclFileName"; then
    # Compilation on hercules with JCL
     for files in "$dirPath/$prefix*.cbl"; do
        for file in $files; do
            pfileName=$(basename "$file" .cbl)
            destFile=$1/build/precompiled/$pfileName.cob

            esqlOC -static -o $destFile $file
            
            uploadFile $pfileName $destFile
        done
    done

    uploadFile "JCL" $jclFileName

    submitJcl

    # /Compilation on hercules with JCL
else
    # gnuCOBOL
    filesStr=''



    for files in "$dirPath/$prefix*.cbl"; do
        for file in $files; do
            pfileName=$(basename "$file" .cbl)
            destFile=$1/build/precompiled/$pfileName.cob

            esqlOC -static -o $destFile $file
            
            filesStr=$filesStr' '$destFile
        done
    done


    cobc  -I$1/CopyBooks -I$1/CopyBooks/Public -fixed -static -x -o $1/build/$fileName $filesStr -locsql || exit 1
    cd $1/build; OCSQL_LOGLEVEL=0 ./$fileName
    # /gnuCOBOL
fi
