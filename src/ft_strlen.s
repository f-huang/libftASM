;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	size_t	ft_strlen(const char *str);					;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

	global _ft_strlen
	section .text
_ft_strlen:
	push	rbp
	mov		rbp, rsp

	cmp		rdi, 0x0
	je		null_pointer

	mov		rsi, rdi
	mov		rax, 0x0
	mov		rcx, 0xFFFFFFFF
	repne	scasb

	sub		rdi, rsi			; substract -> (rsi - rdi). value stored in rdi
	dec		rdi					; substract -> (rsi - rdi). value stored in rdi
	mov		rax, rdi			; mov rdi value in rax --> rax = return value

	mov		rsp, rbp
	pop		rbp

	ret

null_pointer:
	mov		rax, 0x0
	mov		rsp, rbp
	pop		rbp
	ret
