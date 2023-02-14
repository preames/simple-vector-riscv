	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
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
	addi	a3, t1, -1
	and	a6, a7, a3
	sub	t0, a7, a6
	slli	a0, a0, 1
	vsetvli	a3, zero, e32, m2, ta, ma
	vmv.v.i	v8, 0
	mv	a4, t0
	mv	a5, a2
	mv	a3, a1
.LBB0_4:
	vl2re32.v	v10, (a3)
	vl2re32.v	v12, (a5)
	vmacc.vv	v8, v12, v10
	add	a3, a3, a0
	sub	a4, a4, t1
	add	a5, a5, a0
	bnez	a4, .LBB0_4
	vmv.s.x	v10, zero
	vredsum.vs	v8, v8, v10
	vmv.x.s	a0, v8
	beqz	a6, .LBB0_8
.LBB0_6:
	sh2add	a1, t0, a1
	sh2add	a2, t0, a2
	sub	a3, a7, t0
.LBB0_7:
	lw	a4, 0(a1)
	lw	a5, 0(a2)
	mul	a4, a5, a4
	addw	a0, a0, a4
	addi	a1, a1, 4
	addi	a3, a3, -1
	addi	a2, a2, 4
	bnez	a3, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	dotproduct_i32, .Lfunc_end0-dotproduct_i32

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
