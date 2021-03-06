	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"pairwise_dotproduct_fp32.c"
	.globl	pairwise_dotproduct_fp32
	.p2align	1
	.type	pairwise_dotproduct_fp32,@function
pairwise_dotproduct_fp32:
	andi	a0, a0, -2
	beqz	a0, .LBB0_9
	zext.w	t0, a0
	addi	a0, t0, -1
	li	a4, 22
	bgeu	a0, a4, .LBB0_3
	li	a4, 0
	j	.LBB0_7
.LBB0_3:
	srli	a6, a0, 1
	sh2add	a0, a6, a1
	addi	a0, a0, 4
	slli	a4, a6, 3
	addi	a4, a4, 8
	add	a5, a2, a4
	add	a7, a3, a4
	sltu	a5, a1, a5
	sltu	a4, a2, a0
	and	a4, a4, a5
	sltu	a5, a1, a7
	sltu	a0, a3, a0
	and	a0, a0, a5
	or	a0, a0, a4
	li	a4, 0
	bnez	a0, .LBB0_7
	li	t2, 0
	addi	a6, a6, 1
	andi	a7, a6, -4
	slli	a4, a7, 1
	li	t1, 8
	vsetivli	zero, 4, e32, m1, ta, mu
	mv	t3, a3
	mv	a5, a2
.LBB0_5:
	vlse32.v	v8, (a5), t1
	addi	a0, a5, 4
	vlse32.v	v9, (a0), t1
	addi	a0, t3, 4
	vlse32.v	v10, (a0), t1
	vlse32.v	v11, (t3), t1
	andi	a0, t2, -4
	vfmul.vv	v9, v9, v10
	vfmacc.vv	v9, v8, v11
	sh2add	a0, a0, a1
	vse32.v	v9, (a0)
	addi	t2, t2, 4
	addi	a5, a5, 32
	addi	t3, t3, 32
	bne	a7, t2, .LBB0_5
	beq	a6, a7, .LBB0_9
.LBB0_7:
	slli	a0, a4, 2
	addi	a0, a0, 4
	add	a2, a2, a0
	add	a3, a3, a0
	srli	a0, a4, 1
	sh2add	a1, a0, a1
.LBB0_8:
	flw	ft0, -4(a2)
	flw	ft1, 0(a2)
	flw	ft2, 0(a3)
	flw	ft3, -4(a3)
	fmul.s	ft1, ft1, ft2
	fmadd.s	ft0, ft0, ft3, ft1
	fsw	ft0, 0(a1)
	addi	a4, a4, 2
	addi	a2, a2, 8
	addi	a3, a3, 8
	addi	a1, a1, 4
	bltu	a4, t0, .LBB0_8
.LBB0_9:
	ret
.Lfunc_end0:
	.size	pairwise_dotproduct_fp32, .Lfunc_end0-pairwise_dotproduct_fp32

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 1e451369d2017830d3dbddec24063170b7aca0de)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
