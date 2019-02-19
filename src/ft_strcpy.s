;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	char	*ft_strcpy(char *s1, const char *s2);		;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

	global _ft_strcpy
	section .text

_ft_strcpy:
	push rdi					; Keep trace of first arg
	push rsi					; Keep trace of second arg
	cmp rdi, 0					; if s1 == NULL
	je finish					; TRUE -> finish
	cmp rsi, 0					; if s2 == NULL
	je finish					; TRUE -> finish
	mov rdx, rdi				; keep s1 in a pointer --> ptr = s1
	mov rcx, 0					; rcx as a counter --> i = 0

next:
	cmp byte [rsi + rcx], 0		; if end of string --> s2[i] == 0 ?
	je finish					; TRUE -> finish
	mov byte rdx, [rsi + rcx]	; *ptr = s2[i]
	inc rcx						; i++
	inc rdx						; ptr++
	jmp next					; continue

finish:
	mov rdx, 0					; put \0 at the end of string
	pop rdi
	pop rsi
	mov rax, rdi				; rdi points to start of s1.
	ret
