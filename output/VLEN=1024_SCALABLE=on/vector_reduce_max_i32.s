	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_reduce_max_i32.c"
	.globl	vector_reduce_max_i32
	.p2align	1
	.type	vector_reduce_max_i32,@function
vector_reduce_max_i32:
	lui	a3, 807449
	beqz	a1, .LBB0_3
	zext.w	a2, a1
	csrr	a4, vlenb
	srli	a1, a4, 1
	bgeu	a2, a1, .LBB0_4
	li	a7, 0
	addiw	a1, a3, 1871
	j	.LBB0_7
.LBB0_3:
	addiw	a0, a3, 1871
	ret
.LBB0_4:
	addi	a3, a1, -1
	and	a6, a2, a3
	sub	a7, a2, a6
	slli	a4, a4, 1
	lui	a3, 807449
	addiw	a3, a3, 1871
	vsetvli	a5, zero, e32, m2, ta, ma
	vmv.v.x	v8, a3
	mv	a3, a7
	mv	a5, a0
.LBB0_5:
	vl2re32.v	v10, (a5)
	vmax.vv	v8, v10, v8
	sub	a3, a3, a1
	add	a5, a5, a4
	bnez	a3, .LBB0_5
	lui	a1, 524288
	vmv.s.x	v10, a1
	vredmax.vs	v8, v8, v10
	vmv.x.s	a1, v8
	beqz	a6, .LBB0_9
.LBB0_7:
	sh2add	a0, a7, a0
	sub	a2, a2, a7
.LBB0_8:
	lw	a3, 0(a0)
	sext.w	a1, a1
	max	a1, a3, a1
	addi	a2, a2, -1
	addi	a0, a0, 4
	bnez	a2, .LBB0_8
.LBB0_9:
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	vector_reduce_max_i32, .Lfunc_end0-vector_reduce_max_i32

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
