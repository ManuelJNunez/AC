	.file	"pmm-secuencial-modificado_a.c"
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L19
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
	leaq	C(%rip), %rcx
	movsd	.LC2(%rip), %xmm2
	xorl	%esi, %esi
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
	movapd	%xmm1, %xmm6
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm2, %xmm0
	subsd	%xmm0, %xmm6
	movsd	%xmm6, (%rdx,%rax,8)
	movsd	%xmm6, (%rcx,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ebx
	ja	.L5
	addl	$1, %esi
	addq	$92632, %rdx
	addq	$92632, %rcx
	cmpl	%esi, %ebx
	ja	.L4
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	xorl	%r15d, %r15d
	call	clock_gettime@PLT
	leaq	92632+B(%rip), %r8
	leaq	A(%rip), %rax
	leaq	92632(%r8), %rdi
	leaq	92632(%rax), %r13
	leaq	185264(%rax), %r12
	leaq	277896(%rax), %r11
	movq	%rax, 8(%rsp)
	movq	%rax, %r14
	leaq	92632(%rdi), %rsi
	.p2align 4,,10
	.p2align 3
.L7:
	leaq	C(%rip), %r10
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L11:
	leaq	0(,%rcx,8), %r9
	movsd	(%r14,%rcx,8), %xmm4
	movsd	0(%r13,%rcx,8), %xmm3
	movq	%r10, %rdx
	movsd	(%r12,%rcx,8), %xmm2
	xorl	%eax, %eax
	movsd	(%r11,%rcx,8), %xmm1
	.p2align 4,,10
	.p2align 3
.L8:
	movsd	(%rdx), %xmm0
	addq	$92632, %rdx
	movsd	0(%rbp,%rax,8), %xmm5
	mulsd	%xmm0, %xmm5
	addsd	%xmm5, %xmm4
	movsd	(%r8,%rax,8), %xmm5
	mulsd	%xmm0, %xmm5
	addsd	%xmm5, %xmm3
	movsd	(%rdi,%rax,8), %xmm5
	mulsd	%xmm0, %xmm5
	mulsd	(%rsi,%rax,8), %xmm0
	addq	$1, %rax
	cmpl	%eax, %ebx
	addsd	%xmm5, %xmm2
	addsd	%xmm0, %xmm1
	ja	.L8
	addq	$1, %rcx
	addq	$8, %r10
	movsd	%xmm4, (%r14,%r9)
	cmpl	%ecx, %ebx
	movsd	%xmm3, 0(%r13,%r9)
	movsd	%xmm2, (%r12,%r9)
	movsd	%xmm1, (%r11,%r9)
	ja	.L11
	addl	$4, %r15d
	addq	$370528, %r14
	addq	$370528, %r13
	addq	$370528, %r12
	addq	$370528, %r11
	addq	$370528, %rbp
	addq	$370528, %r8
	addq	$370528, %rdi
	addq	$370528, %rsi
	cmpl	%ebx, %r15d
	jb	.L7
.L10:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	leaq	.LC4(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	%ebx, %ecx
	pxor	%xmm1, %xmm1
	movl	%ebx, %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	leal	-1(%rbx), %eax
	movq	8(%rsp), %rdi
	leaq	.LC5(%rip), %rsi
	movsd	A(%rip), %xmm0
	movq	%rax, %rdx
	imulq	$92640, %rax, %rax
	movl	%edx, %ecx
	movsd	(%rdi,%rax), %xmm1
	movl	$1, %edi
	movl	$2, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	56(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L20
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	leaq	A(%rip), %rax
	movq	%rax, 8(%rsp)
	jmp	.L10
.L20:
	call	__stack_chk_fail@PLT
.L19:
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
