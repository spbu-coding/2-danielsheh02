	.file	"sort.c"
	.text
	.globl	sorted_of_numbers
	.type	sorted_of_numbers, @function
sorted_of_numbers:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L2
.L6:
	movl	$0, -12(%rbp)
	jmp	.L3
.L5:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jle	.L4
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	-12(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	movl	-12(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, (%rdx)
.L4:
	addl	$1, -12(%rbp)
.L3:
	movl	-28(%rbp), %eax
	subl	-16(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -12(%rbp)
	jl	.L5
	addl	$1, -16(%rbp)
.L2:
	movl	-28(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -16(%rbp)
	jl	.L6
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	sorted_of_numbers, .-sorted_of_numbers
	.ident	"GCC: (Ubuntu 9.3.0-10ubuntu2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
