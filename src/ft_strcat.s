;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	char	*ft_strcat(char *s1, const char *s2);		;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

	global _ft_strcat
	section .text
_ft_strcat:
	push	rbp
	mov		rbp, rsp
	cmp		rdi, 0				; if s1 == NULL
	je 		quit				; TRUE -> quit
	cmp		rsi, 0				; if s2 == NULL
	je		quit				; TRUE -> quit
	push	rdi					; Keep trace of first arg
	push	rsi					; Keep trace of second arg
	mov		rdx, rdi			; rdx points to rdi --> ptr1 = s1
	mov		rcx, rsi			; rcx points to rsi --> ptr2 = s2

pass_first_string:
	cmp		byte [rdx], 0		; if *ptr1 == 0
	je		pass_second_string	; go to second string
	inc		rdx					; ptr1 ++
	jmp		pass_first_string	; continue

pass_second_string:
	cmp		byte [rcx], 0		; if *ptr2 == 0
	je		finish				; TRUE --> finish
	mov		r8, [rcx]			; r8 is a temporary register --> store *ptr2
	mov		[rdx], r8			; *ptr1 = tmp_r8
	inc		rcx					; ptr1++
	inc		rdx					; ptr2++
	jmp		pass_second_string	; continue

finish:
	mov		byte [rdx], 0		; put \0 at the end of string --> ptr1[-1] = 0
	mov		rax, rdi			; rdi points to start of ptr1
	pop		rsi
	pop		rdi
	mov		rsp, rbp
	pop		rbp
	ret

quit:
	mov rax, 0					; return NULL
	mov		rsp, rbp
	pop		rbp
	ret
