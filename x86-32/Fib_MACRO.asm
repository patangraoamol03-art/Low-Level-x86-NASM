%macro Fibonacci 1
        mov ecx,%1

        mov eax,0
        pusha
        push eax
        push msg
        call printf
        add esp,8
        popa

        dec ecx
        cmp ecx,0
        jz %%endp

        mov ebx,1
        pusha
        push ebx
        push msg
        call printf
        add esp,8
        popa

        dec ecx
        cmp ecx,0
        jz %%endp


%%lp:
        add eax,ebx
        pusha
        push eax
        push msg
        call printf
        add esp,8
        popa
        dec ecx
        cmp ecx,0
        jnz %%lp


%%endp:

        push newline
        call printf
        add esp,4

%endmacro

section .data
        msg db "%d ",0
        newline db 10
section .text
        global main
        extern printf
main:
        Fibonacci 2
        Fibonacci 3
        Fibonacci 4
        Fibonacci 5
        ret
