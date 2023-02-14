	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"sparsevec_reduce_add_i32.c"
	.globl	sparsevec_reduce_add_i32
	.p2align	1
	.type	sparsevec_reduce_add_i32,@function
sparsevec_reduce_add_i32:
	beqz	a0, .LBB0_8
	zext.w	t0, a0
	csrr	a3, vlenb
	srli	a0, a3, 1
	bgeu	t0, a0, .LBB0_3
	li	a7, 0
	li	a0, 0
	j	.LBB0_6
.LBB0_3:
	addi	a4, a0, -1
	and	a6, t0, a4
	sub	a7, t0, a6
	vsetvli	a4, zero, e32, m2, ta, ma
	vmv.v.i	v8, 0
	mv	a4, a7
	mv	a5, a2
.LBB0_4:
	vl1re16.v	v10, (a5)
	vsetvli	zero, zero, e64, m4, ta, ma
	vsext.vf4	v12, v10
	vsll.vi	v12, v12, 2
	vsetvli	zero, zero, e32, m2, ta, ma
	vluxei64.v	v10, (a1), v12
	vadd.vv	v8, v10, v8
	sub	a4, a4, a0
	add	a5, a5, a3
	bnez	a4, .LBB0_4
	vmv.s.x	v10, zero
	vredsum.vs	v8, v8, v10
	vmv.x.s	a0, v8
	beqz	a6, .LBB0_8
.LBB0_6:
	sh1add	a2, a7, a2
	sub	a3, t0, a7
.LBB0_7:
	lh	a4, 0(a2)
	sh2add	a4, a4, a1
	lw	a4, 0(a4)
	addw	a0, a0, a4
	addi	a3, a3, -1
	addi	a2, a2, 2
	bnez	a3, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	sparsevec_reduce_add_i32, .Lfunc_end0-sparsevec_reduce_add_i32

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
