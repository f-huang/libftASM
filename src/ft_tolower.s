;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int		ft_tolower(int c);							;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;


	global	_ft_tolower
	extern	_ft_isupper

	section .text
_ft_tolower:
	call	_ft_isupper
	cmp		rax, 0x1
	je		transform
	mov		rax, rdi
	ret

transform:
	add		rdi, 0x20
	mov		rax, rdi
	ret
