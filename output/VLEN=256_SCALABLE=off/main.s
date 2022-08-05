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
	addiw	a4, a1, -2
	li	a5, 7
	addi	a3, a1, -1
	bltu	a4, a5, .LBB0_5
	zext.w	a4, a4
	addi	a6, a4, 1
	andi	a4, a6, -8
	sub	a3, a3, a4
	sh2add	a1, a1, a0
	addi	a1, a1, -32
	vsetivli	zero, 8, e32, m1, ta, mu
	vid.v	v8
	vrsub.vi	v8, v8, 7
	mv	a5, a4
.LBB0_3:
	vle32.v	v9, (a1)
	vrgather.vv	v10, v9, v8
	vadd.vx	v9, v10, a2
	vrgather.vv	v10, v9, v8
	vse32.v	v10, (a1)
	addi	a5, a5, -8
	addi	a1, a1, -32
	bnez	a5, .LBB0_3
	beq	a6, a4, .LBB0_7
.LBB0_5:
	sh2add	a0, a3, a0
	addiw	a1, a3, -1
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
	li	a2, 16
	bgeu	a1, a2, .LBB1_4
	li	a3, 0
	li	a2, 0
	j	.LBB1_7
.LBB1_3:
	li	a0, 0
	ret
.LBB1_4:
	vsetivli	zero, 8, e32, m1, ta, mu
	vmv.v.i	v8, 0
	andi	a3, a1, -16
	mv	a2, a3
	mv	a4, a0
	vmv.v.i	v9, 0
.LBB1_5:
	addi	a5, a4, 32
	vle32.v	v10, (a4)
	vle32.v	v11, (a5)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	addi	a2, a2, -16
	addi	a4, a4, 64
	bnez	a2, .LBB1_5
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a2, v8
	beq	a3, a1, .LBB1_9
.LBB1_7:
	sh2add	a0, a3, a0
	sub	a1, a1, a3
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
	lui	a0, 2
	addiw	a0, a0, -2000
	sub	sp, sp, a0
	addi	s0, sp, 8
	addi	a0, sp, 8
	lui	a2, 2
	lui	s1, 2
	li	a1, 0
	call	memset@plt
	addiw	a0, s1, -32
	vsetivli	zero, 8, e32, m1, ta, mu
.LBB2_1:
	add	a1, s0, a0
	vle32.v	v8, (a1)
	vadd.vi	v8, v8, 1
	addi	a0, a0, -32
	vse32.v	v8, (a1)
	bnez	a0, .LBB2_1
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
	lw	a1, 12(sp)
	li	a0, 0
	addiw	a1, a1, 1
	sw	a1, 12(sp)
	vmv.v.i	v8, 0
	addi	a1, sp, 8
	lui	a2, 2
	vmv1r.v	v9, v8
.LBB2_3:
	add	a3, a1, a0
	vle32.v	v10, (a3)
	addi	a3, a3, 32
	vle32.v	v11, (a3)
	vadd.vv	v8, v10, v8
	addi	a0, a0, 64
	vadd.vv	v9, v11, v9
	bne	a0, a2, .LBB2_3
	vadd.vv	v8, v9, v8
	vmv.s.x	v9, zero
	vredsum.vs	v8, v8, v9
	vmv.x.s	a1, v8
	lui	a0, 1
	addiw	a2, a0, -2048
	li	a0, -1
	bne	a1, a2, .LBB2_10
	lui	a0, 2
	addiw	a0, a0, -32
	addi	a1, sp, 8
.LBB2_6:
	add	a2, a1, a0
	vle32.v	v8, (a2)
	vadd.vi	v8, v8, -1
	addi	a0, a0, -32
	vse32.v	v8, (a2)
	bnez	a0, .LBB2_6
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
	vmv.v.i	v8, 0
	addi	a0, sp, 8
	lui	a1, 1
	addiw	a1, a1, -2048
	vmv1r.v	v9, v8
.LBB2_8:
	addi	a2, a0, 32
	vle32.v	v10, (a0)
	vle32.v	v11, (a2)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	addi	a1, a1, -16
	addi	a0, a0, 64
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
