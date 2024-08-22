BITS 64
SECTION .text
    global strrchr          ; make the function available to other files

strrchr:
    mov rax, 0              ; rax = null

.strrchr_loop:
    cmp byte [rdi], sil     ; compare the byte at rdi to sil
    je .strrchr_set_value   ; if they are equal, jump to strrchr_set_value
    cmp byte [rdi], 0       ; compare the byte at rax to 0
    je .strrchr_end         ; if they are equal, jump to strrchr_end
    inc rdi                 ; increment rdi
    jmp .strrchr_loop       ; jump to strrchr_loop
.strrchr_set_value:
    mov rax, rdi            ; move rdi to rax
    cmp byte [rdi], 0       ; compare the byte at rdi to 0
    je .strrchr_end         ; if they are equal, jump to strrchr_end
    inc rdi                 ; increment rdi
    jmp .strrchr_loop       ; jump to strrchr_loop

.strrchr_end:
    ret                     ; return