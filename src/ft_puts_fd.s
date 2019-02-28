;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int	ft_puts(int fd, const char *str);				;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

%define EOF			-1

	global _ft_puts_fd
	extern _ft_putstr_fd

	section .data
newline:	db	0xa, 0x0

	section .text
_ft_puts_fd:
	push	rbp
	mov		rbp, rsp

	push	rdi
	push	rsi
	call	_ft_putstr_fd
	pop		rsi
	pop		rdi

print_newline:
	lea		rsi, [rel newline]
	call	_ft_putstr_fd
	jc		error

	mov		rax, 0xa
	jmp		finish

error:
	mov		rax, EOF
	jmp 	finish

finish:
	mov		rsp, rbp
	pop		rbp
	ret
