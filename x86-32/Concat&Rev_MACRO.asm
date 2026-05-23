section .data
        string1 db "First",0
        len1 equ $-string1
        string2 db "Second",0
        len2 equ $-string2
section .bss
        string3 resb 100
        string4 resb 100
        len3 resd 1
%macro concat 5
        mov ecx,%2
        mov esi,%1
        mov edi,%5
        dec ecx
        repnz movsb
        mov ecx,%4
        mov esi,%3
        dec ecx
        repnz movsb
        inc edi
        mov byte[edi],0
%endmacro
%macro revstr 2
        mov esi,%1
        mov edi,%2
        add esi,11
        dec esi
        mov ecx,11

%%lp:   std
        lodsb
        cld
        stosb
        dec ecx
        cmp ecx,0
        jnz %%lp

%endmacro

%macro strlen 2
        mov esi,%1
        xor ecx,ecx

%%lp1:  cmp byte[esi],0
        jz %%endp
        inc ecx
        inc esi
        jmp %%lp1
%%endp:
        mov %2,ecx
%endmacro
section .text
        global main
        extern puts
main:
        concat string1,len1,string2,len2,string3
        push string3
        call puts
        add esp,4

        revstr string3,string4
        push string4
        call puts
        add esp,4

        strlen string3,dword[len3]
        push len3
        call puts
        add esp,4
        ret
