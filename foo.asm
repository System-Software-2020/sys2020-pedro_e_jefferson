global _start

section .text

_start:
        push ebp            ; Save original ebp
        mov ebp,esp         ; Save original esp
        add esp,0x8         ; We have to skip the return address  
        pop eax             ; pega da pilha e joga no registrador eax
        pop ebx             ; pega da pilha e joga no registrador ebx
        add eax,ebx         ; soma eax com ebx e joga o resultado no eax
        mov esp,ebp         ; restore original esp
        pop ebp             ; Restore original ebp
        ret                 ; retorna 
