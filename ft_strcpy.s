global _ft_strcpy

section .text

_ft_strcpy:
	xor rax, rax
_while:
	mov r8b, byte [rsi + rax]
	mov byte [rdi + rax], r8b
	cmp byte [rsi + rax], 0
	jz _return
	inc rax
	jmp _while
_return:
	mov rax, rdi
	ret
