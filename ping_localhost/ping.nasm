; Title : Linux/x86 - ping localhost shellcode(53 bytes)
; Shellcode Author : Jayesh Vide ; SLAE
; Date : 2020-06-27
; Tested On : Ubuntu 12.04.1 LTS
; 

global _start

section .text

	_start:
		
		cltd:

		push edx			
		push 0x68732f2f			; /bin/sh
		push 0x6e69622f

		mov ebx , esp			; address of /bin/sh
		
		push edx			; ping localhost string
		push 0x74736f68
		push 0x6c61636f
		push 0x6c20676e
		push word 0x6970
		
		mov esi , esp			; address of ping localhost string

		push edx
		push word 0x632d		; -c string

		mov ecx , esp			; address of -c

		push edx			; NULL passed to top of the stack	
		push esi			; address of ping localhost passed to the stack
		push ecx			; address of -c passed to the stack
		push ebx			; address of command /bin/sh

		mov ecx , esp			; calling syscall
		
		push 0xb
		pop eax				; syscall no

		int 0x80
