;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int		ft_isascii(int c);							;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;


	global _ft_isascii

	section .text
_ft_isascii:
	cmp		rdi, 0x0
	jl		false
	cmp		rdi, 0x7f
	jg		false
	jle		true

false:
	mov		rax, 0x0
	ret

true:
	mov		rax, 0x1
	ret
