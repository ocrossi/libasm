section .text
global ft_write

ft_write:
	; classic stack prep
	push rbp
	mov rbp, rsp
	; prepare function arguments
	; rdi file descriptor
	; rsi buffer address 
	; rdx len 2 write
	mov rax, 1	; syscall number for write is 1
	syscall		; call syscall
	
	; classic  stack cleanup
	mov rsp, rbp
	pop rbp
	ret

