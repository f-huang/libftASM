;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	char	*ft_strnew(size_t size);					;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

	global	_ft_strnew
	extern	_ft_bzero
	extern	_malloc
	section .text

_ft_strnew:
	push	rbp
	mov		rbp, rsp

	mov		rcx, rdi
	inc		rcx

	push	rdi
	mov		rdi, rcx
	call	_malloc
	pop		rdi

	mov		r8, rax


call_bzero:
	push	rsi
	push	rdi

	mov		rdi, r8
	mov		rsi, rcx
	call	_ft_bzero

	pop		rdi
	pop		rsi

	mov		rsp, rbp
	pop		rbp
	ret
