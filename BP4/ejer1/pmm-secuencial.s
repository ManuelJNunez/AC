	.file	"pmm-secuencial.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan dimensiones de la matriz."
	.align 8
.LC1:
	.string	"Dimensiones de la matriz:%ux%u (%lu B)\n"
	.align 8
.LC4:
	.string	"Tiempo:%11.9f\t / Tama\303\261o Matrices:%ux%u\n"
	.align 8
.LC5:
	.string	"A[0][0]=%8.6f / / A[%d][%d]=%8.6f/\n"
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
	jle	.L18
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$11579, %ebx
	call	strtol@PLT
	cmpl	$11579, %eax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rbp
	cmovbe	%eax, %ebx
	movl	$4, %r8d
	xorl	%eax, %eax
	movl	%ebx, %ecx
	movl	%ebx, %edx
	movl	$1, %edi
	call	__printf_chk@PLT
	testl	%ebp, %ebp
	je	.L3
	pxor	%xmm1, %xmm1
	leaq	B(%rip), %rbp
	leaq	C(%rip), %r12
	movsd	.LC2(%rip), %xmm2
	xorl	%esi, %esi
	movq	%r12, %rcx
	movq	%rbp, %rdx
	cvtsi2sd	%ebx, %xmm1
	mulsd	%xmm2, %xmm1
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm3
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm2, %xmm0
	subsd	%xmm0, %xmm3
	movsd	%xmm3, (%rdx,%rax,8)
	movsd	%xmm3, (%rcx,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ebx
	ja	.L5
	addl	$1, %esi
	addq	$92632, %rdx
	addq	$92632, %rcx
	cmpl	%esi, %ebx
	ja	.L4
	leaq	A(%rip), %r13
	xorl	%edi, %edi
	movq	%rsp, %rsi
	call	clock_gettime@PLT
	movq	%r13, %rdi
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%r12, %rsi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L11:
	leaq	0(,%rcx,8), %r8
	movsd	(%rdi,%rcx,8), %xmm1
	movq	%rsi, %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L8:
	movsd	0(%rbp,%rax,8), %xmm0
	addq	$1, %rax
	addq	$92632, %rdx
	mulsd	-92632(%rdx), %xmm0
	cmpl	%eax, %ebx
	addsd	%xmm0, %xmm1
	ja	.L8
	addq	$1, %rcx
	addq	$8, %rsi
	movsd	%xmm1, (%rdi,%r8)
	cmpl	%ecx, %ebx
	ja	.L11
	addl	$1, %r9d
	addq	$92632, %rdi
	addq	$92632, %rbp
	cmpl	%r9d, %ebx
	ja	.L7
.L10:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leaq	.LC4(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	%ebx, %ecx
	pxor	%xmm1, %xmm1
	movl	%ebx, %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	leal	-1(%rbx), %eax
	movsd	A(%rip), %xmm0
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	movq	%rax, %rdx
	imulq	$92640, %rax, %rax
	movl	%edx, %ecx
	movsd	0(%r13,%rax), %xmm1
	movl	$2, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L19
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
	leaq	A(%rip), %r13
	call	clock_gettime@PLT
	jmp	.L10
.L19:
	call	__stack_chk_fail@PLT
.L18:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.comm	C,1072585928,32
	.comm	B,1072585928,32
	.comm	A,1072585928,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	2576980378
	.long	1069128089
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
