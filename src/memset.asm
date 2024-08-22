BITS 64
SECTION .text
    global memset

memset:
    mov rax, rdi            ; rax = rdi (return value)
    mov rcx, rsi            ; rcx = rsi (second argument)
.memset_loop:
    cmp rdx, 0              ; compare size with 0
    jle .memset_end         ; jump if less or equal
    mov [rdi], cl           ; mov char to string
    inc rdi                 ; increment string
    dec rdx                 ; decrement size
    jmp .memset_loop        ; jump without condition
.memset_end:
    ret                     ; return string