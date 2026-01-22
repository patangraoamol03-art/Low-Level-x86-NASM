section .data
	msg db "%d",0
	msg1 db "Factorial is %d",10,0
	msg2 db "Enter a number :",0
section .bss
	n resd 1
section .text
	global main
	extern puts,printf,scanf
main:
	push msg2
	call puts
	add esp,4
	
	push n
	push msg
	call scanf
	add esp,8
	
	mov eax,1
	mov ecx,dword[n]
lp:	mul ecx
	dec ecx
	jnz lp
	jmp endp
endp:
	push eax
	push msg1
	call printf
	add esp,8
	ret
