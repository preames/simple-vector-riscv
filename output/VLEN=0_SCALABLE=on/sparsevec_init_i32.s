	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"sparsevec_init_i32.c"
	.globl	sparsevec_init_i32
	.p2align	1
	.type	sparsevec_init_i32,@function
sparsevec_init_i32:
	beqz	a0, .LBB0_8
	zext.w	t2, a0
	csrr	a7, vlenb
	srli	t0, a7, 1
	bgeu	t2, t0, .LBB0_3
	li	a3, 0
	j	.LBB0_6
.LBB0_3:
	addi	a0, t0, -1
	and	a6, t2, a0
	sub	a3, t2, a6
	vsetvli	a0, zero, e32, m1, ta, ma
	vid.v	v8
	srli	t3, a7, 2
	slli	t1, t3, 1
	mv	a5, a3
	mv	a0, a2
.LBB0_4:
	vle16.v	v9, (a0)
	add	a4, a0, t1
	vle16.v	v10, (a4)
	vadd.vx	v11, v8, t3
	vsetvli	zero, zero, e64, m2, ta, ma
	vsext.vf4	v12, v9
	vsext.vf4	v14, v10
	vsll.vi	v12, v12, 2
	vsll.vi	v14, v14, 2
	vsetvli	zero, zero, e32, m1, ta, ma
	vsoxei64.v	v8, (a1), v12
	vsoxei64.v	v11, (a1), v14
	vadd.vx	v8, v11, t3
	sub	a5, a5, t0
	add	a0, a0, a7
	bnez	a5, .LBB0_4
	beqz	a6, .LBB0_8
.LBB0_6:
	sh1add	a0, a3, a2
.LBB0_7:
	lh	a2, 0(a0)
	sh2add	a2, a2, a1
	sw	a3, 0(a2)
	addi	a3, a3, 1
	addi	a0, a0, 2
	bne	t2, a3, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	sparsevec_init_i32, .Lfunc_end0-sparsevec_init_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
