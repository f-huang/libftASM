;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	void	ft_cat(int fd);								;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

%define SYS_READ				3
%define SYSCALL_UNIX(sys_num)	(2 << 24) | sys_num
%define STDOUT					1
%define BUFFER_SIZE				1024

	global	_ft_cat
	extern	_ft_putstr_fd
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

	mov		rsi, BUFFER_SIZE + 1
	lea		rdi, [rel buffer]
	call	_ft_bzero

	pop		rdi
	pop		rsi

read_fd:
	push	rdx
	push	rsi
	push	rdi

	mov		rax, SYSCALL_UNIX(SYS_READ)
	mov		rdi, r9
	mov		rdx, BUFFER_SIZE
	lea		rsi, [rel buffer]
	syscall

	pop		rdi
	pop		rsi
	pop		rdx

is_end_of_reading:
	jc		finish
	cmp		rax, 0x0
	je		finish
	jg		output_line

output_line:
	push	rsi
	push	rdi

	mov		rdi, STDOUT
	lea		rsi, [rel buffer]
	call	_ft_putstr_fd

	pop		rdi
	pop		rsi

	jmp		keep_reading

finish:
	add		rsp, 32
	mov		rsp, rbp
	pop		rbp
	ret
