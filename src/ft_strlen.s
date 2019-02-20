;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	size_t	ft_strlen(const char *str);					;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

	global _ft_strlen
	section .text
_ft_strlen:
	push rbp
	mov rbp, rsp
	mov rsi, rdi			; rdi to rsi --> same address

next:
	cmp rdi, 0				; cmp rdi to NULL pointer
	je finish				; if TRUE, jump to finish
	cmp byte [rdi], 0		; cmp *rdi to \0
	je finish				; if TRUE, jump to finish
	inc rdi					; increment rdi -> ++rdi
	jmp next				; continue

finish:
	sub rdi, rsi			; substract -> (rsi - rdi). value stored in rdi
	mov rax, rdi			; mov rdi value in rax --> rax = return value
	mov rsp, rbp
	pop rbp
	ret
