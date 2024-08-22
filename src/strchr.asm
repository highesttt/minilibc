BITS 64
SECTION .text
    global strchr           ; make the function available to other files

strchr:
    mov rax, rdi            ; move rdi to rax (arg 1)
    mov rcx, rsi            ; move rsi to rcx (arg 2)
.strchr_loop:
    cmp byte [rax], cl      ; compare the character at rax with cl (last byte of arg 2)
    je .strchr_end          ; jump if true
    cmp byte [rax], 0       ; compare the character at rax with 0 (null terminator \0)
    je .strchr_end_null     ; jump if true
    inc rax                 ; increment rax
    jmp .strchr_loop        ; jump without condition
.strchr_end:
    ret                     ; return
.strchr_end_null:
    mov rax, 0              ; set rax to null
    ret                     ; return null