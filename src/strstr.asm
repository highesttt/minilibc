BITS 64
SECTION .text
    global strstr           ; make the function available to other files

strstr:
    mov rax, rdi            ; move rdi to rax (arg 1)
    mov rcx, rsi            ; move rsi to rcx (arg 2)
    cmp rax, 0              ; compare the character at rax with 0 (null)
    je .strstr_end          ; jump if true
    cmp rcx, 0              ; compare the character at rcx with 0 (null)
    je .strstr_end          ; jump if true
    cmp byte [rsi], 0       ; if its \0
    je .strstr_end          ; end

.strstr_loop:
    cmp byte [rax], 0       ; compare the character at rax with 0 (null terminator \0)
    je .strstr_end_null     ; jump if true
	mov	r8b, byte [rcx]     ; copy byte from rcx to r8 (tmp variable)
	cmp byte [rax], r8b     ; compare r8 w/ rax (destination)
    je .strstr_maybe        ; jump if true
    inc rax                 ; increment rax
    jmp .strstr_loop        ; jump without condition

.strstr_maybe:
    mov rdx, rax            ; move rax to rdx (tmp variable)
    mov r8, rcx             ; move rcx to r8 (tmp variable)
    jmp .strstr_maybe_loop  ; jump without condition
.strstr_maybe_loop:
    cmp byte [r8], 0        ; compare the character at r8 with 0 (null terminator \0)
    je .strstr_end          ; jump if true
    cmp byte [rdx], 0       ; compare the character at rdx with 0 (null terminator \0)
    je .strstr_end          ; jump if true
	mov	r9b, byte [r8]      ; copy byte from rcx to r9 (tmp variable)
    cmp byte [rdx], byte r9b ; compare the character at rdx with the character at r9
    jne .inc                ; jump if false
    inc rdx                 ; increment rdx
    inc r8                  ; increment r8
    jmp .strstr_maybe_loop  ; jump without condition

.inc:
    inc rax                 ; rax += 1
    jmp .strstr_loop        ; jump back to the main loop

.strstr_end:
    ret                     ; return

.strstr_end_null:
    mov rax, 0              ; rax = NULL
    ret                     ; return