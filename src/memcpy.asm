BITS 64
SECTION .text
    global memcpy

memcpy:
    mov rax, rdi            ; copy source to rax
.memcpy_loop:
    cmp rdx, 0              ; compare size with 0
    jle .memcpy_end         ; jump if less or equal
	mov	r8b, byte [rsi]     ; copy byte from source to r8 (tmp variable)
	mov	byte [rdi], r8b     ; copy byte from r8 to rdi (destination)
    inc rsi                 ; increment source
    inc rdi                 ; increment destination
    dec rdx                 ; decrement size
    jmp .memcpy_loop        ; jump without condition
.memcpy_end:
    ret                     ; return string
