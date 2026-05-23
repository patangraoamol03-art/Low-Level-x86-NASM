section .data
        string1 db "string",0
        len1 equ $-string1
        string2 db "string",0
        len2 equ $-string2
        msg1 db "strings are equal",0
        msg2 db "strings are not equal",0
section .text
        global main
        extern puts
main:
        mov esi,string1
        mov edi,string2
        mov ecx,len1
        repe cmpsb
        jnz print1
        push msg1
        call puts
        add esp,4
        jmp end
print1:
        push msg2
        call puts
        add esp,4
end:
        ret
