	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl1024b1p0_zvl128b1p0_zvl2048b1p0_zvl256b1p0_zvl32b1p0_zvl4096b1p0_zvl512b1p0_zvl64b1p0"
	.file	"riscv_vspec_example_a5.c"
	.globl	saxpy
	.p2align	1
	.type	saxpy,@function
saxpy:
	blez	a0, .LBB0_6
	csrr	a7, vlenb
	srli	t1, a7, 1
	li	a3, 128
	maxu	a3, t1, a3
	bltu	a0, a3, .LBB0_3
	sh2add	a3, a0, a2
	sh2add	a4, a0, a1
	sltu	a4, a2, a4
	sltu	a3, a1, a3
	and	a3, a3, a4
	beqz	a3, .LBB0_7
.LBB0_3:
	li	t0, 0
.LBB0_4:
	sub	a0, a0, t0
	sh2add	a2, t0, a2
	sh2add	a1, t0, a1
.LBB0_5:
	flw	ft0, 0(a1)
	flw	ft1, 0(a2)
	fmadd.s	ft0, fa0, ft0, ft1
	fsw	ft0, 0(a2)
	addi	a0, a0, -1
	addi	a2, a2, 4
	addi	a1, a1, 4
	bnez	a0, .LBB0_5
.LBB0_6:
	ret
.LBB0_7:
	li	a4, 0
	addi	a3, t1, -1
	and	a6, a0, a3
	sub	t0, a0, a6
	vsetvli	a3, zero, e32, m1, ta, ma
	vfmv.v.f	v8, fa0
	slli	t2, a7, 1
	add	t3, a1, a7
	add	a7, a7, a2
	mv	a3, t0
.LBB0_8:
	add	a5, a1, a4
	vl1re32.v	v9, (a5)
	add	a5, t3, a4
	vl1re32.v	v10, (a5)
	add	t4, a2, a4
	vl1re32.v	v11, (t4)
	add	a5, a7, a4
	vl1re32.v	v12, (a5)
	vfmacc.vv	v11, v8, v9
	vfmacc.vv	v12, v8, v10
	vs1r.v	v11, (t4)
	vs1r.v	v12, (a5)
	sub	a3, a3, t1
	add	a4, a4, t2
	bnez	a3, .LBB0_8
	bnez	a6, .LBB0_4
	j	.LBB0_6
.Lfunc_end0:
	.size	saxpy, .Lfunc_end0-saxpy

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git b77533306876fc807e58e355d95d848a0077131f)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
