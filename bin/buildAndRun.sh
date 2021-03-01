#!/bin/bash

# $1 = ${workspaceFolder}
# $2 = ${file}

file=$(echo "$2" | sed "s#$1#/home/vagrant#")
/usr/bin/vagrant ssh cobol -c "cd bin/vagrant; ./build.sh /home/vagrant $file"