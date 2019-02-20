;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	void	*ft_memcpy(void *dst, void *src, size_t len);
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

	global _ft_memcpy

	section .text
_ft_memcpy:

	push	rbp
	mov		rbp, rsp

	cmp		rsi, 0x0
	je		null_pointer

	cmp		rdi, 0x0
	je		null_pointer

	mov		r8, rdi
	mov		rcx, rdx
	rep		movsb

	mov		rax, r8

	mov		rsp, rbp
	pop		rbp

	ret

null_pointer:
	mov		rax, 0x0
	mov		rsp, rbp
	pop		rbp
	ret
