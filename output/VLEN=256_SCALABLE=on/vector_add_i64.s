	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_add_i64.c"
	.globl	vector_add_i64
	.p2align	1
	.type	vector_add_i64,@function
vector_add_i64:
	beqz	a1, .LBB0_8
	zext.w	a7, a1
	csrr	t0, vlenb
	srli	a5, t0, 3
	bgeu	a7, a5, .LBB0_3
	li	a4, 0
	j	.LBB0_6
.LBB0_3:
	li	a1, 0
	remu	a6, a7, a5
	sub	a4, a7, a6
	vsetvli	a3, zero, e64, m1, ta, mu
	mv	a3, a0
.LBB0_4:
	vl1re64.v	v8, (a3)
	vadd.vx	v8, v8, a2
	vs1r.v	v8, (a3)
	add	a1, a1, a5
	add	a3, a3, t0
	bne	a1, a4, .LBB0_4
	beqz	a6, .LBB0_8
.LBB0_6:
	sh3add	a0, a4, a0
	sub	a1, a7, a4
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

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 875ee0ed1c5af58cb4909f239093e25a35d7a21a)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
