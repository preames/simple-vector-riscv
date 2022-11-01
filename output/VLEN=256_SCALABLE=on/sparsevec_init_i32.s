	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0"
	.file	"sparsevec_init_i32.c"
	.globl	sparsevec_init_i32
	.p2align	1
	.type	sparsevec_init_i32,@function
sparsevec_init_i32:
	beqz	a0, .LBB0_8
	zext.w	a7, a0
	csrr	t0, vlenb
	srli	t1, t0, 1
	bgeu	a7, t1, .LBB0_3
	li	a4, 0
	j	.LBB0_6
.LBB0_3:
	addi	a0, t1, -1
	and	a6, a7, a0
	sub	a4, a7, a6
	vsetvli	a0, zero, e32, m1, ta, ma
	vid.v	v8
	srli	t2, t0, 2
	mv	a0, a4
	mv	a5, a2
.LBB0_4:
	vle16.v	v9, (a5)
	add	a3, a5, t1
	vle16.v	v10, (a3)
	vadd.vx	v11, v8, t2
	vsetvli	zero, zero, e64, m2, ta, ma
	vsext.vf4	v12, v9
	vsext.vf4	v14, v10
	vsll.vi	v12, v12, 2
	vsll.vi	v14, v14, 2
	vsetvli	zero, zero, e32, m1, ta, ma
	vsoxei64.v	v8, (a1), v12
	vsoxei64.v	v11, (a1), v14
	vadd.vx	v8, v11, t2
	sub	a0, a0, t1
	add	a5, a5, t0
	bnez	a0, .LBB0_4
	beqz	a6, .LBB0_8
.LBB0_6:
	sh1add	a0, a4, a2
	sub	a2, a7, a4
.LBB0_7:
	lh	a3, 0(a0)
	sh2add	a3, a3, a1
	sw	a4, 0(a3)
	addiw	a4, a4, 1
	addi	a2, a2, -1
	addi	a0, a0, 2
	bnez	a2, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	sparsevec_init_i32, .Lfunc_end0-sparsevec_init_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9472a810ed33bc9e655484f43047eed07d50bc16)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
