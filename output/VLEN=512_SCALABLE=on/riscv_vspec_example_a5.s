	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"riscv_vspec_example_a5.c"
	.globl	saxpy
	.p2align	1
	.type	saxpy,@function
saxpy:
	blez	a0, .LBB0_6
	csrr	a7, vlenb
	srli	t1, a7, 1
	li	a4, 16
	maxu	a4, t1, a4
	fmv.w.x	ft0, a1
	bltu	a0, a4, .LBB0_3
	sh2add	a1, a0, a3
	sh2add	a4, a0, a2
	sltu	a4, a3, a4
	sltu	a1, a2, a1
	and	a1, a1, a4
	beqz	a1, .LBB0_7
.LBB0_3:
	li	t0, 0
.LBB0_4:
	sub	a0, a0, t0
	sh2add	a1, t0, a3
	sh2add	a2, t0, a2
.LBB0_5:
	flw	ft1, 0(a2)
	flw	ft2, 0(a1)
	fmadd.s	ft1, ft0, ft1, ft2
	fsw	ft1, 0(a1)
	addi	a0, a0, -1
	addi	a1, a1, 4
	addi	a2, a2, 4
	bnez	a0, .LBB0_5
.LBB0_6:
	ret
.LBB0_7:
	li	a5, 0
	addi	a1, t1, -1
	and	a6, a0, a1
	sub	t0, a0, a6
	vsetvli	a1, zero, e32, m1, ta, mu
	vfmv.v.f	v8, ft0
	slli	t2, a7, 1
	add	t3, a2, a7
	add	a7, a7, a3
	mv	a4, t0
.LBB0_8:
	add	a1, a2, a5
	vl1re32.v	v9, (a1)
	add	a1, t3, a5
	vl1re32.v	v10, (a1)
	add	t4, a3, a5
	vl1re32.v	v11, (t4)
	add	a1, a7, a5
	vl1re32.v	v12, (a1)
	vfmacc.vv	v11, v8, v9
	vfmacc.vv	v12, v8, v10
	vs1r.v	v11, (t4)
	vs1r.v	v12, (a1)
	sub	a4, a4, t1
	add	a5, a5, t2
	bnez	a4, .LBB0_8
	bnez	a6, .LBB0_4
	j	.LBB0_6
.Lfunc_end0:
	.size	saxpy, .Lfunc_end0-saxpy

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 0cf0a120fd4242dfc047116ea6a506874c1ea3d0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
