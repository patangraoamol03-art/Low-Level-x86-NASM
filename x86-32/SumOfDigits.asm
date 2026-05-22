section .data
        num dd 12345
        msg db "sum of digits of the %d is: %d",10,0 
        ten dd 10
section .bss
        sum resd 1
section .text
        global main
        extern printf
main:
        mov dword[sum],0
        mov eax,dword[num]
lp:

        cmp eax,0
        jz endp
        xor edx,edx
        mov ebx,dword[ten]
        div ebx

        add dword[sum],edx
        jmp lp

endp:
        push dword[sum]
        push dword[num]
        push msg
        call printf
        add esp,12
        ret
