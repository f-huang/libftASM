;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int		ft_islower(int c);							;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;


	global _ft_islower

	section .text
_ft_islower:
	cmp		rdi, 0x61
	jl		false
	cmp		rdi, 0x7a
	jg		false
	jle		true

false:
	mov		rax, 0x0
	ret

true:
	mov		rax, 0x1
	ret
