BITS 64
SECTION .text
    global strncmp

strncmp:
    mov rax, 0              ; init rax to 0
    mov r8b, 0              ; init r8 to 0
    mov r9b, 0              ; init r9 to 0
    cmp rdx, 0              ; compare rdx (size_t arg) with 0
    jle .strncmp_return_zero

.strncmp_loop:
    cmp byte [rdi], 0       ; compare the character at rdx with 0 (null terminator \0)
    je .strncmp_end         ; jump if true
    cmp byte [rsi], 0       ; compare the character at rsi with 0 (null terminator \0)
    je .strncmp_end         ; jump if true
	mov	r8b, byte [rsi]     ; copy byte from source to r8 (tmp variable)
    mov r9b, byte [rdi]     ; copy byte from source to r9 (tmp variable)
	cmp r8b, r9b            ; compare r8 w/ r9 assembly
    jne .strncmp_end        ; jump if false
    dec rdx                 ; decrement rdx
    cmp rdx, 0              ; compare rdx (size_t arg) with 0
    jle .strncmp_end        ; jump if less or equal
    inc rdi                 ; else increment rdi
    inc rsi                 ; increment rsi
    jmp .strncmp_loop       ; jump without condition
.strncmp_end:
	mov r8b, byte [rsi]     ; copy byte from source to r8 (tmp variable)
    mov r9b, byte [rdi]     ; copy byte from source to r9 (tmp variable)
    cmp r8b, r9b            ; compare the two bytes
    jl .strncmp_return_pos  ; jump if r8b < r9b
    cmp r8b, r9b            ; recompare
    je .strncmp_return_zero ; else if, jump if equal
    jmp .strncmp_return_neg ; otherwise return negative
.strncmp_return_pos:
    add al, r9b             ; add r9b to al (8byte rax)
    sub al, r8b             ; remove r8b from al
    ret                     ; return
.strncmp_return_neg:
    add al, r8b             ; add r9b to al (8byte rax)
    sub al, r9b             ; remove r8b from al
    imul rax, -1            ; multiply rax by -1
    ret                     ; return
.strncmp_return_zero:
    ret                     ; return 0