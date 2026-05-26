section .data
        a dd 10,11,12,13,14,15,16,17,-1
        msg db "Sum is : %d",10,0
section .bss
        three resd 1
section .text
        global main
        extern printf
main:
        mov dword[three],3
        mov ebx,a
        xor edi,edi

lp:
        mov eax,dword[ebx]
        cmp eax,-1
        jz endp
        xor edx,edx
        div dword[three]
        cmp edx,0
        jz next
        add edi,dword[ebx]
next:
        add ebx,4
        jmp lp

endp:
        push edi
        push msg
        call printf
        add esp,8

        ret
