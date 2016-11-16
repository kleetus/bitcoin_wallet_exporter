## Purpose
Intended to replace pywallet. The purpose is to export/extract all key-related data from a Bitcoin "wallet.dat" file.

If you ever needed to pluck out data from a Bitcoin Core wallet.dat file, you know it isn't as simple as cracking open a text editor or grepping through a file. You need to understand (at least to some small degree) the structure of this file and the serialization formats contained within it.

Clearly, this task is VERY SENSITIVE in nature. DO NOT feed your wallet into just any exporter tool. You should read this code and understand what it is doing. If you can't do that, then ask a trusted friend to help you out.

## Security measures used

1. Entire program is < 400 lines of straight-forward C code.
2. Berkeley DB is the only dependency. If included Makefile is used, then libdb.a will be linked statically.
3. All memory used within the program will be resident in the program data region, there is no way for sensitive memory to be paged out into not secure swap files or compressed elsewhere.
4. The program does not ask for or otherwise require a master passphrase in order to do its job. It simply writes a json file with cipherText for later processing by other tools.
5. The encrypted master passphrase, salt, hash paramaters and key data are exported to a file of your choice to a file or stdout.

## Building

You will need standard C header files (stdlib.h, string.h, stdarg.h, stdio.h) as well as a C library such as LibSystem.B.dylib (mac), glibc (linux), libc (unix). Most systems have these things. On mac, you may need Xcode and system headers. Please get this from the app store. Then,

Mac-only
```bash
$ xcode-select --install
```
Ensure you have headers in /usr/local/include

Linux is fairly dependent on what distro you use.

Mac/Unix/Linux
```bash
$ make
```
## Usage

Simple
```bash
$ exporter -d wallet.dat -silent > output.json
```

Give me details but output json to a file
```bash
$ exporter -d wallet.dat -o output.json
```

As input to gpg
```bash
$ exporter -d wallet.dat -silent | gpg -e -r bob > output.json.gpg
```





