	.file	"figura1-modificado_b.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Tiempo:%11.9f\n"
.LC2:
	.string	"R[0]=%d / / R[39999]]=%d/\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%edi, %edi
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	movq	%rsp, %rsi
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	call	clock_gettime@PLT
	leaq	40000+s(%rip), %r9
	leaq	R(%rip), %r11
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L5:
	leaq	s(%rip), %rax
	movl	%r10d, %esi
	xorl	%ecx, %ecx
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L2:
	movl	20(%rax), %edi
	movl	16(%rax), %edx
	addq	$32, %rax
	leal	(%rdi,%rdi,2), %r8d
	movl	-32(%rax), %edi
	leal	(%rsi,%rdx,2), %edx
	subl	%esi, %r8d
	leal	(%rsi,%rdi,2), %edi
	addl	%ebx, %edi
	movl	-24(%rax), %ebx
	leal	(%rsi,%rbx,2), %ebx
	addl	%ebx, %edi
	leal	(%rdi,%rdx,2), %ebx
	movl	-28(%rax), %edi
	leal	(%rdi,%rdi,2), %edx
	subl	%esi, %edx
	addl	%edx, %ecx
	movl	-20(%rax), %edx
	leal	(%rdx,%rdx,2), %edx
	subl	%esi, %edx
	addl	%ecx, %edx
	cmpq	%rax, %r9
	leal	(%rdx,%r8,2), %ecx
	jne	.L2
	cmpl	%ecx, %ebx
	jge	.L3
	movl	%ebx, (%r11,%r10,4)
.L4:
	addq	$1, %r10
	cmpq	$40000, %r10
	jne	.L5
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	movl	%ecx, X2(%rip)
	movl	%ebx, X1(%rip)
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leaq	.LC1(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	movl	159996+R(%rip), %ecx
	movl	R(%rip), %edx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L11
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	movl	%ecx, (%r11,%r10,4)
	jmp	.L4
.L11:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.comm	R,160000,32
	.comm	X2,4,4
	.comm	X1,4,4
	.comm	s,40000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
