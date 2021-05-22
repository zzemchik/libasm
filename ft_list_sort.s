global _ft_list_sort
section .text

_swap:
	mov r11, [r13]
	mov r12, [rdi]
	mov [rdi], r11
	mov [r13], r12
	mov rdi, rcx
	jmp _while

_ft_list_sort:
	mov rcx, [rdi]
	mov rdi, [rdi]

_while:
	mov r13, [rdi + 8]
	cmp r13, 0
	je _return
	push rdi
	push rsi
	push rcx
	mov rcx, rsi
	mov rsi, [rdi + 8]
	mov rdi, [rdi]
	mov rsi, [rsi]
	call rcx
	pop rcx
	pop rsi
	pop rdi
	cmp rax, 0
	jne _swap
	mov rdi, [rdi + 8]
	jmp _while

_return:
	ret