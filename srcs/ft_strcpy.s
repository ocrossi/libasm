section .text
global ft_strcpy

ft_strcpy:
	mov rax, rdi ; saves dest original pointer in rax for return

.loop:
	movzx rdx, byte [rsi]
	mov [rdi], dl
	test rdx, rdx
	jz .done
	inc rdi
	inc rsi
	jmp .loop

.done
	ret
