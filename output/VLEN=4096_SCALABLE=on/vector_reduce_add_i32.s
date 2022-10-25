	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl1024b1p0_zvl128b1p0_zvl2048b1p0_zvl256b1p0_zvl32b1p0_zvl4096b1p0_zvl512b1p0_zvl64b1p0"
	.file	"vector_reduce_add_i32.c"
	.globl	vector_reduce_add_i32
	.p2align	1
	.type	vector_reduce_add_i32,@function
vector_reduce_add_i32:
	beqz	a1, .LBB0_8
	zext.w	t0, a1
	csrr	t1, vlenb
	srli	a5, t1, 1
	bgeu	t0, a5, .LBB0_3
	li	a7, 0
	li	a1, 0
	j	.LBB0_6
.LBB0_3:
	addi	a2, a5, -1
	and	a6, t0, a2
	sub	a7, t0, a6
	vsetvli	a2, zero, e32, m1, ta, ma
	vmv.v.i	v8, 0
	slli	a4, t1, 1
	mv	a3, a7
	mv	a2, a0
	vmv.v.i	v9, 0
.LBB0_4:
	vl1re32.v	v10, (a2)
	add	a1, a2, t1
	vl1re32.v	v11, (a1)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	sub	a3, a3, a5
	add	a2, a2, a4
	bnez	a3, .LBB0_4
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a1, v8
	beqz	a6, .LBB0_8
.LBB0_6:
	sh2add	a0, a7, a0
	sub	a2, t0, a7
.LBB0_7:
	lw	a3, 0(a0)
	addw	a1, a1, a3
	addi	a2, a2, -1
	addi	a0, a0, 4
	bnez	a2, .LBB0_7
.LBB0_8:
	mv	a0, a1
	ret
.Lfunc_end0:
	.size	vector_reduce_add_i32, .Lfunc_end0-vector_reduce_add_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
