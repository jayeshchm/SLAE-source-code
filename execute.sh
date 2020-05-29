#!/bin/bash

echo '[+] Compiling...'
nasm -f elf32 -o $1.o $1.nasm

echo '[+] Linking...'
ld -o $1 $1.o

echo '[+] Done...'


# SHELLCODE COMPILATION ===> gcc -fno-stack-protector -z execstack shellcode.c -o shellcode

echo '[+] Generating shellcode...' ; echo 

echo '[+] Checking for null bytes...' ; echo 

objdump -d ./$1 -M intel ; echo 


objdump -d ./$1 |grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'


