global _ft_list_size
extern ___error
section .text

_ft_list_size:
	xor rax, rax
_while:
	test rdi, rdi
	je _return
	mov rdi, [rdi + 8]
	inc rax
	jmp _while
_return:
	ret