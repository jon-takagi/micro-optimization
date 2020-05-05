	.file	"converter.c"
	.text
	.p2align 4,,15
	.globl	_Z11convert_alljPPcPj
	.type	_Z11convert_alljPPcPj, @function
_Z11convert_alljPPcPj:
.LFB2107:
	.cfi_startproc
	testl	%edi, %edi
	je	.L11
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leal	-1(%rdi), %r11d
	xorl	%r9d, %r9d
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L15:
	imull	$100, %eax, %eax
	leal	(%rdi,%rdi,4), %ecx
	leal	(%rax,%rcx,2), %eax
	addl	%eax, %r10d
	movl	%r10d, (%rdx,%r9,4)
.L4:
	leaq	1(%r9), %rax
	cmpq	%r11, %r9
	je	.L9
.L16:
	movq	%rax, %r9
.L7:
	movq	(%rsi,%r9,8), %r8
	movsbl	(%r8), %eax
	movsbl	1(%r8), %edi
	movsbl	2(%r8), %r10d
	movsbl	3(%r8), %ebx
	subl	$48, %eax
	subl	$48, %edi
	subl	$48, %r10d
	testb	%bl, %bl
	je	.L15
	movsbl	4(%r8), %ecx
	subl	$48, %ebx
	testb	%cl, %cl
	jne	.L5
	imull	$1000, %eax, %ecx
	imull	$100, %edi, %edi
	leal	(%r10,%r10,4), %eax
	addl	%edi, %ecx
	leal	(%rcx,%rax,2), %eax
	addl	%eax, %ebx
	movl	%ebx, (%rdx,%r9,4)
	leaq	1(%r9), %rax
	cmpq	%r11, %r9
	jne	.L16
.L9:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L5:
	.cfi_restore_state
	imull	$1000, %edi, %edi
	imull	$10000, %eax, %eax
	imull	$100, %r10d, %r10d
	addl	%edi, %eax
	addl	%r10d, %eax
	leal	(%rbx,%rbx,4), %edi
	leal	(%rax,%rdi,2), %eax
	leal	-48(%rax,%rcx), %eax
	movl	%eax, (%rdx,%r9,4)
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L11:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE2107:
	.size	_Z11convert_alljPPcPj, .-_Z11convert_alljPPcPj
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.type	_GLOBAL__sub_I__Z11convert_alljPPcPj, @function
_GLOBAL__sub_I__Z11convert_alljPPcPj:
.LFB2588:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	_ZStL8__ioinit(%rip), %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE2588:
	.size	_GLOBAL__sub_I__Z11convert_alljPPcPj, .-_GLOBAL__sub_I__Z11convert_alljPPcPj
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z11convert_alljPPcPj
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 8.2.0-1ubuntu2~18.04) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
