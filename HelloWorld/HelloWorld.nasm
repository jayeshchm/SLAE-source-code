; This program prints "Hello World" message on terminal

;  Description:
; .text section contains actual code 
; .data section contains initialized variables
; .bss section contains uninitailzed variables if any
; 
; Compilation  : nasm -f elf32 -o HelloWorld.o HelloWorld.nasm
; Linking      : ld HelloWorld.o -o HelloWorld
; Execution    : ./HelloWorld

global _start

section .text

	_start:        

		xor eax , eax		; eax=NULL
		xor ebx , ebx		; ebx=NULL
		xor edx , edx		; edx=NULL
		
		;write syscall

		mov al , 0x4		; write syscall no
		mov bl , 0x1		; fd=0x1 i.e. write -> First arg
		mov ecx , message	; address of messaage -> Second arg
		mov dl , mlen		; length of message -> Third arg
		int 0x80		; informs kernel to execute syscall

		; exit syscall
		
		mov al , 0x1		; exit syscall no
		mov bl , 0x0		; exit code -> First arg
		int 0x80		; informs kernel to execute exit syscall

section .data

	message : db "Hello World" , 0xA
	mlen equ $-message
