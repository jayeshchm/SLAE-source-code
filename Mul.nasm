; THIS PROGRAM ILLUSTRATES MULTIPLICATION


global _start

section .text

	_start:
		
		
		; 8-bit multiplication
		
		mov al , 0x11 	
		mov bl , 0x2
		mul bl

		mov al, 0xFF
		mul bl

		;16-bit multiplication
		
		mov eax , 0x0		
		mov ebx , 0x0		

		mov ax , 0x1122
		mov bx , 0x0003
		mul bx

		mov ax , 0xFFFF
		mul bx

		; 32-bit multiplication

		mov eax , 0x11221122
		mov ebx , 0x00000004
		mul ebx

		mov eax , 0xFFFFFFFF
		mul ebx

		mov eax , 0x2
		mov ebx , 0x2
	
		; Multiplication using memory location

		mul byte [var1]
		mul word [var2]
		mul dword [var3]
	
		; Exit call
		
		mov eax , 0x1
		mov ebx , 0x2
		int 0x80
		
section .data
	
	var1 : db 0x11
	var2 : dw 0x1122
	var3 : dd 0x11221122






