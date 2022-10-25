	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl1024b1p0_zvl128b1p0_zvl2048b1p0_zvl256b1p0_zvl32b1p0_zvl4096b1p0_zvl512b1p0_zvl64b1p0"
	.file	"pairwise_dotproduct_fp32.c"
	.globl	pairwise_dotproduct_fp32
	.p2align	1
	.type	pairwise_dotproduct_fp32,@function
pairwise_dotproduct_fp32:
	andi	a0, a0, -2
	beqz	a0, .LBB0_6
	zext.w	t3, a0
	addi	a4, t3, -1
	srli	a5, a4, 1
	addi	t1, a5, 1
	csrr	a6, vlenb
	srli	t0, a6, 2
	li	a4, 128
	maxu	a4, t0, a4
	bltu	t1, a4, .LBB0_3
	sh2add	a4, a5, a1
	addi	a4, a4, 4
	slli	a5, a5, 3
	addi	a5, a5, 8
	add	a7, a2, a5
	add	t2, a3, a5
	sltu	a7, a1, a7
	sltu	a5, a2, a4
	and	a7, a7, a5
	sltu	a5, a1, t2
	sltu	a4, a3, a4
	and	a4, a4, a5
	or	a4, a7, a4
	beqz	a4, .LBB0_7
.LBB0_3:
	li	a4, 0
.LBB0_4:
	slli	a0, a4, 2
	addi	a0, a0, 4
	add	a2, a2, a0
	add	a3, a3, a0
	srli	a0, a4, 1
	sh2add	a1, a0, a1
.LBB0_5:
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
	bltu	a4, t3, .LBB0_5
.LBB0_6:
	ret
.LBB0_7:
	li	a5, 0
	addi	a4, t0, -1
	and	a7, t1, a4
	sub	t1, t1, a7
	slli	a4, t1, 1
	vsetvli	a0, zero, e64, m2, ta, ma
	vid.v	v8
	vadd.vv	v8, v8, v8
	srli	a6, a6, 1
.LBB0_8:
	vsll.vi	v10, v8, 2
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v12, (a2), v10
	vluxei64.v	v13, (a3), v10
	vsetvli	zero, zero, e64, m2, ta, ma
	vor.vi	v10, v10, 4
	vsetvli	zero, zero, e32, m1, ta, ma
	vluxei64.v	v14, (a2), v10
	vluxei64.v	v15, (a3), v10
	andi	a0, a5, -2
	vfmul.vv	v10, v14, v15
	vfmacc.vv	v10, v12, v13
	sh2add	a0, a0, a1
	vs1r.v	v10, (a0)
	add	a5, a5, t0
	vsetvli	zero, zero, e64, m2, ta, ma
	vadd.vx	v8, v8, a6
	bne	t1, a5, .LBB0_8
	bnez	a7, .LBB0_4
	j	.LBB0_6
.Lfunc_end0:
	.size	pairwise_dotproduct_fp32, .Lfunc_end0-pairwise_dotproduct_fp32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
