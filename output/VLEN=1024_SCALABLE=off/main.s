	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"main.c"
	.section	.rodata,"a",@progbits
	.p2align	7
.LCPI0_0:
	.word	31
	.word	30
	.word	29
	.word	28
	.word	27
	.word	26
	.word	25
	.word	24
	.word	23
	.word	22
	.word	21
	.word	20
	.word	19
	.word	18
	.word	17
	.word	16
	.word	15
	.word	14
	.word	13
	.word	12
	.word	11
	.word	10
	.word	9
	.word	8
	.word	7
	.word	6
	.word	5
	.word	4
	.word	3
	.word	2
	.word	1
	.word	0
	.text
	.globl	vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:
	li	a3, 1
	beq	a1, a3, .LBB0_14
	addiw	a3, a1, -2
	li	a4, 15
	addi	t0, a1, -1
	bltu	a3, a4, .LBB0_12
	zext.w	a4, a3
	addi	a7, a4, 1
	li	a4, 1
	slli	a4, a4, 33
	li	a5, 31
	addi	a6, a4, -32
	bgeu	a3, a5, .LBB0_4
	li	a3, 0
	j	.LBB0_9
.LBB0_4:
	li	a3, 32
	lui	a4, %hi(.LCPI0_0)
	addi	a4, a4, %lo(.LCPI0_0)
	vsetvli	zero, a3, e32, m1, ta, mu
	vle32.v	v8, (a4)
	and	a3, a7, a6
	sh2add	a4, a1, a0
	addi	a4, a4, -128
	mv	a5, a3
.LBB0_5:
	vle32.v	v9, (a4)
	vrgather.vv	v10, v9, v8
	vadd.vx	v9, v10, a2
	vrgather.vv	v10, v9, v8
	vse32.v	v10, (a4)
	addi	a5, a5, -32
	addi	a4, a4, -128
	bnez	a5, .LBB0_5
	beq	a7, a3, .LBB0_14
	andi	a4, a7, 16
	bnez	a4, .LBB0_9
	sub	t0, t0, a3
	j	.LBB0_12
.LBB0_9:
	addi	a4, a6, 16
	and	a6, a7, a4
	sub	t0, t0, a6
	sub	a4, a3, a6
	slli	a1, a1, 2
	slli	a3, a3, 2
	sub	a1, a1, a3
	add	a1, a1, a0
	addi	a1, a1, -64
	vsetivli	zero, 16, e32, mf2, ta, mu
	vid.v	v8
	vrsub.vi	v8, v8, 15
.LBB0_10:
	vle32.v	v9, (a1)
	vrgather.vv	v10, v9, v8
	vadd.vx	v9, v10, a2
	vrgather.vv	v10, v9, v8
	vse32.v	v10, (a1)
	addi	a4, a4, 16
	addi	a1, a1, -64
	bnez	a4, .LBB0_10
	beq	a7, a6, .LBB0_14
.LBB0_12:
	sh2add	a0, t0, a0
	addiw	a1, t0, -1
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
	li	a2, 16
	bgeu	a1, a2, .LBB1_4
	li	a3, 0
	li	a2, 0
	j	.LBB1_13
.LBB1_3:
	li	a0, 0
	ret
.LBB1_4:
	li	a2, 64
	bgeu	a1, a2, .LBB1_6
	li	a2, 0
	li	a3, 0
	j	.LBB1_10
.LBB1_6:
	andi	a3, a1, -64
	li	a2, 32
	vsetvli	zero, a2, e32, m1, ta, mu
	vmv.v.i	v8, 0
	mv	a2, a3
	mv	a4, a0
	vmv.v.i	v9, 0
.LBB1_7:
	addi	a5, a4, 128
	vle32.v	v10, (a4)
	vle32.v	v11, (a5)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	addi	a2, a2, -64
	addi	a4, a4, 256
	bnez	a2, .LBB1_7
	li	a2, 32
	vsetvli	zero, a2, e32, m1, ta, mu
	vadd.vv	v8, v9, v8
	vsetivli	zero, 1, e32, m1, ta, mu
	vmv.s.x	v9, zero
	vsetvli	zero, a2, e32, m1, ta, mu
	vredsum.vs	v8, v8, v9
	vmv.x.s	a2, v8
	beq	a3, a1, .LBB1_15
	andi	a4, a1, 48
	beqz	a4, .LBB1_13
.LBB1_10:
	mv	a4, a3
	andi	a3, a1, -16
	vsetivli	zero, 16, e32, mf2, ta, mu
	vmv.v.i	v8, 0
	vsetvli	zero, zero, e32, mf2, tu, mu
	vmv.s.x	v8, a2
	sh2add	a2, a4, a0
	sub	a4, a4, a3
.LBB1_11:
	vsetvli	zero, zero, e32, mf2, ta, mu
	vle32.v	v9, (a2)
	vadd.vv	v8, v9, v8
	addi	a4, a4, 16
	addi	a2, a2, 64
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
	addiw	a0, s1, -128
	li	a1, 32
.LBB2_1:
	add	a2, s0, a0
	vsetvli	zero, a1, e32, m1, ta, mu
	vle32.v	v8, (a2)
	vadd.vi	v8, v8, 1
	addi	a0, a0, -128
	vse32.v	v8, (a2)
	bnez	a0, .LBB2_1
	addi	a1, sp, 72
	vsetivli	zero, 16, e32, mf2, ta, mu
	vle32.v	v8, (a1)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (a1)
	lw	a0, 68(sp)
	addiw	a0, a0, 1
	sw	a0, 68(sp)
	lw	a0, 64(sp)
	addiw	a0, a0, 1
	sw	a0, 64(sp)
	lw	a0, 60(sp)
	addiw	a0, a0, 1
	sw	a0, 60(sp)
	lw	a0, 56(sp)
	addiw	a0, a0, 1
	sw	a0, 56(sp)
	lw	a0, 52(sp)
	addiw	a0, a0, 1
	sw	a0, 52(sp)
	lw	a0, 48(sp)
	addiw	a0, a0, 1
	sw	a0, 48(sp)
	lw	a0, 44(sp)
	addiw	a0, a0, 1
	sw	a0, 44(sp)
	lw	a0, 40(sp)
	addiw	a0, a0, 1
	sw	a0, 40(sp)
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
	li	a2, 32
	vsetvli	zero, a2, e32, m1, ta, mu
	vmv.v.i	v8, 0
	addi	a2, sp, 8
	lui	a3, 2
	vmv.v.i	v9, 0
.LBB2_3:
	add	a4, a2, a0
	vle32.v	v10, (a4)
	addi	a4, a4, 128
	vle32.v	v11, (a4)
	vadd.vv	v8, v10, v8
	addi	a0, a0, 256
	vadd.vv	v9, v11, v9
	bne	a0, a3, .LBB2_3
	li	a0, 32
	vsetvli	zero, a0, e32, m1, ta, mu
	vadd.vv	v8, v9, v8
	vsetivli	zero, 1, e32, m1, ta, mu
	vmv.s.x	v9, zero
	vsetvli	zero, a0, e32, m1, ta, mu
	vredsum.vs	v8, v8, v9
	vmv.x.s	a2, v8
	lui	a0, 1
	addiw	a3, a0, -2048
	li	a0, -1
	bne	a2, a3, .LBB2_10
	lui	a0, 2
	addiw	a0, a0, -128
	addi	a2, sp, 8
.LBB2_6:
	add	a3, a2, a0
	vle32.v	v8, (a3)
	vadd.vi	v8, v8, -1
	addi	a0, a0, -128
	vse32.v	v8, (a3)
	bnez	a0, .LBB2_6
	vsetivli	zero, 16, e32, mf2, ta, mu
	vle32.v	v8, (a1)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (a1)
	lw	a0, 68(sp)
	addiw	a0, a0, -1
	sw	a0, 68(sp)
	lw	a0, 64(sp)
	addiw	a0, a0, -1
	sw	a0, 64(sp)
	lw	a0, 60(sp)
	addiw	a0, a0, -1
	sw	a0, 60(sp)
	lw	a0, 56(sp)
	addiw	a0, a0, -1
	sw	a0, 56(sp)
	lw	a0, 52(sp)
	addiw	a0, a0, -1
	sw	a0, 52(sp)
	lw	a0, 48(sp)
	addiw	a0, a0, -1
	sw	a0, 48(sp)
	lw	a0, 44(sp)
	addiw	a0, a0, -1
	sw	a0, 44(sp)
	lw	a0, 40(sp)
	addiw	a0, a0, -1
	sw	a0, 40(sp)
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
	li	a0, 32
	vsetvli	zero, a0, e32, m1, ta, mu
	vmv.v.i	v8, 0
	addi	a0, sp, 8
	lui	a1, 1
	addiw	a1, a1, -2048
	vmv.v.i	v9, 0
.LBB2_8:
	addi	a2, a0, 128
	vle32.v	v10, (a0)
	vle32.v	v11, (a2)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	addi	a1, a1, -64
	addi	a0, a0, 256
	bnez	a1, .LBB2_8
	li	a0, 32
	vsetvli	zero, a0, e32, m1, ta, mu
	vadd.vv	v8, v9, v8
	vsetivli	zero, 1, e32, m1, ta, mu
	vmv.s.x	v9, zero
	vsetvli	zero, a0, e32, m1, ta, mu
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
