section .data 
	msg db "Enter a number",10,0
	msg1 db "The number is Odd",10,0
	msg2 db "The number is Even",10,0
	num dd "%d",10,0
section .bss
	n resd 1
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4
	
	push n
	push num
	call scanf
	add esp,8

 	xor edx,edx
	mov eax,dword[n]
	mov ebx,2
	div ebx
	cmp edx,0
	jnz odd
even:        
  	push msg2
	call printf
	add esp,4
	jmp end
odd:
        push msg1
	call printf
	add esp,4
end: 
	ret	
