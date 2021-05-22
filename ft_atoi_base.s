global _ft_atoi_base
extern ___error
section .text

_error:
	mov rax, -1
	ret

_minus:
	mov r11, -1
	inc r9
	jmp _check

_help:
	inc r9

_cheak_base1:
	cmp byte [rsi + r9], 0
		je _cheak_base
	cmp r9, r8
		je _help
	mov dl, byte [rsi + r8]
	cmp dl, byte [rsi + r9]
		je _error
	jmp _help

_cheak_base:
	xor r9, r9
	cmp byte [rsi + r8], 0
		je _scip
	cmp byte [rsi + r8], 9
		je _error
	cmp byte [rsi + r8], 10
		je _error
	cmp byte [rsi + r8], 11
		je _error
	cmp byte [rsi + r8], 12
		je _error
	cmp byte [rsi + r8], 13
		je _error
	cmp byte [rsi + r8], 32
		je _error
	cmp byte [rsi + r8], 43
		je _error
	cmp byte [rsi + r8], 45
		je _error
	inc r8
	jmp _cheak_base1

_ft_atoi_base:
	xor r8, r8
	xor r9, r9
	xor r11, r11
	xor rcx, rcx
	jmp _cheak_base

_scip:
	mov r9, -1
_scip_space:
	inc r9
	cmp byte [rdi + r9], 9
		je _scip_space
	cmp byte [rdi + r9], 10
		je _scip_space
	cmp byte [rdi + r9], 11
		je _scip_space
	cmp byte [rdi + r9], 12
		je _scip_space
	cmp byte [rdi + r9], 13
		je _scip_space
	cmp byte [rdi + r9], 32
		je _scip_space
	cmp byte [rdi + r9], 43
		je _scip_space
	cmp byte [rdi + r9], 45
		je _minus
_check:
	xor rax, rax 
	cmp r8, 2
		jnge _error
	cmp byte [rdi + r9], 0
		je _error
	mov rcx, r9
	xor r9, r9
	push r12
	push r13
	mov rdx, r8
	mov r12, rdx

_while1:
	cmp byte [rsi + r9], 0
		je _return
	mov r8b, [rsi + r9]
	mov r13, rax
	cmp r8b, byte [rdi + rcx]
		je _while3
	inc r9
	jmp _while1

_while3:
	cmp rdx, 1
		je _while2
	add rax, r13
	dec rdx
	jmp _while3

_while2:
	add rax, r9
	inc rcx
	mov rdx, r12
	xor r9, r9
	jmp _while1

_return:
	pop r13
	pop r12
	cmp r11, 0
		jnge _ret_m
	ret
_ret_m:
	neg rax
	ret