#!/bin/bash
c3270 -trace << EOF
connect(10.0.1.4:3270)
enter
string('HERC01')
enter
string('CUL8TR')
enter
enter
enter

string('1')
enter

string('3.2')
enter

string('a')
Tab
string('hwrl')
Tab
string('auto')
Tab
string('vscode')
enter

Tab
string('FB')
Tab
string('80')
Tab
string('800')
Tab
Tab
Tab
Tab
string('10')      
Tab
string('5')
enter

PF(3)

Disconnect
EOF