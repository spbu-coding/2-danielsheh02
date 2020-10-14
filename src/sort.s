	.file	"sort.c"
	.text
	.globl	_sorted_of_numbers

_sorted_of_numbers:
LFB0:
	.cfi_startproc

	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5

	subl	$20, %esp

	movl	$0, -12(%ebp)
	jmp	L2
L6:
	movl	$0, -16(%ebp)
	jmp	L3
L5:
	movl	-16(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %ecx
	movl	4(%eax), %ebx
	movl	-16(%ebp), %eax
	addl	$1, %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	cmpl	%ecx, %eax
	movl	%edx, %eax
	sbbl	%ebx, %eax
	jge	L4
	movl	-16(%ebp), %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%eax, -24(%ebp)
	movl	%edx, -20(%ebp)
	movl	-16(%ebp), %eax
	addl	$1, %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	-16(%ebp), %edx
	leal	0(,%edx,8), %ecx
	movl	8(%ebp), %edx
	addl	%edx, %ecx
	movl	4(%eax), %edx
	movl	(%eax), %eax
	movl	%eax, (%ecx)
	movl	%edx, 4(%ecx)
	movl	-16(%ebp), %eax
	addl	$1, %eax
	leal	0(,%eax,8), %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	-24(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%eax, (%ecx)
	movl	%edx, 4(%ecx)
L4:
	addl	$1, -16(%ebp)
L3:
	movl	12(%ebp), %eax
	subl	-12(%ebp), %eax
	subl	$1, %eax
	cmpl	%eax, -16(%ebp)
	jl	L5
	addl	$1, -12(%ebp)
L2:
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	%eax, -12(%ebp)
	jl	L6
	nop
	nop
	addl	$20, %esp

	.cfi_restore 3

	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE0:
	.ident	"GCC: (MinGW.org GCC Build-2) 9.2.0"
