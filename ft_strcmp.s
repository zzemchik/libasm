global _ft_strcmp

section .text

_ft_strcmp:
	xor rax, rax
	push rcx
	push rbx
_while:
	mov bl, byte [rdi]
	cmp bl, byte [rsi]
	jne _return
	cmp bl, 0
	je _return
	inc rdi
	inc rsi
	jmp _while

_return:
	cmp bl, byte [rsi]
	jge _return1
	sub bl, byte [rsi]
	mov rax, rbx
	sub rax, 256
	jmp _qwe

_return1:
	sub bl, byte [rsi]
	mov rax,rbx
	jmp _qwe
_qwe:
	pop rbx
	pop rcx
	ret




