	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan dimensiones de la matriz."
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Tama\303\261o del vector:%u\n"
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Tiempo:%11.9f\t / Tama\303\261o Vector:%u\n"
	.section	.rodata.str1.1
.LC6:
	.string	"Y[0]=%8.6f / / A[%d]=%8.6f/\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L13
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$268172524, %ebx
	call	strtol@PLT
	cmpl	$268172524, %eax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rbp
	cmovbe	%eax, %ebx
	movl	$1, %edi
	xorl	%eax, %eax
	movl	%ebx, %edx
	call	__printf_chk@PLT
	testl	%ebp, %ebp
	je	.L3
	pxor	%xmm1, %xmm1
	leaq	X(%rip), %rbp
	leaq	Y(%rip), %r12
	movsd	.LC2(%rip), %xmm3
	xorl	%eax, %eax
	cvtsi2sd	%ebx, %xmm1
	mulsd	%xmm3, %xmm1
	.p2align 4,,10
	.p2align 3
.L4:
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm2
	movapd	%xmm1, %xmm4
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm3, %xmm0
	addsd	%xmm0, %xmm2
	subsd	%xmm0, %xmm4
	movsd	%xmm2, 0(%rbp,%rax,8)
	movsd	%xmm4, (%r12,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ebx
	ja	.L4
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movsd	.LC3(%rip), %xmm1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movsd	0(%rbp,%rax,8), %xmm0
	mulsd	%xmm1, %xmm0
	addsd	(%r12,%rax,8), %xmm0
	movsd	%xmm0, (%r12,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ebx
	ja	.L5
.L6:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leaq	.LC5(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	%ebx, %edx
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC4(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	leal	-1(%rbx), %eax
	movsd	Y(%rip), %xmm0
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	movsd	(%r12,%rax,8), %xmm1
	movq	%rax, %rdx
	movl	$2, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L14
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	leaq	Y(%rip), %r12
	call	clock_gettime@PLT
	jmp	.L6
.L14:
	call	__stack_chk_fail@PLT
.L13:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE41:
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
