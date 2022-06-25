	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"riscv_vspec_example_a5.c"
	.globl	saxpy
	.p2align	1
	.type	saxpy,@function
saxpy:
	blez	a0, .LBB0_9
	csrr	a7, vlenb
	srli	t0, a7, 1
	fmv.w.x	ft0, a1
	bgeu	a0, t0, .LBB0_3
	li	t3, 0
	j	.LBB0_7
.LBB0_3:
	sh2add	a1, a0, a3
	sh2add	a4, a0, a2
	sltu	a4, a3, a4
	sltu	a1, a2, a1
	and	a4, a4, a1
	li	t3, 0
	bnez	a4, .LBB0_7
	li	a5, 0
	remu	a6, a0, t0
	sub	t3, a0, a6
	vsetvli	a1, zero, e32, m1, ta, mu
	vfmv.v.f	v8, ft0
	slli	t1, a7, 1
	add	t2, a2, a7
	add	a7, a7, a3
.LBB0_5:
	add	a1, a2, a5
	vl1re32.v	v9, (a1)
	add	a1, t2, a5
	vl1re32.v	v10, (a1)
	add	t4, a3, a5
	vl1re32.v	v11, (t4)
	add	a1, a7, a5
	vl1re32.v	v12, (a1)
	vfmacc.vv	v11, v8, v9
	vfmacc.vv	v12, v8, v10
	vs1r.v	v11, (t4)
	vs1r.v	v12, (a1)
	add	a4, a4, t0
	add	a5, a5, t1
	bne	a4, t3, .LBB0_5
	beqz	a6, .LBB0_9
.LBB0_7:
	sub	a0, a0, t3
	sh2add	a3, t3, a3
	sh2add	a1, t3, a2
.LBB0_8:
	flw	ft1, 0(a1)
	flw	ft2, 0(a3)
	fmadd.s	ft1, ft0, ft1, ft2
	fsw	ft1, 0(a3)
	addi	a0, a0, -1
	addi	a3, a3, 4
	addi	a1, a1, 4
	bnez	a0, .LBB0_8
.LBB0_9:
	ret
.Lfunc_end0:
	.size	saxpy, .Lfunc_end0-saxpy

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 9803b0d1e7b3cbcce33c1c91d4e1cd1f20eea3d4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig