;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int	ft_putstr_fd(int fd, const char *str);			;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

%define SYS_WRITE				4
%define SYSCALL_UNIX(sys_num)	(2 << 24) | sys_num

%macro write_str 3
	mov rdi, %1
	mov rsi, %2
	mov rdx, %3
	mov rax, SYSCALL_UNIX(SYS_WRITE)
	syscall
%endmacro

	global _ft_putstr_fd
	extern _ft_strlen

	section .data

null_string 	db "(null)", 0x0
.len			equ $ - null_string

	section .text
_ft_putstr_fd:
	push		rbp
	mov			rbp, rsp
	sub			rsp, 32

	cmp			rsi, 0
	je			null_pointer
	jne			call_strlen

null_pointer:
	mov 	rax, SYSCALL_UNIX(SYS_WRITE)
	lea		rsi, [rel null_string]
	lea		rdx, [null_string.len]
	syscall

	jmp		finish

call_strlen:
	push		rdi
	mov			rdi, rsi
	call		_ft_strlen
	pop			rdi

call_write:
	push		rdx
	push		rsi
	push		rdi

	mov			rcx, rax
	write_str	rdi, rsi, rcx

	pop			rdi
	pop			rsi
	pop			rdx

finish:
	add			rsp, 32
	mov			rsp, rbp
	pop			rbp
	ret
