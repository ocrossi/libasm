extern __errno_location

section .text
	global ft_write

ft_write:
	; function arguments are in
	; rdi file descriptor
	; rsi buffer address 
	; rdx len 2 write
	mov rax, 1	; syscall number for write is 1
	syscall		; call syscall
	cmp rax, 0
	jb .syscall_crash
	; classic  stack cleanup
	ret

.syscall_crash
	mov rbx, rax
	call __errno_location wrt ..plt
	mov [rax], rbx
	mov rax, -1
	ret
