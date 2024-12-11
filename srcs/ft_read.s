extern __errno_location

section .text
global ft_read

ft_read:
	; rdi file descriptor
	; rsi buffer address 
	; rdx len 2 read
	mov rax, 0	; syscall number for read is 1
	syscall		; call syscall
	ret

