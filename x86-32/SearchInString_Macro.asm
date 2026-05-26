section .data
        char db 'a',0
        string db "yukta keshav patil",10,0
        msg db "%d",0
        length equ $-string
section .bss
        len resd 1
%macro count 4
        mov edi,%1
        mov ecx,%4
        xor eax,eax
        xor edx,edx

%%lp:   mov al,%2
        repne scasb
        inc edx
        cmp byte[edi],0
        jnz %%lp
        dec edx
        mov dword[%3],edx
%endmacro
section .text
        global main
        extern printf
main:
        count string,byte[char],len,length

        push dword[len]
        push msg
        call printf
        add esp,8

        ret
