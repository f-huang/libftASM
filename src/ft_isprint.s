;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int		ft_isprint(int c);							;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;


	global _ft_isprint

	section .text
_ft_isprint:
	cmp		rdi, 0x20
	jl		false
	cmp		rdi, 0x7e
	jg		false
	jle		true

false:
	mov		rax, 0x0
	ret

true:
	mov		rax, 0x1
	ret
