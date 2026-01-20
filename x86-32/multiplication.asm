section .data
        a dd 3
        b dd 5
        msg1 db "Value at a is %d",10,0      
        msg2 db "Value at b is %d",10,0
        msg db "Multiplication of %d and %d is %d",10,0
section .bss
        c resd 1
section .text
        global main
        extern printf
main:
        mov eax,dword[a]
        pusha
        push dword[a]
        push msg1
        call printf
        add esp,8
        popa

        mov ebx,dword[b]
        pusha
        push dword[b]
        push msg2
        call printf
        add esp,8
        popa

        mul ebx
        mov dword[c],eax

        push dword[c]
        push dword[b]
        push dword[a]
        push msg
        call printf
        add esp,16
        ret
