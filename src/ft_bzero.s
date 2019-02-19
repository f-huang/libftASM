;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;
;	void	ft_bzero(void *s, size_t n);				;
;–––––––––––––––––––––––––––––––––––––––––––––––––––––––;

	global _ft_bzero
	section .text
_ft_bzero:
	push	rbp
	cmp		rdi, 0
	je		finish

next:
	cmp		rsi, -1					;	compare 2nd arg (n) to -1
	je		finish					;	if n == -1 ; finish
	mov		byte [rdi + rsi], 0		;	rdi[rsi] = 0 --> s[n] = 0
	dec		rsi						;	n--
	jmp		next					; continue;

finish:
	pop		rbp
	ret
