;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	int	ft_puts(const char *str);						;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

%define SYS_WRITE 4
%define STDOUT 1
%define SYSCALL_UNIX(sys_num) (2 << 24) | sys_num

%macro write_str 2
	mov rdi, STDOUT
	mov rsi, %1
	mov rdx, %2
	mov rax, SYSCALL_UNIX(SYS_WRITE)
	syscall
%endmacro

	global _ft_puts
	extern _ft_strlen

	section .data
null_string db "(null)", 0xa, 0x0
null_string_len equ $ - null_string
newline db 0xa

	section .text
_ft_puts:
	cmp			rdi, 0
	je			null_pointer
	jne			ordinary_str

null_pointer:
	push		rdi
	write_str	null_string, null_string_len
	pop			rdi
	ret

ordinary_str:
	mov			r8, rdi
	push		rdi
	call		_ft_strlen
	write_str	r8, rax
	write_str	newline, 0x1
	pop			rdi
	ret
