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
		mov ax , 0x1122
		div bx
		mov dx , 0x0
		mov ax , 0x1144 + 0x1
		div bx
	
		; Exit call
		mov eax , 0x1
		mov ebx , 0x2
		int 0x80
