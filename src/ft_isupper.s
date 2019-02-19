;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int		ft_isupper(int c);							;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;


	global _ft_isupper

	section .text
_ft_isupper:
	cmp		rdi, 0x41
	jl		false
	cmp		rdi, 0x5a
	jg		false
	jle		true

false:
	mov		rax, 0x0
	ret

true:
	mov		rax, 0x1
	ret
