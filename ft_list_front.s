global _ft_lstadd_front
extern ___error
section .text

_ft_lstadd_front:
	cmp rdi, 0
	je _return
	cmp rsi, 0
	je _return
	mov r8, [rdi]
	mov [rsi + 8], r8
	mov [rdi], rsi
_return:
	ret