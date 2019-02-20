;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int		ft_isalpha(int c);							;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;


	global	_ft_isalpha
	extern	_ft_islower
	extern	_ft_isupper

	section .text
_ft_isalpha:
	push	rbp
	mov		rbp, rsp
	call _ft_islower
	cmp rax, 0x1
	je	true
	call _ft_isupper
	cmp rax, 0x1
	je true
	jne false

false:
	mov rax, 0x0
	mov		rsp, rbp
	pop		rbp
	ret

true:
	mov rax, 0x1
	mov		rsp, rbp
	pop		rbp
	ret
