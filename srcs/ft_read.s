extern __errno_location

section .text
global ft_read

ft_read:
	push rbp
	mov rbp, rsp
	; rdi file descriptor
	; rsi buffer address 
	; rdx len 2 read
	mov rax, 0	; syscall number for read is 1
	syscall		; call syscall
	cmp rax, 0
	jb .syscall_crash
	mov rsp, rbp
	pop rbp
	ret

.syscall_crash
	mov rbx, rax
	call __errno_location wrt ..plt
	mov [rax], rbx
	mov rax, -1
	ret
