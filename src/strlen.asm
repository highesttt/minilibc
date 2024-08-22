BITS 64
SECTION .text
    global strlen           ; make the function available to other files

strlen:
    mov rax, 0              ; rax = 0 (counter, return value)
    mov rcx, rdi            ; rcx = rdi (counter for the string, RDI because its the destination register for the first string argument)
.strlen_loop:
    cmp byte [rcx], 0       ; compare byte at rcx with 0
    je .strlen_end          ; jump if true
    inc rax                 ; increment rax
    inc rcx                 ; increment rcx
    jmp .strlen_loop        ; jump without condition
.strlen_end:
    ret                     ; return