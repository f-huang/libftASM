;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	void	ft_bzero(void *s, size_t n);				;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

	global _ft_bzero
	section .text
_ft_bzero:
	push	rbp
	mov		rbp, rsp

	cmp		rdi, 0x0
	je		null_pointer

	mov		r8, rdi

	mov		rax, 0x0
	mov		rcx, rsi
	rep		stosb

	mov		rax, r8

	mov		rsp, rbp
	pop		rbp

	ret

null_pointer:
	mov		rax, 0x0
	mov		rsp, rbp
	pop		rbp
	ret
