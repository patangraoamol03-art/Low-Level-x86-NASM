section .data
        string db "Amol",10,0
        msg db "Lenght is : %d " ,10,0
section .text
        global main
        extern printf
main:
        mov esi,string
        xor ecx,ecx
lp:     cmp byte[esi],10
        jz endp
        inc ecx
        inc esi
        jmp lp
endp:
        push ecx
        push msg
        call printf
        add esp ,8
        ret
