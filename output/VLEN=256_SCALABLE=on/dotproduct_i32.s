	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0"
	.file	"dotproduct_i32.c"
	.globl	dotproduct_i32
	.p2align	1
	.type	dotproduct_i32,@function
dotproduct_i32:
	beqz	a0, .LBB0_8
	zext.w	a7, a0
	csrr	a0, vlenb
	srli	t1, a0, 1
	bgeu	a7, t1, .LBB0_3
	li	t0, 0
	li	a0, 0
	j	.LBB0_6
.LBB0_3:
	li	a5, 0
	addi	a3, t1, -1
	and	a6, a7, a3
	sub	t0, a7, a6
	slli	t2, a0, 1
	add	t3, a1, a0
	vsetvli	a3, zero, e32, m1, ta, ma
	vmv.v.i	v8, 0
	add	a0, a0, a2
	mv	a3, t0
	vmv.v.i	v9, 0
.LBB0_4:
	add	a4, a1, a5
	vl1re32.v	v10, (a4)
	add	a4, t3, a5
	vl1re32.v	v11, (a4)
	add	a4, a2, a5
	vl1re32.v	v12, (a4)
	add	a4, a0, a5
	vl1re32.v	v13, (a4)
	vmacc.vv	v8, v12, v10
	vmacc.vv	v9, v13, v11
	sub	a3, a3, t1
	add	a5, a5, t2
	bnez	a3, .LBB0_4
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a0, v8
	beqz	a6, .LBB0_8
.LBB0_6:
	sh2add	a1, t0, a1
	sh2add	a2, t0, a2
	sub	a3, a7, t0
.LBB0_7:
	lw	a4, 0(a1)
	lw	a5, 0(a2)
	mulw	a4, a5, a4
	addw	a0, a0, a4
	addi	a1, a1, 4
	addi	a3, a3, -1
	addi	a2, a2, 4
	bnez	a3, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	dotproduct_i32, .Lfunc_end0-dotproduct_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
