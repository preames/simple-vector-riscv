	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_reduce_max_i32.c"
	.globl	vector_reduce_max_i32
	.p2align	1
	.type	vector_reduce_max_i32,@function
vector_reduce_max_i32:
	lui	a3, 807449
	beqz	a1, .LBB0_3
	zext.w	t0, a1
	csrr	t1, vlenb
	srli	a5, t1, 1
	bgeu	t0, a5, .LBB0_4
	li	a7, 0
	addiw	a1, a3, 1871
	j	.LBB0_7
.LBB0_3:
	addiw	a0, a3, 1871
	ret
.LBB0_4:
	addi	a1, a5, -1
	and	a6, t0, a1
	sub	a7, t0, a6
	lui	a1, 807449
	addiw	a1, a1, 1871
	vsetvli	a3, zero, e32, m1, ta, ma
	vmv.v.x	v8, a1
	slli	a2, t1, 1
	mv	a3, a7
	mv	a4, a0
	vmv.v.v	v9, v8
.LBB0_5:
	vl1re32.v	v10, (a4)
	add	a1, a4, t1
	vl1re32.v	v11, (a1)
	vmax.vv	v8, v10, v8
	vmax.vv	v9, v11, v9
	sub	a3, a3, a5
	add	a4, a4, a2
	bnez	a3, .LBB0_5
	vmax.vv	v8, v8, v9
	lui	a1, 524288
	vmv.s.x	v9, a1
	vredmax.vs	v8, v8, v9
	vmv.x.s	a1, v8
	beqz	a6, .LBB0_9
.LBB0_7:
	sh2add	a0, a7, a0
	sub	a2, t0, a7
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

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 49caf7012170422afa84868598063818f9344228)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
