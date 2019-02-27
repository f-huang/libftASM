;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	char	*ft_strcpy(char *s1, const char *s2);		;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

	global	_ft_strcpy
	extern	_ft_strlen

	section .text

_ft_strcpy:
	push	rbp
	mov		rbp, rsp
	cmp		rdi, 0					; if s1 == NULL
	je		finish					; TRUE -> finish
	cmp		rsi, 0					; if s2 == NULL
	je		finish					; TRUE -> finish

	mov		r8, rdi

	push	rdi
	mov		rdi, rsi
	call	_ft_strlen
	pop		rdi

	mov		rcx, rax
	rep		movsb

	mov		byte [rdi], 0x0

	mov		rax, r8

	mov		rsp, rbp
	pop		rbp
	ret


finish:
	mov		rsp, rbp
	pop		rbp
	ret
