	.file	"daxpy.c"
	.text
	.comm	X,2145380192,32
	.comm	Y,2145380192,32
	.globl	A
	.section	.rodata
	.align 8
	.type	A, @object
	.size	A, 8
A:
	.long	0
	.long	1073479680
	.align 8
.LC0:
	.string	"Faltan dimensiones de la matriz."
.LC1:
	.string	"Tama\303\261o del vector:%u\n"
	.align 8
.LC5:
	.string	"Tiempo:%11.9f\t / Tama\303\261o Vector:%u\n"
.LC6:
	.string	"Y[0]=%8.6f / / A[%d]=%8.6f/\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$1, -68(%rbp)
	jg	.L2
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$-1, %edi
	call	exit@PLT
.L2:
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -60(%rbp)
	cmpl	$268172524, -60(%rbp)
	jbe	.L3
	movl	$268172524, -60(%rbp)
.L3:
	movl	-60(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -64(%rbp)
	jmp	.L4
.L9:
	movl	-60(%rbp), %eax
	testq	%rax, %rax
	js	.L5
	cvtsi2sdq	%rax, %xmm0
	jmp	.L6
.L5:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L6:
	movsd	.LC2(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	cvtsi2sd	-64(%rbp), %xmm0
	movsd	.LC2(%rip), %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	X(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	movl	-60(%rbp), %eax
	testq	%rax, %rax
	js	.L7
	cvtsi2sdq	%rax, %xmm0
	jmp	.L8
.L7:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L8:
	movsd	.LC2(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	cvtsi2sd	-64(%rbp), %xmm1
	movsd	.LC2(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	Y(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	addl	$1, -64(%rbp)
.L4:
	movl	-64(%rbp), %eax
	cmpl	%eax, -60(%rbp)
	ja	.L9
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -64(%rbp)
	jmp	.L10
.L11:
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	X(%rip), %rax
	movsd	(%rdx,%rax), %xmm1
	movsd	.LC3(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	Y(%rip), %rax
	movsd	(%rdx,%rax), %xmm1
	addsd	%xmm1, %xmm0
	movl	-64(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	Y(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	addl	$1, -64(%rbp)
.L10:
	movl	-64(%rbp), %eax
	cmpl	%eax, -60(%rbp)
	ja	.L11
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC4(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movl	-60(%rbp), %edx
	movq	-56(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	leaq	.LC5(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	-60(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %eax
	leaq	0(,%rax,8), %rdx
	leaq	Y(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	movl	-60(%rbp), %eax
	leal	-1(%rax), %edx
	movq	Y(%rip), %rax
	movapd	%xmm0, %xmm1
	movl	%edx, %esi
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	leaq	.LC6(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.section	.rodata
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
