BITS 64
SECTION .text
    global strcspn

strcspn:
    mov rax, 0              ; set rax to 0
    mov rcx, rsi            ; move rsi to rcx (arg 2)

.strcspn_outer_loop:
    cmp byte [rdi], 0       ; check if rdi is \0
    je .strcspn_end         ; if it is, return
.strcspn_inner_loop:
    cmp byte [rcx], 0       ; check if rcx is \0
    je .strcspn_reloop      ; if it is, loop
    mov r8b, byte [rdi]     ; move rdi to r8b
    cmp r8b, byte [rcx]     ; compare r8b and rcx
    je .strcspn_end         ; if they are, jump
    inc rcx                 ; increment rcx
    jmp .strcspn_inner_loop ; loop
.strcspn_reloop:
    inc rdi                 ; increment rdi
    inc rax                 ; increment rax
    mov rcx, rsi            ; move rsi to rcx (arg 2)
    jmp .strcspn_outer_loop ; loop

.strcspn_end:
    ret