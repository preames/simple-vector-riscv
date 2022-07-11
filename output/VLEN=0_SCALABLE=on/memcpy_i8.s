	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"memcpy_i8.c"
	.globl	my_memcpy
	.p2align	1
	.type	my_memcpy,@function
my_memcpy:
	beqz	a0, .LBB0_6
	zext.w	a7, a0
	csrr	t0, vlenb
	slli	t1, t0, 1
	bltu	a7, t1, .LBB0_3
	sub	a0, a1, a2
	bgeu	a0, t1, .LBB0_7
.LBB0_3:
	li	a3, 0
.LBB0_4:
	add	a2, a2, a3
	add	a1, a1, a3
	sub	a0, a7, a3
.LBB0_5:
	lb	a3, 0(a2)
	sb	a3, 0(a1)
	addi	a2, a2, 1
	addi	a0, a0, -1
	addi	a1, a1, 1
	bnez	a0, .LBB0_5
.LBB0_6:
	ret
.LBB0_7:
	li	a5, 0
	remu	a6, a7, t1
	sub	a3, a7, a6
	add	t2, a2, t0
	add	a4, a1, t0
.LBB0_8:
	add	a0, a2, a5
	vl1r.v	v8, (a0)
	add	a0, t2, a5
	vl1r.v	v9, (a0)
	add	a0, a1, a5
	vs1r.v	v8, (a0)
	add	a0, a4, a5
	add	a5, a5, t1
	vs1r.v	v9, (a0)
	bne	a5, a3, .LBB0_8
	bnez	a6, .LBB0_4
	j	.LBB0_6
.Lfunc_end0:
	.size	my_memcpy, .Lfunc_end0-my_memcpy

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git c7fd7512a5c5b133665bfecbe2e9748c0607286e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
