	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_add_i64.c"
	.globl	vector_add_i64
	.p2align	1
	.type	vector_add_i64,@function
vector_add_i64:
	beqz	a1, .LBB0_8
	slli	a3, a1, 32
	li	a4, 4
	srli	a6, a3, 32
	bgeu	a1, a4, .LBB0_3
	li	a1, 0
	j	.LBB0_6
.LBB0_3:
	andi	a1, a6, -4
	addi	a4, a0, 16
	mv	a5, a1
.LBB0_4:
	addi	a3, a4, -16
	vsetivli	zero, 2, e64, m1, ta, mu
	vle64.v	v8, (a3)
	vle64.v	v9, (a4)
	vadd.vx	v8, v8, a2
	vadd.vx	v9, v9, a2
	vse64.v	v8, (a3)
	vse64.v	v9, (a4)
	addi	a5, a5, -4
	addi	a4, a4, 32
	bnez	a5, .LBB0_4
	beq	a1, a6, .LBB0_8
.LBB0_6:
	slli	a3, a1, 3
	add	a0, a0, a3
	sub	a1, a6, a1
.LBB0_7:
	ld	a3, 0(a0)
	add	a3, a3, a2
	sd	a3, 0(a0)
	addi	a1, a1, -1
	addi	a0, a0, 8
	bnez	a1, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_add_i64, .Lfunc_end0-vector_add_i64

	.ident	"clang version 15.0.0 (git@github.com:llvm/llvm-project.git 3ea191ed03d40489357c5069aedd3383abb3ad58)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
