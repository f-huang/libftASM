;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int		ft_toupper(int c);							;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;


	global	_ft_toupper
	extern	_ft_islower

	section .text
_ft_toupper:
	push	rbp
	mov		rbp, rsp
	call	_ft_islower
	cmp		rax, 0x1
	je		transform
	mov		rax, rdi
	mov		rsp, rbp
	pop		rbp
	ret

transform:
	sub		rdi, 0x20
	mov		rax, rdi
	mov		rsp, rbp
	pop		rbp
	ret
