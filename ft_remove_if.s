
global _ft_remove_if
extern _free
section .text


_dell:
	mov rcx, [rdi]
	mov r10, [rcx + 8]
	mov [rdi], r10
	mov r8, [rdi]

	jmp _while

_while22:
	mov rcx, [r8 + 8]
	cmp rcx, 0
		je _return
	mov r8, [r8 + 8]
	jmp _while2

_ft_remove_if:
	mov r8, [rdi]
	cmp rdi, 0
		je _return

_while:
	cmp r8, 0
	je _return
	push r8
	push rdi
	push rsi
	mov rdi, [r8]
	call rdx
	pop rsi
	pop rdi
	pop r8
	cmp rax, 0
		jne _dell

r:
 mov r8, [rdi]

_while2:
	mov r10, [r8 + 8]
	cmp r10, 0
		je _return
	cmp r8, 0
		je _return
	push rdi
	mov rdi, [r10]
	call rdx
	pop rdi
	cmp rax, 0
		je _while22
	push r10
	push r8
	push rdi
	mov rdi, r10
	mov		r10, [r10 + 8]
	mov		[r8 + 8], r10
	call _free
	pop rdi
	pop r8
	pop r10
	jmp		_while22

_return:
	ret