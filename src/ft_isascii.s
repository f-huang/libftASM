;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int		ft_isascii(int c);							;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;


	global _ft_isascii

	section .text
_ft_isascii:
	push	rbp
	mov		rbp, rsp
	cmp		rdi, 0x0
	jl		false
	cmp		rdi, 0x7f
	jg		false
	jle		true

false:
	mov		rax, 0x0
	mov		rsp, rbp
	pop		rbp
	ret

true:
	mov		rax, 0x1
	mov		rsp, rbp
	pop		rbp
	ret
