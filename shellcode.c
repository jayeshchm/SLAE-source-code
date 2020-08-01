#include<stdio.h>
#include<string.h>

/* 
Compilation and execution : gcc -fno-stack-protector -z execstack shellcode.c -o shellcode
Usage : ./shellcode
*/

unsigned char shellcode[] = "";    /* Add your shellcode here */

main()
{
	
	printf("Shellcode length: %d\n",strlen(shellcode));
	int (*ret)() = (int(*)())shellcode;
	ret();	
}
