#!/bin/bash

uploadFile(){
    local name=`echo "C$1" | tr -dc '[:alnum:]\n\r' | tr '[:lower:]' '[:upper:]'`
    local firstPart=${name:0:8}
    firstPart="${firstPart^^}"
    local secondPart='NONE'

    local username='HERC02'

    if [ ${#name} -ge 8 ]; then
        secondPart=${name:8:8}
        secondPart="${secondPart^^}"
    fi

    local timeOff='0.2'

    sudo s3270 -trace -tracefile s3270.log -model 4 <<EOF
asci()
connect("10.0.1.4:3270")
wait($timeOff,seconds)
clear
reset
wait($timeOff,seconds)
string("$username")
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
PrintText(file, screen1.log)
string("CUL8TR")
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
PrintText(file, screen2.log)

string("2")
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
string("6")
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
PrintText(file, screen3.log)

Transfer(Direction=send, HostFile=VSCODE.$firstPart.$secondPart, LocalFile=$2, Recfm=fixed, Exist=replace,Lrecl=80)
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
PrintText(file, screen4.log)


pf(3)
wait($timeOff,seconds)
pf(3)
wait($timeOff,seconds)
pf(3)
wait($timeOff,seconds)
PrintText(file, screen5.log)



string("X")
wait($timeOff,seconds)
PrintText(file, screen6.log)
enter
wait($timeOff,seconds)


string("logoff")

wait($timeOff,seconds)
PrintText(file, screen7.log)
enter
wait($timeOff,seconds)
PrintText(file, screen8.log)

disconnect
exit
EOF
    echo "$2 is uploaded as $username.$firstPart.$secondPart.VSCODE"
}



submitJcl(){
    local jclName='HERC02.VSCODE.CJCL.NONE'

    local username='HERC02'

    local timeOff='0.2'

    sudo s3270 -trace -tracefile s3270.log -model 4 <<EOF
asci()
connect("10.0.1.4:3270")
wait($timeOff,seconds)
clear
reset
wait($timeOff,seconds)
string("$username")
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
PrintText(file, screen1.log)
string("CUL8TR")
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
PrintText(file, screen2.log)

string("1")
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
string("3.4")
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
string("$jclName")
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
Tab
Tab
string("e")
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
string("submit")
wait($timeOff,seconds)
enter
wait($timeOff,seconds)
enter
wait($timeOff,seconds)


pf(3)
wait($timeOff,seconds)
pf(3)
wait($timeOff,seconds)
pf(3)
wait($timeOff,seconds)
pf(3)
wait($timeOff,seconds)
PrintText(file, screen5.log)


string("X")
wait($timeOff,seconds)
PrintText(file, screen6.log)
enter
wait($timeOff,seconds)


string("logoff")

wait($timeOff,seconds)
PrintText(file, screen7.log)
enter
wait($timeOff,seconds)
PrintText(file, screen8.log)

disconnect
exit
EOF

cat << EOF                                                                                                                                                                                                                
       _               _                    _       _            
   ___| |__   ___  ___| | __     _ __  _ __(_)_ __ | |_ ___ _ __ 
  / __| '_ \ / _ \/ __| |/ /    | '_ \| '__| | '_ \| __/ _ \ '__|
 | (__| | | |  __/ (__|   <     | |_) | |  | | | | | ||  __/ |   
  \___|_| |_|\___|\___|_|\_\____| .__/|_|  |_|_| |_|\__\___|_|   
                          |_____|_|                                                                                                                                                                                                                                           
EOF
}