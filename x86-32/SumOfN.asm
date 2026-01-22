section .data
	msg2 db "Sum is : %d",10,0
	msg1 db "Enter a number:",10,0
	msg dd "%d",0
	
section .bss
	n resd 1
section .text
	global main
	extern printf,puts,scanf
main:
    	push msg1
	call puts
	add esp,4
	
	push n
	push msg
	call scanf
	add esp,8
	mov ecx,0 
	xor esi,esi
	
lp:	
        inc ecx
	add esi,ecx
	cmp ecx,dword[n]
	jnz lp
	jmp endp
endp: 
	push esi
	push msg2
	call printf
	add esp,8
	ret
