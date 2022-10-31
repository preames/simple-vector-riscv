	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
	.file	"aos_write_i64.c"
	.globl	aos_init_i64
	.p2align	1
	.type	aos_init_i64,@function
aos_init_i64:
	beqz	a0, .LBB0_8
	li	a3, 16
	zext.w	a6, a0
	bgeu	a0, a3, .LBB0_3
	li	a0, 0
	j	.LBB0_6
.LBB0_3:
	andi	a0, a6, -16
	addi	a3, a1, 496
	vsetivli	zero, 8, e64, m1, ta, ma
	vmv.v.i	v8, 0
	li	a4, 56
	mv	a5, a0
.LBB0_4:
	addi	a2, a3, -448
	vsse64.v	v8, (a2), a4
	vsse64.v	v8, (a3), a4
	addi	a5, a5, -16
	addi	a3, a3, 896
	bnez	a5, .LBB0_4
	beq	a0, a6, .LBB0_8
.LBB0_6:
	li	a2, 56
	mul	a2, a0, a2
	add	a1, a1, a2
	addi	a1, a1, 48
	sub	a0, a6, a0
.LBB0_7:
	sd	zero, 0(a1)
	addi	a0, a0, -1
	addi	a1, a1, 56
	bnez	a0, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	aos_init_i64, .Lfunc_end0-aos_init_i64

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git a819f6c8d1f4909a1ac3a2eff390236e4e31dba3)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
