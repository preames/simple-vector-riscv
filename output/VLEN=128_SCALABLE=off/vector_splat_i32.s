	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_splat_i32.c"
	.globl	vector_splat_i32
	.p2align	1
	.type	vector_splat_i32,@function
vector_splat_i32:
	beqz	a2, .LBB0_8
	li	a4, 8
	zext.w	a6, a2
	bgeu	a2, a4, .LBB0_3
	li	a2, 0
	j	.LBB0_6
.LBB0_3:
	andi	a2, a6, -8
	vsetivli	zero, 4, e32, m1, ta, ma
	vmv.v.x	v8, a1
	mv	a4, a2
	mv	a5, a0
.LBB0_4:
	addi	a3, a5, 16
	vse32.v	v8, (a5)
	vse32.v	v8, (a3)
	addi	a4, a4, -8
	addi	a5, a5, 32
	bnez	a4, .LBB0_4
	beq	a2, a6, .LBB0_8
.LBB0_6:
	sh2add	a0, a2, a0
	sub	a2, a6, a2
.LBB0_7:
	sw	a1, 0(a0)
	addi	a2, a2, -1
	addi	a0, a0, 4
	bnez	a2, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_splat_i32, .Lfunc_end0-vector_splat_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git a819f6c8d1f4909a1ac3a2eff390236e4e31dba3)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
