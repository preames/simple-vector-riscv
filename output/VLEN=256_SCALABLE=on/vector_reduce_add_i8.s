	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_reduce_add_i8.c"
	.globl	vector_reduce_add_i32
	.p2align	1
	.type	vector_reduce_add_i32,@function
vector_reduce_add_i32:
	beqz	a1, .LBB0_8
	zext.w	a2, a1
	csrr	a4, vlenb
	srli	a4, a4, 1
	bgeu	a2, a4, .LBB0_3
	li	a3, 0
	li	a1, 0
	j	.LBB0_6
.LBB0_3:
	addi	a1, a4, -1
	and	a6, a2, a1
	sub	a3, a2, a6
	vsetvli	a1, zero, e32, m2, ta, ma
	vmv.v.i	v8, 0
	mv	a5, a3
	mv	a1, a0
.LBB0_4:
	vle8.v	v10, (a1)
	vzext.vf4	v12, v10
	vadd.vv	v8, v8, v12
	sub	a5, a5, a4
	add	a1, a1, a4
	bnez	a5, .LBB0_4
	vmv.s.x	v10, zero
	vredsum.vs	v8, v8, v10
	vmv.x.s	a1, v8
	beqz	a6, .LBB0_8
.LBB0_6:
	add	a0, a0, a3
	sub	a2, a2, a3
.LBB0_7:
	lbu	a3, 0(a0)
	addw	a1, a1, a3
	addi	a2, a2, -1
	addi	a0, a0, 1
	bnez	a2, .LBB0_7
.LBB0_8:
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	vector_reduce_add_i32, .Lfunc_end0-vector_reduce_add_i32

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
