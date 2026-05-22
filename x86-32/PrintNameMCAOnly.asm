section .data
           database db "25112030,Amol S Patangrao,M,MCA,2025",10
                    db "25112048,Prasad L Sutar,M,MCA,2025",10
                    db "25112003,Prachi N Kondhare,F,MSC,2025",10
                    db "25112015,Harshal S Alam,M,MCA,2025",10
                    db "22112045,Amli S Patangrao,F,MCA,2025",10,0
        cmpc db"MCA",0
        len equ $-database
        newline db 10
section .text
        global main
main:
        mov ecx,len
        mov edi,database
skipComma:
        xor eax,eax
        mov al,','
        repne scasb
        mov esi,edi
catchName:

        xor eax,eax
        mov al,' ' 
        repne scasb
        mov edx,edi
        sub edx,esi

skip2Comma:
        xor eax,eax
        mov al,','
        repne scasb
        repne scasb ;;;registers used edx ebx ecx edi
compareMCA:
        push esi
        push ecx
        mov ecx,3
        mov esi,cmpc
        repe cmpsb
        pop ecx
        pop esi
        jnz lp
print:

        push ecx
        mov eax,4
        mov ebx,1
        mov ecx,esi
        ;;mov edx,10
        int 80h
        pop ecx

        push ecx
        mov eax,4
        mov ebx,1
        mov ecx,newline
        mov edx,1
        int 80h
        pop ecx


lp:
        mov al,10
        repne scasb
        cmp byte[edi],0
        jnz skipComma

        ret
