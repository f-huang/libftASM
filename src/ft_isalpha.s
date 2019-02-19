;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int		ft_isalpha(int c);							;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;


	global	_ft_isalpha
	extern	_ft_islower
	extern	_ft_isupper

	section .text
_ft_isalpha:
	call _ft_islower
	cmp rax, 0x1
	je	true
	call _ft_isupper
	cmp rax, 0x1
	je true
	jne false

false:
	mov rax, 0x0
	ret

true:
	mov rax, 0x1
	ret
