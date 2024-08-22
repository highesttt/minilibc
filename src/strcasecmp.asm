BITS 64
SECTION .text
    global strcasecmp

strcasecmp:
    mov rax, 0              ; init rax to 0
    mov r8b, 0
    mov r9b, 0
.strcasecmp_loop:
    cmp byte [rdi], 0       ; compare the character at rdx with 0 (null terminator \0)
    je .strcasecmp_end      ; jump if true
    cmp byte [rsi], 0       ; compare the character at rsi with 0 (null terminator \0)
    je .strcasecmp_end      ; jump if true
	mov	r8b, byte [rsi]     ; copy byte from source to r8 (tmp variable)
    mov r9b, byte [rdi]     ; copy byte from source to r9 (tmp variable)
	cmp r8b, r9b            ; compare r8 w/ rdi (destination) assembly
    jne .strcasecmp_cmpcase_rsi ; jump if false
    inc rdi                 ; increment rdi
    inc rsi                 ; increment rsi
    jmp .strcasecmp_loop    ; jump without condition
.strcasecmp_cmpcase_rsi:
    cmp r8b, 'A'            ; compare r8 w/ A
    jl .strcasecmp_cmpcase_rdi ; jump if false
    cmp r8b, 'Z'            ; compare r8 w/ Z
    jg .strcasecmp_cmpcase_rdi ; jump if false
    add r8b, 32             ; add 32 to r8 (make it lowercase)
.strcasecmp_cmpcase_rdi:
    cmp r9b, 'A'            ; compare r9 w/ A
    jl .strcasecmp_cmplower ; jump if false
    cmp r9b, 'Z'            ; compare r9 w/ Z
    jg .strcasecmp_cmplower ; jump if false
    add r9b, 32             ; add 32 to r9 (make it lowercase)
.strcasecmp_cmplower:
    cmp r8b, r9b            ; compare r8 w/ r9
    jne .strcasecmp_end     ; jump if false
    inc rdi                 ; increment rdi
    inc rsi                 ; increment rsi
    jmp .strcasecmp_loop    ; jump without condition

.strcasecmp_end:
	mov	r8b, byte [rsi]     ; copy byte from source to r8 (tmp variable)
    mov r9b, byte [rdi]     ; copy byte from source to r9 (tmp variable)
    cmp r8b, r9b
    jl .strcasecmp_return_pos
    cmp r8b, r9b
    je .strcasecmp_return_zero
    jmp .strcasecmp_return_neg
.strcasecmp_return_pos:
    add al, r9b
    sub al, r8b
    ret                     ; return
.strcasecmp_return_neg:
    add al, r8b
    sub al, r9b
    imul rax, -1
    ret                     ; return
.strcasecmp_return_zero:
    ret                     ; return