	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_add_i32.c"
	.globl	vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:
	beqz	a1, .LBB0_8
	slli	a3, a1, 32
	li	a4, 8
	srli	a6, a3, 32
	bgeu	a1, a4, .LBB0_3
	li	a1, 0
	j	.LBB0_6
.LBB0_3:
	andi	a1, a6, -8
	addi	a4, a0, 16
	mv	a5, a1
.LBB0_4:
	addi	a3, a4, -16
	vsetivli	zero, 4, e32, m1, ta, mu
	vle32.v	v8, (a3)
	vle32.v	v9, (a4)
	vadd.vx	v8, v8, a2
	vadd.vx	v9, v9, a2
	vse32.v	v8, (a3)
	vse32.v	v9, (a4)
	addi	a5, a5, -8
	addi	a4, a4, 32
	bnez	a5, .LBB0_4
	beq	a1, a6, .LBB0_8
.LBB0_6:
	slli	a3, a1, 2
	add	a0, a0, a3
	sub	a1, a6, a1
.LBB0_7:
	lw	a3, 0(a0)
	addw	a3, a3, a2
	sw	a3, 0(a0)
	addi	a1, a1, -1
	addi	a0, a0, 4
	bnez	a1, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_add_i32, .Lfunc_end0-vector_add_i32

	.ident	"clang version 15.0.0 (git@github.com:llvm/llvm-project.git 3ea191ed03d40489357c5069aedd3383abb3ad58)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
