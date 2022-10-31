	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl1024b1p0_zvl128b1p0_zvl2048b1p0_zvl256b1p0_zvl32b1p0_zvl4096b1p0_zvl512b1p0_zvl64b1p0"
	.file	"vector_add_i64.c"
	.globl	vector_add_i64
	.p2align	1
	.type	vector_add_i64,@function
vector_add_i64:
	beqz	a1, .LBB0_8
	li	a3, 128
	zext.w	a6, a1
	bgeu	a1, a3, .LBB0_3
	li	a7, 0
	j	.LBB0_6
.LBB0_3:
	andi	a7, a6, -128
	li	a4, 64
	mv	a5, a7
	mv	a3, a0
.LBB0_4:
	addi	a1, a3, 512
	vsetvli	zero, a4, e64, m1, ta, ma
	vle64.v	v8, (a3)
	vle64.v	v9, (a1)
	vadd.vx	v8, v8, a2
	vadd.vx	v9, v9, a2
	vse64.v	v8, (a3)
	vse64.v	v9, (a1)
	addi	a5, a5, -128
	addi	a3, a3, 1024
	bnez	a5, .LBB0_4
	beq	a7, a6, .LBB0_8
.LBB0_6:
	sh3add	a0, a7, a0
	sub	a1, a6, a7
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

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git a819f6c8d1f4909a1ac3a2eff390236e4e31dba3)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
