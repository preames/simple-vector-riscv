	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_addw_i32_i64.c"
	.globl	test
	.p2align	1
	.type	test,@function
test:
	blez	a3, .LBB0_8
	csrr	t2, vlenb
	srli	t1, t2, 2
	bgeu	a3, t1, .LBB0_3
	li	a6, 0
	j	.LBB0_6
.LBB0_3:
	addi	a4, t1, -1
	and	a7, a3, a4
	sub	a6, a3, a7
	slli	t0, t2, 1
	mv	t3, a6
	mv	a5, a0
	mv	t4, a2
	mv	t5, a1
.LBB0_4:
	vl1re32.v	v8, (t5)
	vl1re32.v	v9, (t4)
	vsetvli	a4, zero, e32, m1, ta, ma
	vl2re64.v	v10, (a5)
	vwadd.vv	v12, v9, v8
	vsetvli	zero, zero, e64, m2, ta, ma
	vadd.vv	v8, v12, v10
	vs2r.v	v8, (a5)
	add	t5, t5, t2
	add	t4, t4, t2
	sub	t3, t3, t1
	add	a5, a5, t0
	bnez	t3, .LBB0_4
	beqz	a7, .LBB0_8
.LBB0_6:
	sh3add	a0, a6, a0
	sh2add	a2, a6, a2
	sh2add	a1, a6, a1
	sub	a3, a3, a6
.LBB0_7:
	lw	a6, 0(a1)
	lw	a5, 0(a2)
	ld	a4, 0(a0)
	add	a5, a5, a6
	add	a4, a4, a5
	sd	a4, 0(a0)
	addi	a0, a0, 8
	addi	a2, a2, 4
	addi	a3, a3, -1
	addi	a1, a1, 4
	bnez	a3, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
