	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Faltan dimensiones de la matriz."
.LC1:
	.string	"Tama\303\261o del vector:%u\n"
.LC5:
	.string	"Tiempo:%11.9f\t / Tama\303\261o Vector:%u\n"
.LC6:
	.string	"Y[0]=%8.6f / / A[%d]=%8.6f/\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	decl	%edi
	jg	.L2
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
.L2:
	movq	8(%rsi), %rdi
	movl	$268172524, %ebx
	leaq	Y(%rip), %rbp
	call	atoi@PLT
	cmpl	$268172524, %eax
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	cmovbe	%eax, %ebx
	xorl	%eax, %eax
	movl	%ebx, %edx
	call	__printf_chk@PLT
	movsd	.LC2(%rip), %xmm2
	leaq	X(%rip), %rdx
	xorl	%eax, %eax
.L3:
	cmpl	%eax, %ebx
	jbe	.L10
	cvtsi2sd	%ebx, %xmm0
	cvtsi2sd	%eax, %xmm1
	mulsd	%xmm2, %xmm0
	mulsd	%xmm2, %xmm1
	movapd	%xmm0, %xmm3
	subsd	%xmm1, %xmm0
	addsd	%xmm1, %xmm3
	movsd	%xmm0, 0(%rbp,%rax,8)
	movsd	%xmm3, (%rdx,%rax,8)
	incq	%rax
	jmp	.L3
.L10:
	leaq	8(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	leaq	X(%rip), %rdx
	movsd	.LC3(%rip), %xmm1
	xorl	%eax, %eax
.L5:
	cmpl	%eax, %ebx
	jbe	.L11
	movsd	(%rdx,%rax,8), %xmm0
	mulsd	%xmm1, %xmm0
	addsd	0(%rbp,%rax,8), %xmm0
	movsd	%xmm0, 0(%rbp,%rax,8)
	incq	%rax
	jmp	.L5
.L11:
	leaq	24(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	leaq	.LC5(%rip), %rsi
	movl	%ebx, %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movb	$1, %al
	divsd	.LC4(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	leal	-1(%rbx), %eax
	movsd	Y(%rip), %xmm0
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	movsd	0(%rbp,%rax,8), %xmm1
	movq	%rax, %rdx
	movb	$2, %al
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	addq	$56, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	A
	.section	.rodata
	.align 8
	.type	A, @object
	.size	A, 8
A:
	.long	0
	.long	1073479680
	.comm	Y,2145380192,32
	.comm	X,2145380192,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	2576980378
	.long	1069128089
	.align 8
.LC3:
	.long	0
	.long	1073479680
	.align 8
.LC4:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
