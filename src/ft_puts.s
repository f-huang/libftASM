;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int	ft_puts(const char *str);						;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

%define STDOUT 1

	global _ft_puts
	extern _ft_puts_fd

_ft_puts:
	push	rbp
	mov		rbp, rsp

	mov		rsi, rdi
	mov		rdi, STDOUT
	call	_ft_puts_fd

	mov		rsp, rbp
	pop		rbp
	ret
