# cobol-examples
The set of cobol examples

## Getting Started

1. Install Vagrant ([documentation](https://www.vagrantup.com/docs/installation)).
2. Install Visual Studio Code ([documentation](https://code.visualstudio.com/)), and plugins listed below:
- Language support `ext install bitlang.cobol` ([description](https://marketplace.visualstudio.com/items?itemName=bitlang.cobol))
- GnuCobol support `ext install bitlang.gnucobol` ([description](https://marketplace.visualstudio.com/items?itemName=bitlang.gnucobol))
- COBOL flow visualization `ext install broadcomMFD.ccf` ([description](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.ccf))
3. Do in the terminal `$ vagrant up`.
4. Open selected program in VSC.
5. Type `Ctrl + Shift + B`. Enjoy!

## Local building

### GnuCobol installation

```bash
$ sudo apt-get install gnucobol open-cobol
```

### Compiling & executing using CLI

1. Compile program

```bash
$ cobc -x basic/01_hello_world.cob
```

2. Execute 
```
$ ./01_hello_world
```


## Usefull docs

1. [Picture symbols](docs/picture_symbols.md)


