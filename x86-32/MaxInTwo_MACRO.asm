%macro max 2
        mov eax,%1
        mov ecx,%2

        cmp eax,ecx
        jge %%mx
        mov eax,ecx

%%mx:

%endmacro
section .data
        msg db "Max is %d",10,0
section .text
        global main
        extern printf
main:
        max 40,20

        push eax
        push msg
        call printf
        add esp,8


        ret
