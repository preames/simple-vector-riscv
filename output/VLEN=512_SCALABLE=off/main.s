	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"main.c"
	.globl	vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:
	li	a3, 1
	beq	a1, a3, .LBB0_14
	addiw	a4, a1, -2
	li	a5, 7
	addi	a3, a1, -1
	bltu	a4, a5, .LBB0_12
	zext.w	a5, a4
	addi	a7, a5, 1
	li	a5, 1
	slli	a5, a5, 33
	li	t0, 15
	addi	a6, a5, -16
	bgeu	a4, t0, .LBB0_4
	li	t0, 0
	j	.LBB0_9
.LBB0_4:
	and	t0, a7, a6
	sh2add	a4, a1, a0
	addi	a4, a4, -64
	vsetivli	zero, 16, e32, m1, ta, mu
	vid.v	v8
	vrsub.vi	v8, v8, 15
	mv	a5, t0
.LBB0_5:
	vle32.v	v9, (a4)
	vrgather.vv	v10, v9, v8
	vadd.vx	v9, v10, a2
	vrgather.vv	v10, v9, v8
	vse32.v	v10, (a4)
	addi	a5, a5, -16
	addi	a4, a4, -64
	bnez	a5, .LBB0_5
	beq	a7, t0, .LBB0_14
	andi	a4, a7, 8
	bnez	a4, .LBB0_9
	sub	a3, a3, t0
	j	.LBB0_12
.LBB0_9:
	addi	a4, a6, 8
	and	a6, a7, a4
	sub	a3, a3, a6
	sub	a4, t0, a6
	slli	a1, a1, 2
	slli	a5, t0, 2
	sub	a1, a1, a5
	add	a1, a1, a0
	addi	a1, a1, -32
	vsetivli	zero, 8, e32, mf2, ta, mu
	vid.v	v8
	vrsub.vi	v8, v8, 7
.LBB0_10:
	vle32.v	v9, (a1)
	vrgather.vv	v10, v9, v8
	vadd.vx	v9, v10, a2
	vrgather.vv	v10, v9, v8
	vse32.v	v10, (a1)
	addi	a4, a4, 8
	addi	a1, a1, -32
	bnez	a4, .LBB0_10
	beq	a7, a6, .LBB0_14
.LBB0_12:
	sh2add	a0, a3, a0
	addiw	a1, a3, -1
.LBB0_13:
	lw	a3, 0(a0)
	mv	a4, a1
	addw	a1, a3, a2
	sw	a1, 0(a0)
	addi	a0, a0, -4
	addiw	a1, a4, -1
	bnez	a4, .LBB0_13
.LBB0_14:
	ret
.Lfunc_end0:
	.size	vector_add_i32, .Lfunc_end0-vector_add_i32

	.globl	vector_reduce_add_i32
	.p2align	1
	.type	vector_reduce_add_i32,@function
vector_reduce_add_i32:
	blez	a1, .LBB1_3
	li	a2, 8
	bgeu	a1, a2, .LBB1_4
	li	a3, 0
	li	a2, 0
	j	.LBB1_13
.LBB1_3:
	li	a0, 0
	ret
.LBB1_4:
	li	a2, 32
	bgeu	a1, a2, .LBB1_6
	li	a2, 0
	li	a3, 0
	j	.LBB1_10
.LBB1_6:
	vsetivli	zero, 16, e32, m1, ta, mu
	vmv.v.i	v8, 0
	andi	a3, a1, -32
	mv	a2, a3
	mv	a4, a0
	vmv.v.i	v9, 0
.LBB1_7:
	addi	a5, a4, 64
	vle32.v	v10, (a4)
	vle32.v	v11, (a5)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	addi	a2, a2, -32
	addi	a4, a4, 128
	bnez	a2, .LBB1_7
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a2, v8
	beq	a3, a1, .LBB1_15
	andi	a4, a1, 24
	beqz	a4, .LBB1_13
.LBB1_10:
	mv	a4, a3
	andi	a3, a1, -8
	vsetivli	zero, 8, e32, mf2, ta, mu
	vmv.v.i	v8, 0
	vsetvli	zero, zero, e32, mf2, tu, mu
	vmv.s.x	v8, a2
	sh2add	a2, a4, a0
	sub	a4, a4, a3
.LBB1_11:
	vsetvli	zero, zero, e32, mf2, ta, mu
	vle32.v	v9, (a2)
	vadd.vv	v8, v9, v8
	addi	a4, a4, 8
	addi	a2, a2, 32
	bnez	a4, .LBB1_11
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a2, v8
	beq	a3, a1, .LBB1_15
.LBB1_13:
	sh2add	a0, a3, a0
	sub	a1, a1, a3
.LBB1_14:
	lw	a3, 0(a0)
	addw	a2, a2, a3
	addi	a1, a1, -1
	addi	a0, a0, 4
	bnez	a1, .LBB1_14
.LBB1_15:
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
	lui	a0, 2
	addiw	a0, a0, -2000
	sub	sp, sp, a0
	addi	s0, sp, 8
	addi	a0, sp, 8
	lui	a2, 2
	lui	s1, 2
	li	a1, 0
	call	memset@plt
	addiw	a0, s1, -64
	vsetivli	zero, 16, e32, m1, ta, mu
.LBB2_1:
	add	a1, s0, a0
	vle32.v	v8, (a1)
	vadd.vi	v8, v8, 1
	addi	a0, a0, -64
	vse32.v	v8, (a1)
	bnez	a0, .LBB2_1
	addi	a1, sp, 40
	vsetivli	zero, 8, e32, mf2, ta, mu
	vle32.v	v8, (a1)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (a1)
	lw	a0, 36(sp)
	addiw	a0, a0, 1
	sw	a0, 36(sp)
	lw	a0, 32(sp)
	addiw	a0, a0, 1
	sw	a0, 32(sp)
	lw	a0, 28(sp)
	addiw	a0, a0, 1
	sw	a0, 28(sp)
	lw	a0, 24(sp)
	addiw	a0, a0, 1
	sw	a0, 24(sp)
	lw	a0, 20(sp)
	addiw	a0, a0, 1
	sw	a0, 20(sp)
	lw	a0, 16(sp)
	addiw	a0, a0, 1
	sw	a0, 16(sp)
	lw	a2, 12(sp)
	li	a0, 0
	addiw	a2, a2, 1
	sw	a2, 12(sp)
	vsetivli	zero, 16, e32, m1, ta, mu
	vmv.v.i	v8, 0
	addi	a2, sp, 8
	lui	a3, 2
	vmv.v.i	v9, 0
.LBB2_3:
	add	a4, a2, a0
	vle32.v	v10, (a4)
	addi	a4, a4, 64
	vle32.v	v11, (a4)
	vadd.vv	v8, v10, v8
	addi	a0, a0, 128
	vadd.vv	v9, v11, v9
	bne	a0, a3, .LBB2_3
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a2, v8
	lui	a0, 1
	addiw	a3, a0, -2048
	li	a0, -1
	bne	a2, a3, .LBB2_10
	lui	a0, 2
	addiw	a0, a0, -64
	addi	a2, sp, 8
.LBB2_6:
	add	a3, a2, a0
	vle32.v	v8, (a3)
	vadd.vi	v8, v8, -1
	addi	a0, a0, -64
	vse32.v	v8, (a3)
	bnez	a0, .LBB2_6
	vsetivli	zero, 8, e32, mf2, ta, mu
	vle32.v	v8, (a1)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (a1)
	lw	a0, 36(sp)
	addiw	a0, a0, -1
	sw	a0, 36(sp)
	lw	a0, 32(sp)
	addiw	a0, a0, -1
	sw	a0, 32(sp)
	lw	a0, 28(sp)
	addiw	a0, a0, -1
	sw	a0, 28(sp)
	lw	a0, 24(sp)
	addiw	a0, a0, -1
	sw	a0, 24(sp)
	lw	a0, 20(sp)
	addiw	a0, a0, -1
	sw	a0, 20(sp)
	lw	a0, 16(sp)
	addiw	a0, a0, -1
	sw	a0, 16(sp)
	lw	a0, 12(sp)
	addiw	a0, a0, -1
	sw	a0, 12(sp)
	vsetivli	zero, 16, e32, m1, ta, mu
	vmv.v.i	v8, 0
	addi	a0, sp, 8
	lui	a1, 1
	addiw	a1, a1, -2048
	vmv.v.i	v9, 0
.LBB2_8:
	addi	a2, a0, 64
	vle32.v	v10, (a0)
	vle32.v	v11, (a2)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	addi	a1, a1, -32
	addi	a0, a0, 128
	bnez	a1, .LBB2_8
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a0, v8
.LBB2_10:
	lui	a1, 2
	addiw	a1, a1, -2000
	add	sp, sp, a1
	ld	ra, 2024(sp)
	ld	s0, 2016(sp)
	ld	s1, 2008(sp)
	addi	sp, sp, 2032
	ret
.Lfunc_end2:
	.size	main, .Lfunc_end2-main

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9452450ee564583afc43611f300d26d8c3edd95b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
