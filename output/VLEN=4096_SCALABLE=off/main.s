	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"main.c"
	.section	.rodata,"a",@progbits
	.p2align	9
.LCPI0_0:
	.word	127
	.word	126
	.word	125
	.word	124
	.word	123
	.word	122
	.word	121
	.word	120
	.word	119
	.word	118
	.word	117
	.word	116
	.word	115
	.word	114
	.word	113
	.word	112
	.word	111
	.word	110
	.word	109
	.word	108
	.word	107
	.word	106
	.word	105
	.word	104
	.word	103
	.word	102
	.word	101
	.word	100
	.word	99
	.word	98
	.word	97
	.word	96
	.word	95
	.word	94
	.word	93
	.word	92
	.word	91
	.word	90
	.word	89
	.word	88
	.word	87
	.word	86
	.word	85
	.word	84
	.word	83
	.word	82
	.word	81
	.word	80
	.word	79
	.word	78
	.word	77
	.word	76
	.word	75
	.word	74
	.word	73
	.word	72
	.word	71
	.word	70
	.word	69
	.word	68
	.word	67
	.word	66
	.word	65
	.word	64
	.word	63
	.word	62
	.word	61
	.word	60
	.word	59
	.word	58
	.word	57
	.word	56
	.word	55
	.word	54
	.word	53
	.word	52
	.word	51
	.word	50
	.word	49
	.word	48
	.word	47
	.word	46
	.word	45
	.word	44
	.word	43
	.word	42
	.word	41
	.word	40
	.word	39
	.word	38
	.word	37
	.word	36
	.word	35
	.word	34
	.word	33
	.word	32
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
.LCPI0_1:
	.word	63
	.word	62
	.word	61
	.word	60
	.word	59
	.word	58
	.word	57
	.word	56
	.word	55
	.word	54
	.word	53
	.word	52
	.word	51
	.word	50
	.word	49
	.word	48
	.word	47
	.word	46
	.word	45
	.word	44
	.word	43
	.word	42
	.word	41
	.word	40
	.word	39
	.word	38
	.word	37
	.word	36
	.word	35
	.word	34
	.word	33
	.word	32
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
	li	a4, 63
	addi	t0, a1, -1
	bltu	a3, a4, .LBB0_12
	zext.w	a4, a3
	addi	a7, a4, 1
	li	a4, 1
	slli	a4, a4, 33
	li	a5, 127
	addi	a6, a4, -128
	bgeu	a3, a5, .LBB0_4
	li	a3, 0
	j	.LBB0_9
.LBB0_4:
	li	a3, 128
	lui	a4, %hi(.LCPI0_0)
	addi	a4, a4, %lo(.LCPI0_0)
	vsetvli	zero, a3, e32, m1, ta, mu
	vle32.v	v8, (a4)
	and	a3, a7, a6
	sh2add	a4, a1, a0
	addi	a4, a4, -512
	mv	a5, a3
.LBB0_5:
	vle32.v	v9, (a4)
	vrgather.vv	v10, v9, v8
	vadd.vx	v9, v10, a2
	vrgather.vv	v10, v9, v8
	vse32.v	v10, (a4)
	addi	a5, a5, -128
	addi	a4, a4, -512
	bnez	a5, .LBB0_5
	beq	a7, a3, .LBB0_14
	andi	a4, a7, 64
	bnez	a4, .LBB0_9
	sub	t0, t0, a3
	j	.LBB0_12
.LBB0_9:
	addi	a4, a6, 64
	and	a6, a7, a4
	sub	t0, t0, a6
	sub	a4, a3, a6
	slli	a1, a1, 2
	slli	a3, a3, 2
	li	a5, 64
	vsetvli	zero, a5, e32, mf2, ta, mu
	lui	a5, %hi(.LCPI0_1)
	addi	a5, a5, %lo(.LCPI0_1)
	vle32.v	v8, (a5)
	sub	a1, a1, a3
	add	a1, a1, a0
	addi	a1, a1, -256
.LBB0_10:
	vle32.v	v9, (a1)
	vrgather.vv	v10, v9, v8
	vadd.vx	v9, v10, a2
	vrgather.vv	v10, v9, v8
	vse32.v	v10, (a1)
	addi	a4, a4, 64
	addi	a1, a1, -256
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
	li	a2, 64
	bgeu	a1, a2, .LBB1_4
	li	a3, 0
	li	a2, 0
	j	.LBB1_13
.LBB1_3:
	li	a0, 0
	ret
.LBB1_4:
	li	a2, 256
	bgeu	a1, a2, .LBB1_6
	li	a2, 0
	li	a3, 0
	j	.LBB1_10
.LBB1_6:
	andi	a3, a1, -256
	li	a2, 128
	vsetvli	zero, a2, e32, m1, ta, mu
	vmv.v.i	v8, 0
	mv	a2, a3
	mv	a4, a0
	vmv.v.i	v9, 0
.LBB1_7:
	addi	a5, a4, 512
	vle32.v	v10, (a4)
	vle32.v	v11, (a5)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	addi	a2, a2, -256
	addi	a4, a4, 1024
	bnez	a2, .LBB1_7
	li	a2, 128
	vsetvli	zero, a2, e32, m1, ta, mu
	vadd.vv	v8, v9, v8
	vsetivli	zero, 1, e32, m1, ta, mu
	vmv.s.x	v9, zero
	vsetvli	zero, a2, e32, m1, ta, mu
	vredsum.vs	v8, v8, v9
	vmv.x.s	a2, v8
	beq	a3, a1, .LBB1_15
	andi	a4, a1, 192
	beqz	a4, .LBB1_13
.LBB1_10:
	mv	a4, a3
	andi	a3, a1, -64
	li	a5, 64
	vsetvli	zero, a5, e32, mf2, ta, mu
	vmv.v.i	v8, 0
	vsetvli	zero, zero, e32, mf2, tu, mu
	vmv.s.x	v8, a2
	sh2add	a2, a4, a0
	sub	a4, a4, a3
.LBB1_11:
	vsetvli	zero, zero, e32, mf2, ta, mu
	vle32.v	v9, (a2)
	vadd.vv	v8, v9, v8
	addi	a4, a4, 64
	addi	a2, a2, 256
	bnez	a4, .LBB1_11
	vsetivli	zero, 1, e32, m1, ta, mu
	vmv.s.x	v9, zero
	li	a2, 64
	vsetvli	zero, a2, e32, mf2, ta, mu
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
	sd	s2, 2000(sp)
	sd	s3, 1992(sp)
	sd	s4, 1984(sp)
	sd	s5, 1976(sp)
	lui	a0, 2
	addiw	a0, a0, -1968
	sub	sp, sp, a0
	li	a0, 1664
	addi	s0, sp, 8
	sh2add	s2, a0, s0
	li	a0, 1152
	sh2add	s4, a0, s0
	addi	s1, s0, 2047
	addi	s5, s1, 513
	addi	s3, sp, 264
	addi	a0, sp, 8
	lui	a2, 2
	li	a1, 0
	call	memset@plt
	li	a0, 1920
	sh2add	a0, a0, s0
	li	a1, 128
	vsetvli	zero, a1, e32, m1, ta, mu
	vle32.v	v8, (a0)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (a0)
	li	a0, 1792
	sh2add	a0, a0, s0
	vle32.v	v8, (a0)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (a0)
	vle32.v	v8, (s2)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (s2)
	li	a0, 1536
	sh2add	a0, a0, s0
	vle32.v	v8, (a0)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (a0)
	li	a0, 1408
	sh2add	a0, a0, s0
	vle32.v	v8, (a0)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (a0)
	li	a0, 1280
	sh2add	a0, a0, s0
	vle32.v	v8, (a0)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (a0)
	vle32.v	v8, (s4)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (s4)
	li	a0, 1024
	sh2add	a0, a0, s0
	vle32.v	v8, (a0)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (a0)
	addi	a0, s1, 1537
	vle32.v	v8, (a0)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (a0)
	addi	a0, s1, 1025
	vle32.v	v8, (a0)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (a0)
	vle32.v	v8, (s5)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (s5)
	addi	a0, s1, 1
	vle32.v	v8, (a0)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (a0)
	addi	a0, sp, 1544
	vle32.v	v8, (a0)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (a0)
	addi	a0, sp, 1032
	vle32.v	v8, (a0)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (a0)
	addi	a0, sp, 520
	vle32.v	v8, (a0)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (a0)
	li	a0, 64
	vsetvli	zero, a0, e32, mf2, ta, mu
	vle32.v	v8, (s3)
	vadd.vi	v8, v8, 1
	vse32.v	v8, (s3)
	li	a1, 62
	addi	a0, sp, 260
.LBB2_1:
	lw	a2, 0(a0)
	mv	a3, a1
	addiw	a1, a2, 1
	sw	a1, 0(a0)
	addiw	a1, a3, -1
	addi	a0, a0, -4
	bnez	a3, .LBB2_1
	li	a0, 128
	addi	a1, sp, 8
	vsetvli	zero, a0, e32, m1, ta, mu
	vle32.v	v8, (a1)
	addi	a6, s3, 256
	vle32.v	v9, (a6)
	addi	a7, s3, 768
	vle32.v	v10, (a7)
	addi	t0, s3, 1280
	vle32.v	v11, (t0)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	addi	t1, s3, 1792
	vle32.v	v10, (t1)
	vle32.v	v11, (s5)
	addi	t2, s5, 512
	vle32.v	v12, (t2)
	addi	t3, s5, 1024
	vle32.v	v13, (t3)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	vadd.vv	v8, v12, v8
	vadd.vv	v9, v13, v9
	addi	t4, s5, 1536
	vle32.v	v10, (t4)
	vle32.v	v11, (s4)
	addi	t5, s4, 512
	vle32.v	v12, (t5)
	addi	a4, s4, 1024
	vle32.v	v13, (a4)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	vadd.vv	v8, v12, v8
	vadd.vv	v9, v13, v9
	addi	a5, s4, 1536
	vle32.v	v10, (a5)
	vle32.v	v11, (s2)
	addi	a1, s2, 512
	vle32.v	v12, (a1)
	addi	a2, s2, 1024
	vle32.v	v13, (a2)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	vadd.vv	v8, v12, v8
	vadd.vv	v9, v13, v9
	vadd.vv	v8, v9, v8
	vsetivli	zero, 1, e32, m1, ta, mu
	vmv.s.x	v9, zero
	vsetvli	zero, a0, e32, m1, ta, mu
	vredsum.vs	v8, v8, v9
	vmv.x.s	s1, v8
	lui	a0, 1
	addiw	s0, a0, -2048
	li	a0, -1
	bne	s1, s0, .LBB2_6
	vle32.v	v8, (a2)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (a2)
	vle32.v	v8, (a1)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (a1)
	vle32.v	v8, (s2)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (s2)
	vle32.v	v8, (a5)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (a5)
	vle32.v	v8, (a4)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (a4)
	vle32.v	v8, (t5)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (t5)
	vle32.v	v8, (s4)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (s4)
	vle32.v	v8, (t4)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (t4)
	vle32.v	v8, (t3)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (t3)
	vle32.v	v8, (t2)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (t2)
	vle32.v	v8, (s5)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (s5)
	vle32.v	v8, (t1)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (t1)
	vle32.v	v8, (t0)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (t0)
	vle32.v	v8, (a7)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (a7)
	vle32.v	v8, (a6)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (a6)
	li	a0, 64
	vsetvli	zero, a0, e32, mf2, ta, mu
	vle32.v	v8, (s3)
	vadd.vi	v8, v8, -1
	vse32.v	v8, (s3)
	li	s1, 62
	addi	a0, sp, 260
.LBB2_4:
	lw	s0, 0(a0)
	mv	a3, s1
	addiw	s1, s0, -1
	sw	s1, 0(a0)
	addiw	s1, a3, -1
	addi	a0, a0, -4
	bnez	a3, .LBB2_4
	li	a0, 128
	addi	a3, sp, 8
	vsetvli	zero, a0, e32, m1, ta, mu
	vle32.v	v8, (a3)
	vle32.v	v9, (a6)
	vle32.v	v10, (a7)
	vle32.v	v11, (t0)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	vle32.v	v10, (t1)
	vle32.v	v11, (s5)
	vle32.v	v12, (t2)
	vle32.v	v13, (t3)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	vadd.vv	v8, v12, v8
	vadd.vv	v9, v13, v9
	vle32.v	v10, (t4)
	vle32.v	v11, (s4)
	vle32.v	v12, (t5)
	vle32.v	v13, (a4)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	vadd.vv	v8, v12, v8
	vadd.vv	v9, v13, v9
	vle32.v	v10, (a5)
	vle32.v	v11, (s2)
	vle32.v	v12, (a1)
	vle32.v	v13, (a2)
	vadd.vv	v8, v10, v8
	vadd.vv	v9, v11, v9
	vadd.vv	v8, v12, v8
	vadd.vv	v9, v13, v9
	vadd.vv	v8, v9, v8
	vsetivli	zero, 1, e32, m1, ta, mu
	vmv.s.x	v9, zero
	vsetvli	zero, a0, e32, m1, ta, mu
	vredsum.vs	v8, v8, v9
	vmv.x.s	a0, v8
.LBB2_6:
	lui	a1, 2
	addiw	a1, a1, -1968
	add	sp, sp, a1
	ld	ra, 2024(sp)
	ld	s0, 2016(sp)
	ld	s1, 2008(sp)
	ld	s2, 2000(sp)
	ld	s3, 1992(sp)
	ld	s4, 1984(sp)
	ld	s5, 1976(sp)
	addi	sp, sp, 2032
	ret
.Lfunc_end2:
	.size	main, .Lfunc_end2-main

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9452450ee564583afc43611f300d26d8c3edd95b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
