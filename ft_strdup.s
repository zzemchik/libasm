global _ft_strdup
extern _malloc
extern _ft_strlen
extern _ft_strcpy
extern ___error
section .text

_ft_strdup:

	cmp rdi, 0
		je _null
	push rdi
	call _ft_strlen
	inc rax
	mov rdi, rax
	call _malloc
	jz _error
	pop rdi
	mov rsi, rdi
	mov rdi, rax
	call _ft_strcpy
	ret
_error:
	push rax
	call ___error
	pop qword [rax]
	mov rax, -1
	ret
_null:
	mov rax, 0
	ret


