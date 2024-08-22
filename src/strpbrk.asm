BITS 64
SECTION .text
    global strpbrk

strpbrk:
    mov rax, rdi            ; move rdi to rax (arg 1)
    mov rcx, rsi            ; move rsi to rcx (arg 2)

.strpbrk_outer_loop:
    cmp byte [rax], 0       ; check if rax is null
    je .strpbrk_end_null    ; if it is, return null
.strpbrk_inner_loop:
    cmp byte [rcx], 0       ; check if rcx is null
    je .strpbrk_reloop      ; if it is, get out of the inner loop
    mov r8b, byte [rax]     ; move current rax byte to r8b
    cmp r8b, byte [rcx]     ; compare r8b and rcx
    je .strpbrk_end         ; if they are, return rax
    inc rcx                 ; increment rcx
    jmp .strpbrk_inner_loop ; inner loop
.strpbrk_reloop:
    inc rax                 ; increment rax
    mov rcx, rsi            ; move rsi to rcx (arg 2)
    jmp .strpbrk_outer_loop ; loop

.strpbrk_end:
    ret                     ; return
.strpbrk_end_null:
    mov rax, 0              ; set rax to null
    ret                     ; return null