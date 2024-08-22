BITS 64
SECTION .text
    global strcmp

strcmp:
    mov rax, 0              ; init rax to 0
    mov r8b, 0              ; init r8b
    mov r9b, 0              ; init r9b

.strcmp_loop:
    cmp byte [rdi], 0       ; compare the character at rdi with character 0
    je .strcmp_end          ; jump if true
    cmp byte [rsi], 0       ; compare the character at rsi with character 0
    je .strcmp_end          ; jump if true
	mov	r8b, byte [rsi]     ; copy byte from source to r8 (tmp variable)
    mov r9b, byte [rdi]     ; copy byte from source to r9 (tmp variable)
	cmp r8b, r9b            ; compare r8 w/ rdi (destination) assembly
    jne .strcmp_end         ; jump if false
    inc rdi                 ; increment rdi
    inc rsi                 ; increment rsi
    jmp .strcmp_loop        ; jump without condition


.strcmp_end:
	mov	r8b, byte [rsi]     ; copy byte from source to r8 (tmp variable)
    mov r9b, byte [rdi]     ; copy byte from source to r9 (tmp variable)
    cmp r8b, r9b            ; compare both
    jl .strcmp_return_pos   ; if less, return 1
    cmp r8b, r9b            ; compare
    je .strcmp_return_zero  ; if equal return 0
    jmp .strcmp_return_neg  ; otherwise return -1
.strcmp_return_pos:
    inc rax                 ; rax += 1
    ret                     ; return
.strcmp_return_neg:
    dec rax                 ; rax -= 1
    ret                     ; return
.strcmp_return_zero:
    ret                     ; return