	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_splat_i32.c"
	.globl	vector_splat_i32
	.p2align	1
	.type	vector_splat_i32,@function
vector_splat_i32:
	beqz	a2, .LBB0_14
	li	a4, 16
	zext.w	a7, a2
	bgeu	a2, a4, .LBB0_3
	li	a2, 0
	j	.LBB0_12
.LBB0_3:
	li	a4, -64
	li	a5, 64
	zext.w	a6, a4
	bgeu	a2, a5, .LBB0_5
	li	a2, 0
	j	.LBB0_9
.LBB0_5:
	and	a2, a7, a6
	li	a4, 32
	vsetvli	zero, a4, e32, m1, ta, mu
	vmv.v.x	v8, a1
	mv	a5, a2
	mv	a4, a0
.LBB0_6:
	addi	a3, a4, 128
	vse32.v	v8, (a4)
	vse32.v	v8, (a3)
	addi	a5, a5, -64
	addi	a4, a4, 256
	bnez	a5, .LBB0_6
	beq	a2, a7, .LBB0_14
	andi	a3, a7, 48
	beqz	a3, .LBB0_12
.LBB0_9:
	mv	a3, a2
	addi	a2, a6, 48
	and	a2, a7, a2
	vsetivli	zero, 16, e32, mf2, ta, mu
	vmv.v.x	v8, a1
	sh2add	a4, a3, a0
	sub	a5, a3, a2
.LBB0_10:
	vse32.v	v8, (a4)
	addi	a5, a5, 16
	addi	a4, a4, 64
	bnez	a5, .LBB0_10
	beq	a2, a7, .LBB0_14
.LBB0_12:
	sh2add	a0, a2, a0
	sub	a2, a7, a2
.LBB0_13:
	sw	a1, 0(a0)
	addi	a2, a2, -1
	addi	a0, a0, 4
	bnez	a2, .LBB0_13
.LBB0_14:
	ret
.Lfunc_end0:
	.size	vector_splat_i32, .Lfunc_end0-vector_splat_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 0cf0a120fd4242dfc047116ea6a506874c1ea3d0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
