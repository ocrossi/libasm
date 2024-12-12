section .text
global ft_strcmp

ft_strcmp:
	; loads s1 pointer to rax and s2 pointer to rbx
	mov rax, rdi	
	mov rbx, rsi

.loop:
	movzx rcx, byte [rax]		;store into rdx value rax, will need to test for \0
	movzx rdx, byte [rbx]		;store into rdx value rax, will need to test for \0
	cmp rcx, rdx			; compare chars strings s1 and s2
	jne .not_equal
	test rdx, rdx			; test for \0 to not read too much
	jz .equal
	inc rax
	inc rbx
	jmp .loop

.equal:
	mov rax, 0
	jmp .done

.not_equal:
	sub rax, rbx
	jmp .done

.done:
	ret
