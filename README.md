# cobol-examples
#### (under construction)
The set of cobol examples

## Requirements

PC with linux OS and Vagrant installed. If you are using Windows, translate bin/buildAndRun.sh and bin/mf-terminal.sh (or run over WSL?).

## Getting Started

1. Install Vagrant ([documentation](https://www.vagrantup.com/docs/installation)).
- Language support `ext install bitlang.cobol` ([description](https://marketplace.visualstudio.com/items?itemName=bitlang.cobol))
- GnuCobol support `ext install bitlang.gnucobol` ([description](https://marketplace.visualstudio.com/items?itemName=bitlang.gnucobol))
- COBOL flow visualization `ext install broadcomMFD.ccf` ([description](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.ccf))
3. Do in the terminal `$ vagrant up`.
4. Open selected program in VSC.
5. Type `Ctrl + Shift + B`. Enjoy!
6. After work, do `$ vagrant halt` to stop virtual machines.

## Table of Contents

1. [examples/gnucobol](examples/gnucobol/README.md) - gnucobol dedicated examples
    - [motto.cbl](examples/motto.cbl) - gnuCobol motto!
    - [basic/01_hello_world.cbl](examples/gnucobol/basic/01_hello_world.cbl) - Greeting the World!
    - [basic/02_variables.cbl](examples/gnucobol/basic/02_variables.cbl) - Declaring "variables" (pictures).
    - [basic/03_add.cbl](examples/gnucobol/basic/03_add.cbl) - Math: add two numbers.
    - [basic/04_subtract.cbl](examples/gnucobol/basic/04_subtract.cbl) - Math: subtract two numbers. User input.
    - [basic/05_multiply.cbl](examples/gnucobol/basic/05_multiply.cbl) - Math: multiply two numbers.
    - [basic/06_variables.cbl](examples/gnucobol/basic/06_variables.cbl) - Declaring "variables" (pictures).
    - [basic/07_compute.cbl](examples/gnucobol/basic/07_compute.cbl) - Math: calculating the result of a quadratic function.
    - [basic/08_redefines.cbl](examples/gnucobol/basic/08_redefines.cbl) - Redefines. Kind of alias of "variable" name (and "variable" type).
    - [basic/09_rename.cbl](examples/gnucobol/basic/09_rename.cbl) - Rename. (Share "sub variables" across two records.)
    - [basic/10_copybook.cbl](examples/gnucobol/basic/10_copybook.cbl) - including other source files.
    - [control/01_if.cbl](examples/gnucobol/control/01_if.cbl) - if statement and comparison operators.
    - [control/02_loops.cbl](examples/gnucobol/control/02_loops.cbl) - simple loop. Iterate over the code! :)
    - [control/03_more_loops.cbl](examples/gnucobol/control/03_more_loops.cbl) - simple loop. More classic loops.
    - [control/04_goto.cbl](examples/gnucobol/control/04_goto.cbl) - GOTO and GOTO Monster (something like a switch statement).
    - [database/mariadb/01_select.cbl](examples/gnucobol/database/mariadb/01_select.cbl) - SELECT SQL Statement.
    - [database/mariadb/02_insert_update.cbl](examples/gnucobol/database/mariadb/02_insert_update.cbl) - INSERT and UPDATE SQL Statements.
    - [database/mariadb/03_delete.cbl](examples/gnucobol/database/mariadb/03_delete.cbl) - DELETE SQL Statement.
    - [database/mariadb/04_ddl.cbl](examples/gnucobol/database/mariadb/01_select.cbl) - CREATE TABLE and DROP TABLE SQL Statement.
    - [file/01_read.cbl](examples/gnucobol/file/01_read.cbl) - read line sequentially.
    - [file/02_write.cbl](examples/gnucobol/file/02_write.cbl) - read line sequentially and write to indexed file.
    - [file/03_rewrite.cbl](examples/gnucobol/file/03_rewrite.cbl) - something like SQL UPDATE.
    - [sorting/01_sort.cbl](examples/gnucobol/sorting/01_sort.cbl) - sort file.
    - [string/01_inspect.cbl](examples/gnucobol/string/01_inspect.cbl) - count characters, replacing.
    - [string/02_concatenation.cbl](examples/gnucobol/string/02_concatenation.cbl) - strings concatenation.
    - [string/03_split.cbl](examples/gnucobol/string/03_split.cbl) - split string by delimiter.
    - [subroutines/01_call_main.cbl](examples/gnucobol/subroutines/01_call_main.cbl) - call subroutine with params.
    - [subroutines/01_call_subroutine.cbl](examples/gnucobol/subroutines/01_call_subroutine.cbl) - example of subroutine. (Is automatically compiled with 01_call_main)
2. [examples/mainframe](examples/mainframe/README.md) - Hercules dedicated examples
    - [basic/01_hello_world.cbl](examples/mainframe/basic/01_hello_world.cbl) - Greeting the World!
3. Mainframe/Printers - Hercules printers output files
    - prt00e.txt - A device

GnuCobol doesn't support OOP yet.

## Environment architecture

![Environment architecture diagram](docs/vagrant_arch.png)

## Building (Ctrl+Shift+B)

When you type `Ctrl + Shift + B`, vscode will execute build task that runs buildAndRun.sh. That magic script looking for JCL corresponding to your CBL file. If the JCL is found then your program will be transfer to the mainframe and submit using JCL. If not, your program will be compile with gnuCobol. Each CBL file is precompiled with esqlOC.

## ATTENTION

This repository is under development. Currently building a program using the mainframe does not support copybooks. The connection to mariadb has not been tested. VMs builded with Vagrantfile are not secured. Do not use them for sensitive data or production purposes. Building script lacks of error checking.

## Important questions and answers

### What is the mainframe?

The mainframe is a large computer designed to process large amounts of business data and I/O operations. [Detailed answer.](https://www.youtube.com/watch?v=eGlC3WXL8FQ)

### Why mainframe variant of buildAndRun is so weird?

The actual compilation and running of the program are run in the job queue processed by the mainframe. This makes the process asynchronous to VSCode. Also for this reason, the program output is available on the output device (usually the printer) and not on the terminal. [See compilation using the old mainframe. Hercules works similarly.](https://www.youtube.com/watch?v=uFQ3sajIdaM)

Probably this process will be improved in the future.

### How to log into Hercules?

Type `./bin/mf-terminal.sh` in your terminal. The default user (f.e.) is HERC02 (password: CUL8TR). After finishing work **REMEMBER** to **LOGOFF** (before disconnecting).

## Usefull docs

1. [Picture symbols](docs/picture_symbols.md)
2. [Awesome COBOL list!](https://github.com/writ3it/awesome-cobol)