section .data
         a dd 10
         msg db "Low level assembly programming",10,0
section .bss
         b resb 1
section .text
         global main
         extern printf
main:
         push msg
         call printf
         add esp,4
         ret
