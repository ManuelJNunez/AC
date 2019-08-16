	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Faltan dimensiones de la matriz."
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Tama\303\261o del vector:%u\n"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Tiempo:%11.9f\t / Tama\303\261o Vector:%u\n"
	.section	.rodata.str1.1
.LC10:
	.string	"Y[0]=%8.6f / / A[%d]=%8.6f/\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L21
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$268172524, %ebx
	call	strtol@PLT
	cmpl	$268172524, %eax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %r13
	cmovbe	%eax, %ebx
	movl	$1, %edi
	xorl	%eax, %eax
	movl	%ebx, %edx
	call	__printf_chk@PLT
	testl	%r13d, %r13d
	je	.L3
	pxor	%xmm5, %xmm5
	cmpl	$3, %r13d
	movsd	.LC3(%rip), %xmm8
	cvtsi2sd	%ebx, %xmm5
	mulsd	%xmm8, %xmm5
	jbe	.L14
	movapd	%xmm5, %xmm3
	leaq	X(%rip), %r12
	leaq	Y(%rip), %rbp
	movl	%ebx, %esi
	movdqa	.LC0(%rip), %xmm2
	unpcklpd	%xmm3, %xmm3
	shrl	$2, %esi
	movdqa	.LC4(%rip), %xmm7
	movq	%r12, %rcx
	movq	%rbp, %rax
	xorl	%edx, %edx
	movapd	.LC5(%rip), %xmm4
	.p2align 4,,10
	.p2align 3
.L5:
	cvtdq2pd	%xmm2, %xmm1
	mulpd	%xmm4, %xmm1
	addl	$1, %edx
	addq	$32, %rcx
	addq	$32, %rax
	pshufd	$238, %xmm2, %xmm0
	paddd	%xmm7, %xmm2
	movapd	%xmm1, %xmm6
	cvtdq2pd	%xmm0, %xmm0
	mulpd	%xmm4, %xmm0
	addpd	%xmm3, %xmm6
	movaps	%xmm6, -32(%rcx)
	movapd	%xmm0, %xmm6
	addpd	%xmm3, %xmm6
	movaps	%xmm6, -16(%rcx)
	movapd	%xmm3, %xmm6
	subpd	%xmm1, %xmm6
	movapd	%xmm3, %xmm1
	subpd	%xmm0, %xmm1
	movaps	%xmm6, -32(%rax)
	movaps	%xmm1, -16(%rax)
	cmpl	%edx, %esi
	ja	.L5
	movl	%ebx, %eax
	andl	$-4, %eax
	cmpl	%eax, %ebx
	je	.L6
.L4:
	pxor	%xmm0, %xmm0
	movapd	%xmm5, %xmm1
	movapd	%xmm5, %xmm7
	movslq	%eax, %rdx
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm8, %xmm0
	addsd	%xmm0, %xmm1
	subsd	%xmm0, %xmm7
	movsd	%xmm1, (%r12,%rdx,8)
	movsd	%xmm7, 0(%rbp,%rdx,8)
	leal	1(%rax), %edx
	cmpl	%edx, %ebx
	jbe	.L7
	pxor	%xmm0, %xmm0
	movapd	%xmm5, %xmm1
	movapd	%xmm5, %xmm7
	addl	$2, %eax
	cmpl	%eax, %ebx
	cvtsi2sd	%edx, %xmm0
	movslq	%edx, %rdx
	mulsd	%xmm8, %xmm0
	addsd	%xmm0, %xmm1
	subsd	%xmm0, %xmm7
	movsd	%xmm1, (%r12,%rdx,8)
	movsd	%xmm7, 0(%rbp,%rdx,8)
	jbe	.L6
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	cltq
	mulsd	%xmm0, %xmm8
	movapd	%xmm5, %xmm0
	subsd	%xmm8, %xmm5
	addsd	%xmm8, %xmm0
	movsd	%xmm5, 0(%rbp,%rax,8)
	movsd	%xmm0, (%r12,%rax,8)
.L6:
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
.L12:
	movl	%ebx, %esi
	leaq	X(%rip), %rcx
	leaq	Y(%rip), %rax
	movapd	.LC6(%rip), %xmm1
	shrl	%esi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L9:
	movapd	(%rcx), %xmm0
	addl	$1, %edx
	addq	$16, %rcx
	addq	$16, %rax
	mulpd	%xmm1, %xmm0
	addpd	-16(%rax), %xmm0
	movaps	%xmm0, -16(%rax)
	cmpl	%edx, %esi
	ja	.L9
	movl	%ebx, %eax
	andl	$-2, %eax
	cmpl	%ebx, %eax
	je	.L11
.L8:
	movsd	.LC7(%rip), %xmm0
	cltq
	mulsd	(%r12,%rax,8), %xmm0
	addsd	0(%rbp,%rax,8), %xmm0
	movsd	%xmm0, 0(%rbp,%rax,8)
.L11:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leaq	.LC9(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	%ebx, %edx
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC8(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	leal	-1(%rbx), %eax
	movsd	Y(%rip), %xmm0
	leaq	.LC10(%rip), %rsi
	movl	$1, %edi
	movsd	0(%rbp,%rax,8), %xmm1
	movq	%rax, %rdx
	movl	$2, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L22
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	leaq	Y(%rip), %rbp
	call	clock_gettime@PLT
	jmp	.L11
.L7:
	xorl	%edi, %edi
	movq	%rsp, %rsi
	call	clock_gettime@PLT
	xorl	%eax, %eax
	cmpl	$1, %r13d
	jbe	.L8
	jmp	.L12
.L14:
	xorl	%eax, %eax
	leaq	X(%rip), %r12
	leaq	Y(%rip), %rbp
	jmp	.L4
.L22:
	call	__stack_chk_fail@PLT
.L21:
	leaq	.LC1(%rip), %rdi
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	2576980378
	.long	1069128089
	.section	.rodata.cst16
	.align 16
.LC4:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC5:
	.long	2576980378
	.long	1069128089
	.long	2576980378
	.long	1069128089
	.align 16
.LC6:
	.long	0
	.long	1073479680
	.long	0
	.long	1073479680
	.section	.rodata.cst8
	.align 8
.LC7:
	.long	0
	.long	1073479680
	.align 8
.LC8:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
