# cobol-examples
The set of cobol examples

## Getting Started

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

### Compiling & executing using IDE (VSC)

#### IDE preparation
1. Install Visual Studio Code
2. Install plugis (I will keep improving the list.):
- Language support `ext install bitlang.cobol` ([description](https://marketplace.visualstudio.com/items?itemName=bitlang.cobol))
- GnuCobol support `ext install bitlang.gnucobol` ([description](https://marketplace.visualstudio.com/items?itemName=bitlang.gnucobol))
- COBOL flow visualization `ext install broadcomMFD.ccf` ([description](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.ccf))

#### IDE compiling & executing

1. If you are using linux, everything is configured out of the box. Type `Ctrl + Shift + B`. Enjoy!


## Usefull docs

1. [Picture symbols](docs/picture_symbols.md)


