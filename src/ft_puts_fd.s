;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int	ft_puts(int fd, const char *str);				;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

%define SYS_WRITE 4
%define SYSCALL_UNIX(sys_num) (2 << 24) | sys_num

%macro write_str 3
	mov rdi, %1
	mov rsi, %2
	mov rdx, %3
	mov rax, SYSCALL_UNIX(SYS_WRITE)
	syscall
%endmacro

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

	cmp		rsi, 0x0
	jne		print_newline
	je		finish

print_newline:
	lea		rsi, [rel newline]
	call	_ft_putstr_fd
	jmp		finish

finish:
	mov		rsp, rbp
	pop		rbp
	ret
