; This program illustrates open and read syscall 
; 
; Compilation : nasm -f elf32 -o open_read.o open_read.nasm
; Execution   : ld -o open_read open_read.o

global _start

section .text

	_start:
		
		; open syscall

		xor ecx , ecx		; ecx=NULL => 
		mul ecx			; opens file readonly mode
		push ecx		; NULL
		push 0x64777373		; dwss
		push 0x61702f63		; ap/c
		push 0x74652f2f		; te//
		mov ebx , esp		; address of /etc/passwd i.e. buf
		mov al , 0x5		; open syscall no
		int 0x80		; informs kernel for execution

		; read syscall

		xchg eax , ebx		; return value => fd 
					
		xchg eax , ecx		; address of buf
		xor edx , edx		; NULL
		mov word dx , 0xfff	; edx=4095
		inc edx			; max buffer size => 4096 bytes
		mov al , 0x3		; read syscall no
		int 0x80		; informs kernel for execution

		; write syscall

		xchg eax , edx		; return value => fd
					; no of bytes read
		xor ebx , ebx		; NULL
		mov bl , 0x1		; stdout
		xor eax , eax		; NULL
		mov al , 0x4		; write syscall no
		int 0x80		; informs kernel for execution

		; Exit syscall
		
		xor eax , eax		; NULL
		xor ebx , ebx		; NULL
		mov al , 0x1		; exit syscall no
		mov bl , 0x2		; exit code
		int 0x80		; informs kernel for execution
