global _ft_write 
extern ___error
section .text

_ft_write:
	mov rax, 0x2000004
	syscall
	jc _error
	jmp _return
_error:
	push rax
	call ___error
	pop qword [rax]
	mov rax, -1
_return:
	ret