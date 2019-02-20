;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	void	*ft_memset(void *b, int c, size_t len)		;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

	global _ft_memset

	section .text
_ft_memset:
	push	rbp
	mov		rbp, rsp

	cmp		rdi, 0x0
	je		null_pointer

	mov		r8, rdi

	mov		rax, rsi
	mov		rcx, rdx
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
