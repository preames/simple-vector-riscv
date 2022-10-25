	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"memcpy_i8.c"
	.globl	my_memcpy
	.p2align	1
	.type	my_memcpy,@function
my_memcpy:
	beqz	a0, .LBB0_6
	zext.w	a7, a0
	csrr	t0, vlenb
	slli	t1, t0, 1
	li	a0, 32
	maxu	a0, t1, a0
	bltu	a7, a0, .LBB0_3
	sub	a0, a1, a2
	bgeu	a0, t1, .LBB0_7
.LBB0_3:
	li	a4, 0
.LBB0_4:
	add	a2, a2, a4
	add	a1, a1, a4
	sub	a0, a7, a4
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
	li	a0, 0
	addi	a3, t1, -1
	and	a6, a7, a3
	sub	a4, a7, a6
	add	t2, a2, t0
	add	a3, a1, t0
.LBB0_8:
	add	a5, a2, a0
	vl1r.v	v8, (a5)
	add	a5, t2, a0
	vl1r.v	v9, (a5)
	add	a5, a1, a0
	vs1r.v	v8, (a5)
	add	a5, a3, a0
	add	a0, a0, t1
	vs1r.v	v9, (a5)
	bne	a4, a0, .LBB0_8
	bnez	a6, .LBB0_4
	j	.LBB0_6
.Lfunc_end0:
	.size	my_memcpy, .Lfunc_end0-my_memcpy

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
