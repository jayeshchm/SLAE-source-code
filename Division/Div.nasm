; THIS PROGRAM ILLUSTRATES DIVISION

global _start

section .text

	_start:
		
		; 8-bit division
		
		mov dx , 0x0
		mov al , 0x22 + 0x1
		mov bl , 0x2
		div bl

		; 16-bit division
	
		mov dx , 0x0
		mov ax , 0xffff
		div bx

		mov dx , 0x0
		mov ebx, 0x010000
		mov ax , 0xffff
		div ebx
	
		; 32-bit division	
	
		mov edx , 0x0
		mov eax , 0xffffffff
		div ebx

		; Exit call
		mov eax , 0x1
		mov ebx , 0x2
		int 0x80	

