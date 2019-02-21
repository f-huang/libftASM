;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	char	*ft_strdup(const char *s);		;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

	global	_ft_strdup
	extern	_malloc
	extern	_ft_strlen
	extern	_ft_bzero
	extern	_ft_memcpy
	section .text

_ft_strdup:
	push	rbp
	mov		rbp, rsp

	cmp		rdi, 0x0
	je		null_pointer

call_strlen:
	push	rdi
	call	_ft_strlen
	pop		rdi

	mov		rcx, rax
	inc		rcx

call_malloc:
	push	rcx
	push	rdi
	mov		rdi, rcx
	call	_malloc
	pop		rdi
	pop		rcx

	mov		r8, rax

call_bzero:
	push	rcx
	push	rdi

	mov		rdi, r8
	mov		rsi, rcx
	call	_ft_bzero

	pop		rdi
	pop		rcx

	mov		r8, rax
	mov		r9, rdi

call_memcpy:
	push	rsi
	push	rdi
	push	rdx

	mov		rdi, r8
	mov		rsi, r9
	mov		rdx, rcx
	call	_ft_memcpy

	pop		rdx
	pop		rdi
	pop		rsi

return:
	mov		rsp, rbp
	pop		rbp

	ret

null_pointer:
	mov		rax, 0x0
	mov		rsp, rbp
	pop		rbp
	ret
