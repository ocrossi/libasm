section .text
global ft_strcpy

ft_strcpy:
	; classic stack prep
	push rbp
	mov rbp, rsp
	
	; loads src pointer to rax and dest pointer to rbx
	mov rax, rdi	
	mov rbx, rsi

.loop:
	movzx rdx, byte [rbx]
	mov [rax], dl
	test rdx, rdx
	jz .done
	inc rax
	inc rbx
	jmp .loop

.done:
	mov rsp, rbp
	pop rbp
	mov rax, rdi
	ret
