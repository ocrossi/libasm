%define ENOMEM 12

extern malloc
extern ft_strlen
extern ft_strcpy
extern __errno_location

section .text
	global ft_strdup

ft_strdup:
	push rdi
	call ft_strlen				; get len of string given in arg
	inc rax					; add 1 for \0
	mov rdi, rax				; get len into rdi for malloc call
	call malloc wrt ..plt			; call malloc with len of string
	test rax, rax				; check if malloc crash
	je .malloc_failed			; jump to crash malloc gestion if crash detected
	mov rdi, rax				; set malloc pointer to rdi
	pop rsi					; get input arg back from the stack
	call ft_strcpy				; call strcpy with src = input, dest = malloced_str
	ret

.malloc_failed:
	mov rdi, ENOMEM				; setup no more memory error as input
	call __errno_location wrt ..plt		; get errno value
	mov [rax], rdi				; store errno
	xor rax, rax				; return NULL
	ret
