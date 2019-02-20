;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int		ft_isdigit(int c);							;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;


	global _ft_isdigit

	section .text
_ft_isdigit:
	push	rbp
	mov		rbp, rsp
	cmp		rdi, 0x30
	jl		false
	cmp		rdi, 0x39
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
