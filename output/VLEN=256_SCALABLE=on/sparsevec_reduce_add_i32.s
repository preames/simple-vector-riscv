	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"sparsevec_reduce_add_i32.c"
	.globl	sparsevec_reduce_add_i32
	.p2align	1
	.type	sparsevec_reduce_add_i32,@function
sparsevec_reduce_add_i32:
	beqz	a0, .LBB0_8
	li	a4, 16
	zext.w	a6, a0
	bgeu	a0, a4, .LBB0_3
	li	a4, 0
	li	a0, 0
	j	.LBB0_6
.LBB0_3:
	vsetivli	zero, 8, e32, m1, ta, mu
	vmv.v.i	v8, 0
	andi	a4, a6, -16
	mv	a0, a4
	mv	a5, a2
	vmv.v.i	v9, 0
.LBB0_4:
	addi	a3, a5, 16
	vle16.v	v10, (a5)
	vle16.v	v11, (a3)
	vsetvli	zero, zero, e64, m2, ta, mu
	vsext.vf4	v12, v10
	vsext.vf4	v14, v11
	vsll.vi	v10, v12, 2
	vsetvli	zero, zero, e32, m1, ta, mu
	vluxei64.v	v12, (a1), v10
	vsetvli	zero, zero, e64, m2, ta, mu
	vsll.vi	v10, v14, 2
	vsetvli	zero, zero, e32, m1, ta, mu
	vluxei64.v	v13, (a1), v10
	vadd.vv	v8, v12, v8
	vadd.vv	v9, v13, v9
	addi	a0, a0, -16
	addi	a5, a5, 32
	bnez	a0, .LBB0_4
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a0, v8
	beq	a4, a6, .LBB0_8
.LBB0_6:
	sh1add	a2, a4, a2
	sub	a3, a6, a4
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

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git dde2a7fb6da46da2b2f765fa569d8fddb4270eb6)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
