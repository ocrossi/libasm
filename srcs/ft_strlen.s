section .text
global ft_strlen

ft_strlen:
	mov rax, 0          	; RAX cpt string length
	mov rcx, rdi        	; RCX points to beginning of str

.loop:
	movzx rdx, byte [rcx] 	; Load the next byte from the string
	test rdx, rdx		; check if rdx is 0 using a binary and
	jz .done            	; If zero, we're done, jumping to 
	inc rax			; incs cpt
	inc rcx			; incs pointer to string
	jmp .loop           	; jumping back to loop 

.done
	ret
