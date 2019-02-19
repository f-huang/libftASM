;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int		ft_isalnum(int c);							;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;


	global	_ft_isalnum
	extern	_ft_isalpha
	extern	_ft_isdigit

	section .text
_ft_isalnum:
	call _ft_isalpha
	cmp rax, 0x1
	je	true
	call _ft_isdigit
	cmp rax, 0x1
	je true
	jne false

false:
	mov rax, 0x0
	ret

true:
	mov rax, 0x1
	ret
