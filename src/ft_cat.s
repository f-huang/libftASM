;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	void	ft_cat(int fd);								;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

%define SYS_READ				3
%define SYS_WRITE				4
%define SYSCALL_UNIX(sys_num)	(2 << 24) | sys_num
%define STDOUT					1
%define BUFFER_SIZE				1024

	global	_ft_cat
	extern	_ft_bzero

	section	.bss
buffer: resb BUFFER_SIZE + 1

	section	.text

_ft_cat:
	push	rbp
	mov		rbp, rsp
	sub		rsp, 32

	mov		r9, rdi

keep_reading:

bzero_buffer:
	push	rsi
	push	rdi

	lea		rdi, [rel buffer]
	mov		rsi, BUFFER_SIZE + 1
	call	_ft_bzero

	pop		rdi
	pop		rsi

read_fd:
	push	rdx
	push	rsi
	push	rdi

	mov		rdi, r9
	lea		rsi, [rel buffer]
	mov		rdx, BUFFER_SIZE
	mov		rax, SYSCALL_UNIX(SYS_READ)
	syscall

	pop		rdi
	pop		rsi
	pop		rdx

is_end_of_reading:
	jc		finish
	cmp		rax, 0x0
	jle		finish
	jg		output_line

output_line:
	push	rsi
	push	rdi

	mov		rdi, STDOUT
	lea		rsi, [rel buffer]
	mov		rdx, rax
	mov		rax, SYSCALL_UNIX(SYS_WRITE)
	syscall

	pop		rdi
	pop		rsi

	jmp		keep_reading

finish:
	add		rsp, 32
	mov		rsp, rbp
	pop		rbp
	ret
