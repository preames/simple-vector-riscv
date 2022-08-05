	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"main.c"
	.globl	vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:
	li	a3, 1
	beq	a1, a3, .LBB0_7
	addiw	a3, a1, -2
	zext.w	a3, a3
	addi	a3, a3, 1
	csrr	a4, vlenb
	srli	t0, a4, 2
	addi	a7, a1, -1
	bltu	a3, t0, .LBB0_5
	addi	a5, t0, -1
	and	a6, a3, a5
	sub	a5, a3, a6
	sub	a7, a7, a5
	neg	a3, t0
	slli	t1, a3, 2
	sh2add	a1, a1, a0
	neg	a4, a4
	vsetvli	a3, zero, e32, m1, ta, mu
.LBB0_3:
	add	a3, a1, t1
	vl1re32.v	v8, (a3)
	vadd.vx	v8, v8, a2
	vs1r.v	v8, (a3)
	sub	a5, a5, t0
	add	a1, a1, a4
	bnez	a5, .LBB0_3
	beqz	a6, .LBB0_7
.LBB0_5:
	sh2add	a0, a7, a0
	addiw	a1, a7, -1
.LBB0_6:
	lw	a3, 0(a0)
	mv	a4, a1
	addw	a1, a3, a2
	sw	a1, 0(a0)
	addi	a0, a0, -4
	addiw	a1, a4, -1
	bnez	a4, .LBB0_6
.LBB0_7:
	ret
.Lfunc_end0:
	.size	vector_add_i32, .Lfunc_end0-vector_add_i32

	.globl	vector_reduce_add_i32
	.p2align	1
	.type	vector_reduce_add_i32,@function
vector_reduce_add_i32:
	blez	a1, .LBB1_3
	csrr	t0, vlenb
	srli	t1, t0, 1
	bgeu	a1, t1, .LBB1_4
	li	a7, 0
	li	a2, 0
	j	.LBB1_7
.LBB1_3:
	li	a0, 0
	ret
.LBB1_4:
	addi	a2, t1, -1
	and	a6, a1, a2
	sub	a7, a1, a6
	vsetvli	a2, zero, e32, m1, ta, mu
	vmv.v.i	v8, 0
	slli	a4, t0, 1
	mv	a3, a7
	mv	a2, a0
	vmv.v.i	v9, 0
.LBB1_5:
	vl1re32.v	v10, (a2)
	add	a5, a2, t0
	vl1re32.v	v11, (a5)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	sub	a3, a3, t1
	add	a2, a2, a4
	bnez	a3, .LBB1_5
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a2, v8
	beqz	a6, .LBB1_9
.LBB1_7:
	sh2add	a0, a7, a0
	sub	a1, a1, a7
.LBB1_8:
	lw	a3, 0(a0)
	addw	a2, a2, a3
	addi	a1, a1, -1
	addi	a0, a0, 4
	bnez	a1, .LBB1_8
.LBB1_9:
	mv	a0, a2
	ret
.Lfunc_end1:
	.size	vector_reduce_add_i32, .Lfunc_end1-vector_reduce_add_i32

	.globl	main
	.p2align	1
	.type	main,@function
main:
	addi	sp, sp, -2032
	sd	ra, 2024(sp)
	sd	s0, 2016(sp)
	sd	s1, 2008(sp)
	sd	s2, 2000(sp)
	lui	a0, 2
	addiw	a0, a0, -1984
	sub	sp, sp, a0
	addi	a0, sp, 16
	lui	a2, 2
	addi	s2, sp, 16
	li	a1, 0
	call	memset@plt
	csrr	a1, vlenb
	srli	a0, a1, 13
	slli	a2, a0, 10
	li	a0, 2047
	bnez	a2, .LBB2_4
	srli	a2, a1, 2
	addiw	a0, a2, -1
	andi	a0, a0, 2047
	xori	a3, a0, 2047
	neg	a4, a2
	slli	a4, a4, 2
	li	a5, 1024
	sh3add	a5, a5, s2
	neg	s0, a1
	vsetvli	s1, zero, e32, m1, ta, mu
.LBB2_2:
	add	s1, a5, a4
	vl1re32.v	v8, (s1)
	vadd.vi	v8, v8, 1
	vs1r.v	v8, (s1)
	sub	a3, a3, a2
	add	a5, a5, s0
	bnez	a3, .LBB2_2
	beqz	a0, .LBB2_6
.LBB2_4:
	addiw	a2, a0, -1
	sh2add	a0, a0, s2
.LBB2_5:
	lw	a3, 0(a0)
	mv	a4, a2
	addiw	a2, a3, 1
	sw	a2, 0(a0)
	addiw	a2, a4, -1
	addi	a0, a0, -4
	bnez	a4, .LBB2_5
.LBB2_6:
	srli	a2, a1, 1
	lui	a0, 1
	addiw	a0, a0, -2048
	bgeu	a0, a2, .LBB2_8
	li	s0, 0
	li	a4, 0
	j	.LBB2_11
.LBB2_8:
	addi	a3, a2, -1
	and	a3, a3, a0
	sub	s0, a0, a3
	slli	a4, a1, 1
	vsetvli	a0, zero, e32, m1, ta, mu
	vmv.v.i	v8, 0
	addi	a5, sp, 16
	mv	a0, s0
	vmv.v.i	v9, 0
.LBB2_9:
	vl1re32.v	v10, (a5)
	add	s1, a5, a1
	vl1re32.v	v11, (s1)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	sub	a0, a0, a2
	add	a5, a5, a4
	bnez	a0, .LBB2_9
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a4, v8
	beqz	a3, .LBB2_13
.LBB2_11:
	addi	a0, s0, -2048
	addi	a3, sp, 16
	sh2add	a3, s0, a3
.LBB2_12:
	lw	a5, 0(a3)
	addw	a4, a4, a5
	addi	a0, a0, 1
	addi	a3, a3, 4
	bnez	a0, .LBB2_12
.LBB2_13:
	lui	a0, 1
	addiw	a3, a0, -2048
	li	a0, -1
	bne	a4, a3, .LBB2_27
	li	a0, -2047
	srli	a0, a0, 1
	srli	a3, a1, 3
	and	a3, a3, a0
	li	a6, 2047
	bnez	a3, .LBB2_18
	srli	a3, a1, 2
	addiw	a0, a3, -1
	andi	a6, a0, 2047
	xori	a4, a6, 2047
	neg	a5, a3
	slli	a5, a5, 2
	li	s1, 1024
	addi	s0, sp, 16
	sh3add	s0, s1, s0
	neg	s1, a1
	vsetvli	a0, zero, e32, m1, ta, mu
.LBB2_16:
	add	a0, s0, a5
	vl1re32.v	v8, (a0)
	vadd.vi	v8, v8, -1
	vs1r.v	v8, (a0)
	sub	a4, a4, a3
	add	s0, s0, s1
	bnez	a4, .LBB2_16
	beqz	a6, .LBB2_20
.LBB2_18:
	addiw	a3, a6, -1
	addi	a0, sp, 16
	sh2add	a0, a6, a0
.LBB2_19:
	lw	a4, 0(a0)
	mv	a5, a3
	addiw	a3, a4, -1
	sw	a3, 0(a0)
	addiw	a3, a5, -1
	addi	a0, a0, -4
	bnez	a5, .LBB2_19
.LBB2_20:
	lui	a0, 1
	addiw	a0, a0, -2048
	bgeu	a0, a2, .LBB2_22
	li	s0, 0
	li	a0, 0
	j	.LBB2_25
.LBB2_22:
	addi	a3, a2, -1
	and	a4, a3, a0
	sub	s0, a0, a4
	slli	a0, a1, 1
	vsetvli	a3, zero, e32, m1, ta, mu
	vmv.v.i	v8, 0
	addi	a5, sp, 16
	mv	a3, s0
	vmv.v.i	v9, 0
.LBB2_23:
	vl1re32.v	v10, (a5)
	add	s1, a5, a1
	vl1re32.v	v11, (s1)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	sub	a3, a3, a2
	add	a5, a5, a0
	bnez	a3, .LBB2_23
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a0, v8
	beqz	a4, .LBB2_27
.LBB2_25:
	addi	a1, s0, -2048
	addi	a2, sp, 16
	sh2add	a2, s0, a2
.LBB2_26:
	lw	a3, 0(a2)
	addw	a0, a0, a3
	addi	a1, a1, 1
	addi	a2, a2, 4
	bnez	a1, .LBB2_26
.LBB2_27:
	lui	a1, 2
	addiw	a1, a1, -1984
	add	sp, sp, a1
	ld	ra, 2024(sp)
	ld	s0, 2016(sp)
	ld	s1, 2008(sp)
	ld	s2, 2000(sp)
	addi	sp, sp, 2032
	ret
.Lfunc_end2:
	.size	main, .Lfunc_end2-main

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9452450ee564583afc43611f300d26d8c3edd95b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
