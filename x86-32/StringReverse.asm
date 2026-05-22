section .data
        string db "AMOL",10,0
        len equ $-string-2
section .bss
        rstring resb 1
section .text
        global main
main:
        mov ecx,len
        mov esi,string
        add esi,ecx
        dec esi
        mov edi,rstring
lp:
        xor eax,eax
        mov al,byte[esi]
        mov byte[edi],al
        dec ecx
        dec esi
        inc edi

        cmp ecx,0
        jnz lp



        mov eax,4
        mov ebx,1
        mov ecx,rstring
        mov edx,4
        int 80h

        ret
