	.file	"driver.c"
	.text
	.p2align 4,,15
	.globl	_Z8checksumPjj
	.type	_Z8checksumPjj, @function
_Z8checksumPjj:
.LFB88:
	.cfi_startproc
	cmpl	$1, %esi
	jbe	.L7
	leal	-2(%rsi), %eax
	leal	-1(%rsi), %r9d
	cmpl	$14, %eax
	jbe	.L8
	movl	%r9d, %edx
	shrl	$4, %edx
	salq	$6, %rdx
	vmovdqa	.LC0(%rip), %ymm2
	vmovdqa	.LC1(%rip), %ymm7
	vmovdqa	.LC2(%rip), %ymm6
	vmovdqa	.LC3(%rip), %ymm5
	vmovdqa	.LC4(%rip), %ymm4
	addq	%rdi, %rdx
	movq	%rdi, %rax
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align 4,,10
	.p2align 3
.L5:
	vmovdqu	4(%rax), %ymm0
	addq	$64, %rax
	vpmulld	-64(%rax), %ymm0, %ymm8
	vpsrlq	$32, %ymm8, %ymm9
	vpmuludq	%ymm2, %ymm8, %ymm1
	vpmuludq	%ymm2, %ymm9, %ymm9
	vmovdqu	-28(%rax), %ymm0
	vpmulld	-32(%rax), %ymm0, %ymm0
	vpshufb	%ymm7, %ymm1, %ymm1
	vpshufb	%ymm6, %ymm9, %ymm9
	vpor	%ymm9, %ymm1, %ymm1
	vpsrld	$10, %ymm1, %ymm1
	vpmulld	%ymm5, %ymm1, %ymm1
	vpsrlq	$32, %ymm0, %ymm9
	vpmuludq	%ymm2, %ymm9, %ymm9
	vpsubd	%ymm1, %ymm8, %ymm8
	vpmuludq	%ymm2, %ymm0, %ymm1
	vpshufb	%ymm6, %ymm9, %ymm9
	vpshufb	%ymm7, %ymm1, %ymm1
	vpor	%ymm9, %ymm1, %ymm1
	vpsrld	$10, %ymm1, %ymm1
	vpmulld	%ymm5, %ymm1, %ymm1
	vpsubd	%ymm1, %ymm0, %ymm0
	vpand	%ymm0, %ymm4, %ymm0
	vpand	%ymm8, %ymm4, %ymm1
	vpackusdw	%ymm0, %ymm1, %ymm1
	vpermq	$216, %ymm1, %ymm1
	vpaddw	%ymm1, %ymm3, %ymm3
	cmpq	%rax, %rdx
	jne	.L5
	vmovdqa	%xmm3, %xmm0
	vextracti128	$1, %ymm3, %xmm3
	vpaddw	%xmm3, %xmm0, %xmm3
	vpsrldq	$8, %xmm3, %xmm0
	vpaddw	%xmm0, %xmm3, %xmm3
	vpsrldq	$4, %xmm3, %xmm0
	vpaddw	%xmm0, %xmm3, %xmm3
	vpsrldq	$2, %xmm3, %xmm0
	movl	%r9d, %eax
	vpaddw	%xmm0, %xmm3, %xmm3
	andl	$-16, %eax
	vpextrw	$0, %xmm3, %ecx
	leal	1(%rax), %r8d
	cmpl	%r9d, %eax
	je	.L16
	vzeroupper
.L3:
	leal	-1(%r8), %eax
	movl	(%rdi,%rax,4), %r10d
	movl	%r8d, %r11d
	imull	(%rdi,%r11,4), %r10d
	movl	$-1954335837, %r9d
	movl	%r10d, %eax
	mull	%r9d
	leal	1(%r8), %eax
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r10d
	addl	%r10d, %ecx
	cmpl	%eax, %esi
	jbe	.L12
	movl	(%rdi,%rax,4), %r10d
	movl	(%rdi,%r11,4), %eax
	imull	%r10d, %eax
	movl	%eax, %r11d
	mull	%r9d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r11d
	addl	%r11d, %ecx
	leal	2(%r8), %r11d
	cmpl	%r11d, %esi
	jbe	.L12
	imull	(%rdi,%r11,4), %r10d
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%r10d, %eax
	mull	%r9d
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	pushq	%rbx
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	leal	3(%r8), %ebx
	subl	%edx, %r10d
	addl	%r10d, %ecx
	cmpl	%ebx, %esi
	jbe	.L10
	movl	(%rdi,%r11,4), %r10d
	leal	4(%r8), %r11d
	imull	(%rdi,%rbx,4), %r10d
	movl	%r10d, %eax
	mull	%r9d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r10d
	addl	%r10d, %ecx
	cmpl	%r11d, %esi
	jbe	.L10
	movl	(%rdi,%rbx,4), %r10d
	leal	5(%r8), %ebx
	imull	(%rdi,%r11,4), %r10d
	movl	%r10d, %eax
	mull	%r9d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r10d
	addl	%r10d, %ecx
	cmpl	%ebx, %esi
	jbe	.L10
	movl	(%rdi,%r11,4), %r10d
	leal	6(%r8), %r11d
	imull	(%rdi,%rbx,4), %r10d
	movl	%r10d, %eax
	mull	%r9d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r10d
	addl	%r10d, %ecx
	cmpl	%r11d, %esi
	jbe	.L10
	movl	(%rdi,%rbx,4), %r10d
	leal	7(%r8), %ebx
	imull	(%rdi,%r11,4), %r10d
	movl	%r10d, %eax
	mull	%r9d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r10d
	addl	%r10d, %ecx
	cmpl	%ebx, %esi
	jbe	.L10
	movl	(%rdi,%r11,4), %r10d
	leal	8(%r8), %r12d
	imull	(%rdi,%rbx,4), %r10d
	movl	%r10d, %eax
	mull	%r9d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r10d
	addl	%r10d, %ecx
	cmpl	%r12d, %esi
	jbe	.L10
	movl	(%rdi,%rbx,4), %r10d
	leal	9(%r8), %r11d
	imull	(%rdi,%r12,4), %r10d
	movl	%r10d, %eax
	mull	%r9d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r10d
	addl	%r10d, %ecx
	cmpl	%r11d, %esi
	jbe	.L10
	movl	(%rdi,%r12,4), %r10d
	movl	%r11d, %eax
	imull	(%rdi,%rax,4), %r10d
	leal	10(%r8), %ebx
	movl	%r10d, %eax
	mull	%r9d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r10d
	addl	%r10d, %ecx
	cmpl	%ebx, %esi
	jbe	.L10
	movl	(%rdi,%r11,4), %r10d
	leal	11(%r8), %r11d
	imull	(%rdi,%rbx,4), %r10d
	movl	%r10d, %eax
	mull	%r9d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r10d
	addl	%r10d, %ecx
	cmpl	%r11d, %esi
	jbe	.L10
	movl	(%rdi,%rbx,4), %r10d
	leal	12(%r8), %ebx
	imull	(%rdi,%r11,4), %r10d
	movl	%r10d, %eax
	mull	%r9d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r10d
	addl	%r10d, %ecx
	cmpl	%ebx, %esi
	jbe	.L10
	movl	(%rdi,%r11,4), %r10d
	leal	13(%r8), %r11d
	imull	(%rdi,%rbx,4), %r10d
	movl	%r10d, %eax
	mull	%r9d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r10d
	addl	%r10d, %ecx
	cmpl	%r11d, %esi
	jbe	.L10
	movl	(%rdi,%rbx,4), %r10d
	addl	$14, %r8d
	imull	(%rdi,%r11,4), %r10d
	movl	%r10d, %eax
	mull	%r9d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r10d
	addl	%r10d, %ecx
	cmpl	%r8d, %esi
	jbe	.L10
	movl	(%rdi,%r11,4), %esi
	imull	(%rdi,%r8,4), %esi
	movl	%esi, %eax
	mull	%r9d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %esi
	addl	%esi, %ecx
.L10:
	popq	%rbx
	popq	%r12
	movl	%ecx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	xorl	%ecx, %ecx
.L12:
	movl	%ecx, %eax
	ret
.L8:
	movl	$1, %r8d
	xorl	%ecx, %ecx
	jmp	.L3
.L16:
	vzeroupper
	jmp	.L12
	.cfi_endproc
.LFE88:
	.size	_Z8checksumPjj, .-_Z8checksumPjj
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"Requires arguments: quotes filename and no. of repetitions\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC7:
	.string	"r"
.LC8:
	.string	"open input file"
.LC9:
	.string	"fseek input file"
.LC10:
	.string	"ftell input file"
.LC11:
	.string	"read input file"
.LC12:
	.string	"\n"
.LC14:
	.string	"driver.c"
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"checksum(nums, nlines) == QUOTES_CSUM"
	.section	.rodata.str1.1
.LC16:
	.string	"Best run time overall: %gs\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB89:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$64, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	cmpl	$2, %edi
	jle	.L41
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	leaq	.LC7(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L42
	xorl	%esi, %esi
	movl	$2, %edx
	movq	%rax, %rdi
	call	fseek@PLT
	cmpl	$-1, %eax
	je	.L43
	movq	%r13, %rdi
	call	ftell@PLT
	movq	%rax, %r12
	cmpq	$-1, %rax
	je	.L44
	movq	%r13, %rdi
	call	rewind@PLT
	movq	%r12, %rdi
	call	malloc@PLT
	movq	%rax, %rdi
	movq	%r13, %rcx
	movq	%r12, %rdx
	movl	$1, %esi
	movq	%rax, -96(%rbp)
	call	fread@PLT
	testq	%rax, %rax
	je	.L45
	movq	%r13, %rdi
	call	fclose@PLT
	leaq	0(,%r12,8), %rdi
	call	malloc@PLT
	movq	-96(%rbp), %rdi
	leaq	.LC12(%rip), %rsi
	movq	%rax, %r15
	movq	%rax, -64(%rbp)
	call	strtok@PLT
	movq	%rax, (%r15)
	movl	$1, %r12d
	leaq	.LC12(%rip), %r13
	movq	%rbx, -56(%rbp)
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L46:
	incl	%r12d
.L24:
	movl	%r12d, %r14d
	movq	%r13, %rsi
	xorl	%edi, %edi
	leaq	(%r15,%r14,8), %rbx
	call	strtok@PLT
	movq	%rax, (%rbx)
	testq	%rax, %rax
	jne	.L46
	movq	-56(%rbp), %rbx
	movq	%r14, %rsi
	movl	$4, %edi
	call	calloc@PLT
	movq	16(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %r14
	call	strtol@PLT
	movl	%eax, -68(%rbp)
	testl	%eax, %eax
	jle	.L34
	leal	-1(%r12), %eax
	movl	%eax, %r11d
	movl	%eax, -76(%rbp)
	shrl	$4, %r11d
	andl	$-16, %eax
	leal	-2(%r12), %ebx
	salq	$6, %r11
	movl	%eax, -80(%rbp)
	incl	%eax
	movl	%ebx, -72(%rbp)
	movl	%eax, -84(%rbp)
	leaq	(%r14,%r11), %rbx
	movq	%r14, %rax
	vmovsd	.LC5(%rip), %xmm0
	movl	%r12d, %r14d
	movl	$-1954335837, %r13d
	movq	%rbx, %r15
	movq	%rax, %r12
	.p2align 4,,10
	.p2align 3
.L33:
	vmovsd	%xmm0, -56(%rbp)
	call	clock@PLT
	movq	-64(%rbp), %rsi
	movq	%r12, %rdx
	movl	%r14d, %edi
	movq	%rax, %rbx
	call	_Z11convert_alljPPcPj@PLT
	call	clock@PLT
	subq	%rbx, %rax
	vxorpd	%xmm9, %xmm9, %xmm9
	vcvtsi2sdq	%rax, %xmm9, %xmm9
	vdivsd	.LC13(%rip), %xmm9, %xmm9
	cmpl	$1, %r14d
	jbe	.L26
	cmpl	$14, -72(%rbp)
	vmovsd	-56(%rbp), %xmm0
	vmovdqa	.LC0(%rip), %ymm3
	vmovdqa	.LC1(%rip), %ymm8
	vmovdqa	.LC2(%rip), %ymm7
	vmovdqa	.LC3(%rip), %ymm6
	vmovdqa	.LC4(%rip), %ymm5
	jbe	.L35
	movq	%r12, %rax
	vpxor	%xmm4, %xmm4, %xmm4
	.p2align 4,,10
	.p2align 3
.L28:
	vmovdqu	4(%rax), %ymm1
	addq	$64, %rax
	vpmulld	-64(%rax), %ymm1, %ymm10
	vpsrlq	$32, %ymm10, %ymm11
	vpmuludq	%ymm3, %ymm10, %ymm2
	vpmuludq	%ymm3, %ymm11, %ymm11
	vmovdqu	-28(%rax), %ymm1
	vpmulld	-32(%rax), %ymm1, %ymm1
	vpshufb	%ymm8, %ymm2, %ymm2
	vpshufb	%ymm7, %ymm11, %ymm11
	vpor	%ymm11, %ymm2, %ymm2
	vpsrld	$10, %ymm2, %ymm2
	vpmulld	%ymm6, %ymm2, %ymm2
	vpsrlq	$32, %ymm1, %ymm11
	vpmuludq	%ymm3, %ymm11, %ymm11
	vpsubd	%ymm2, %ymm10, %ymm10
	vpmuludq	%ymm3, %ymm1, %ymm2
	vpshufb	%ymm7, %ymm11, %ymm11
	vpshufb	%ymm8, %ymm2, %ymm2
	vpor	%ymm11, %ymm2, %ymm2
	vpsrld	$10, %ymm2, %ymm2
	vpmulld	%ymm6, %ymm2, %ymm2
	vpsubd	%ymm2, %ymm1, %ymm1
	vpand	%ymm1, %ymm5, %ymm1
	vpand	%ymm10, %ymm5, %ymm2
	vpackusdw	%ymm1, %ymm2, %ymm2
	vpermq	$216, %ymm2, %ymm2
	vpaddw	%ymm2, %ymm4, %ymm4
	cmpq	%rax, %r15
	jne	.L28
	vmovdqa	%xmm4, %xmm1
	vextracti128	$1, %ymm4, %xmm4
	vpaddw	%xmm4, %xmm1, %xmm4
	vpsrldq	$8, %xmm4, %xmm1
	vpaddw	%xmm1, %xmm4, %xmm4
	vpsrldq	$4, %xmm4, %xmm1
	vpaddw	%xmm1, %xmm4, %xmm4
	vpsrldq	$2, %xmm4, %xmm1
	movl	-80(%rbp), %ebx
	vpaddw	%xmm1, %xmm4, %xmm4
	vpextrw	$0, %xmm4, %ecx
	cmpl	%ebx, -76(%rbp)
	je	.L29
	movl	-84(%rbp), %esi
.L27:
	leal	-1(%rsi), %eax
	movl	(%r12,%rax,4), %edi
	movl	%esi, %r11d
	imull	(%r12,%r11,4), %edi
	movl	%edi, %eax
	mull	%r13d
	leal	1(%rsi), %eax
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %edi
	addl	%edi, %ecx
	cmpl	%eax, %r14d
	jbe	.L29
	movl	(%r12,%rax,4), %edi
	movl	(%r12,%r11,4), %eax
	imull	%edi, %eax
	movl	%eax, %r11d
	mull	%r13d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r11d
	addl	%r11d, %ecx
	leal	2(%rsi), %r11d
	cmpl	%r11d, %r14d
	jbe	.L29
	imull	(%r12,%r11,4), %edi
	movl	%edi, %eax
	mull	%r13d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %edi
	addl	%edi, %ecx
	leal	3(%rsi), %edi
	cmpl	%edi, %r14d
	jbe	.L29
	movl	(%r12,%r11,4), %r11d
	imull	(%r12,%rdi,4), %r11d
	movl	%r11d, %eax
	mull	%r13d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r11d
	addl	%r11d, %ecx
	leal	4(%rsi), %r11d
	cmpl	%r11d, %r14d
	jbe	.L29
	movl	(%r12,%rdi,4), %edi
	imull	(%r12,%r11,4), %edi
	movl	%edi, %eax
	mull	%r13d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %edi
	addl	%edi, %ecx
	leal	5(%rsi), %edi
	cmpl	%edi, %r14d
	jbe	.L29
	movl	(%r12,%r11,4), %r11d
	imull	(%r12,%rdi,4), %r11d
	movl	%r11d, %eax
	mull	%r13d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r11d
	addl	%r11d, %ecx
	leal	6(%rsi), %r11d
	cmpl	%r11d, %r14d
	jbe	.L29
	movl	(%r12,%rdi,4), %edi
	imull	(%r12,%r11,4), %edi
	movl	%edi, %eax
	mull	%r13d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %edi
	addl	%edi, %ecx
	leal	7(%rsi), %edi
	cmpl	%edi, %r14d
	jbe	.L29
	movl	(%r12,%r11,4), %r11d
	imull	(%r12,%rdi,4), %r11d
	movl	%r11d, %eax
	mull	%r13d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r11d
	addl	%r11d, %ecx
	leal	8(%rsi), %r11d
	cmpl	%r11d, %r14d
	jbe	.L29
	movl	(%r12,%rdi,4), %edi
	imull	(%r12,%r11,4), %edi
	movl	%edi, %eax
	mull	%r13d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %edi
	addl	%edi, %ecx
	leal	9(%rsi), %edi
	cmpl	%edi, %r14d
	jbe	.L29
	movl	(%r12,%r11,4), %r11d
	movl	%edi, %eax
	imull	(%r12,%rax,4), %r11d
	movl	%r11d, %eax
	mull	%r13d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r11d
	addl	%r11d, %ecx
	leal	10(%rsi), %r11d
	cmpl	%r11d, %r14d
	jbe	.L29
	movl	(%r12,%rdi,4), %edi
	imull	(%r12,%r11,4), %edi
	movl	%edi, %eax
	mull	%r13d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %edi
	addl	%edi, %ecx
	leal	11(%rsi), %edi
	cmpl	%edi, %r14d
	jbe	.L29
	movl	(%r12,%r11,4), %r11d
	imull	(%r12,%rdi,4), %r11d
	movl	%r11d, %eax
	mull	%r13d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r11d
	addl	%r11d, %ecx
	leal	12(%rsi), %r11d
	cmpl	%r11d, %r14d
	jbe	.L29
	movl	(%r12,%rdi,4), %edi
	imull	(%r12,%r11,4), %edi
	movl	%edi, %eax
	mull	%r13d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %edi
	addl	%edi, %ecx
	leal	13(%rsi), %edi
	cmpl	%edi, %r14d
	jbe	.L29
	movl	(%r12,%r11,4), %r11d
	addl	$14, %esi
	imull	(%r12,%rdi,4), %r11d
	movl	%r11d, %eax
	mull	%r13d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %r11d
	addl	%r11d, %ecx
	cmpl	%esi, %r14d
	jbe	.L29
	movl	(%r12,%rdi,4), %eax
	imull	(%r12,%rsi,4), %eax
	movl	%eax, %esi
	mull	%r13d
	shrl	$10, %edx
	imull	$1879, %edx, %edx
	subl	%edx, %esi
	addl	%esi, %ecx
	.p2align 4,,10
	.p2align 3
.L29:
	cmpw	$-13500, %cx
	jne	.L47
	decl	-68(%rbp)
	vminsd	%xmm0, %xmm9, %xmm0
	je	.L48
	vzeroupper
	jmp	.L33
.L35:
	xorl	%ecx, %ecx
	movl	$1, %esi
	jmp	.L27
.L48:
	movq	%r12, %r14
	vzeroupper
.L25:
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movq	%r14, %rdi
	call	free@PLT
	movq	-64(%rbp), %rdi
	call	free@PLT
	movq	-96(%rbp), %rdi
	call	free@PLT
	addq	$64, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	xorl	%eax, %eax
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L34:
	.cfi_restore_state
	vmovsd	.LC5(%rip), %xmm0
	jmp	.L25
.L47:
	vzeroupper
.L26:
	leaq	_ZZ4mainE19__PRETTY_FUNCTION__(%rip), %rcx
	movl	$71, %edx
	leaq	.LC14(%rip), %rsi
	leaq	.LC15(%rip), %rdi
	call	__assert_fail@PLT
.L45:
	leaq	.LC11(%rip), %rdi
	call	perror@PLT
	movl	$-5, %edi
	call	exit@PLT
.L44:
	leaq	.LC10(%rip), %rdi
	call	perror@PLT
	movl	$-4, %edi
	call	exit@PLT
.L43:
	leaq	.LC9(%rip), %rdi
	call	perror@PLT
	movl	$-3, %edi
	call	exit@PLT
.L42:
	leaq	.LC8(%rip), %rdi
	call	perror@PLT
	movl	$-2, %edi
	call	exit@PLT
.L41:
	movq	stderr(%rip), %rcx
	leaq	.LC6(%rip), %rdi
	movl	$59, %edx
	movl	$1, %esi
	call	fwrite@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE89:
	.size	main, .-main
	.section	.rodata
	.align 16
	.type	_ZZ4mainE19__PRETTY_FUNCTION__, @object
	.size	_ZZ4mainE19__PRETTY_FUNCTION__, 22
_ZZ4mainE19__PRETTY_FUNCTION__:
	.string	"int main(int, char**)"
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.long	-1954335837
	.long	-1954335837
	.long	-1954335837
	.long	-1954335837
	.long	-1954335837
	.long	-1954335837
	.long	-1954335837
	.long	-1954335837
	.align 32
.LC1:
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.align 32
.LC2:
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	-128
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.align 32
.LC3:
	.long	1879
	.long	1879
	.long	1879
	.long	1879
	.long	1879
	.long	1879
	.long	1879
	.long	1879
	.align 32
.LC4:
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.long	65535
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	0
	.long	1104006501
	.align 8
.LC13:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 8.2.0-1ubuntu2~18.04) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
