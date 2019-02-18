;–––––––––––––––––––––––––––––––––––––––––––––––––––––
;	size_t	ft_strlen(const char *str);
;–––––––––––––––––––––––––––––––––––––––––––––––––––––

	global _ft_strlen
	section .text
_ft_strlen:
	push rbp
	mov rsi, rdi

next:
	cmp rdi, 0
	je finish
	cmp byte [rdi], 0
	je finish
	inc rdi
	jmp next

finish:
	sub rdi, rsi
	mov rax, rdi
	pop rbp
	ret
