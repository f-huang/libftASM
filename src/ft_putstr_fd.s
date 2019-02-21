;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int	ft_putstr_fd(int fd, const char *str);			;
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

	global _ft_putstr_fd
	extern _ft_strlen

	section .data

null_string 	db "(null)", 0xa, 0x0
null_string_len	equ $ - null_string

	section .text
_ft_putstr_fd:
	push		rbp
	mov			rbp, rsp
	cmp			rsi, 0
	je			null_pointer
	jne			ordinary_str

null_pointer:
	write_str	rdi, null_string, null_string_len
	mov			rsp, rbp
	pop			rbp
	ret

ordinary_str:
	mov			r8, rdi
	mov			rdx, rsi

call_strlen:
	push		rdi
	mov			rdi, rdx
	call		_ft_strlen
	pop			rdi

call_write:
	mov			rcx, rax
	write_str	r8, rdx, rcx

	mov			rsp, rbp
	pop			rbp
	ret
