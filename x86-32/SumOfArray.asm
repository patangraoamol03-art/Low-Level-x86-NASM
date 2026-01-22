section .data
	array dd 10,30,34,23,57
	msg db "Addition is %d",10,0
section .bss
	sum resd 1
section .text
	global main
	extern printf
main: 
	mov dword[sum],0
	xor esi,esi
	xor ecx,ecx
	
loop:	mov ebx,array
	mov eax,4
	mul ecx
	add ebx,eax
	add esi,dword[ebx]
	inc ecx 
	cmp ecx,5
	jz endp
	jmp loop
endp:
	mov dword[sum],esi
	push dword[sum]
	push msg
	call printf
	add esp,8
	ret	
