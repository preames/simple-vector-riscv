	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"memcpy_i8.c"
	.globl	my_memcpy
	.p2align	1
	.type	my_memcpy,@function
my_memcpy:
	beqz	a0, .LBB0_6
	zext.w	a7, a0
	csrr	a0, vlenb
	slli	a0, a0, 1
	li	a3, 32
	maxu	a3, a0, a3
	bltu	a7, a3, .LBB0_3
	sub	a3, a1, a2
	bgeu	a3, a0, .LBB0_7
.LBB0_3:
	li	t0, 0
.LBB0_4:
	add	a2, a2, t0
	add	a1, a1, t0
	sub	a0, a7, t0
.LBB0_5:
	lbu	a3, 0(a2)
	sb	a3, 0(a1)
	addi	a2, a2, 1
	addi	a0, a0, -1
	addi	a1, a1, 1
	bnez	a0, .LBB0_5
.LBB0_6:
	ret
.LBB0_7:
	addi	a3, a0, -1
	and	a6, a7, a3
	sub	t0, a7, a6
	mv	a3, t0
	mv	a4, a1
	mv	a5, a2
.LBB0_8:
	vl2r.v	v8, (a5)
	vs2r.v	v8, (a4)
	add	a5, a5, a0
	sub	a3, a3, a0
	add	a4, a4, a0
	bnez	a3, .LBB0_8
	bnez	a6, .LBB0_4
	j	.LBB0_6
.Lfunc_end0:
	.size	my_memcpy, .Lfunc_end0-my_memcpy

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
