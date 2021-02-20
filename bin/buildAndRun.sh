#!/bin/bash

# $1 = ${workspaceFolder}
# $2 = ${file}
mkdir -p $1/build
cobc -I$1/CopyBooks -I$1/CopyBooks/Public -x $2 -o $1/build/cobolprogram || exit 1
cd $1/build; ./cobolprogram