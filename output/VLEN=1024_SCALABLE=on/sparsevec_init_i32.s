	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"sparsevec_init_i32.c"
	.globl	sparsevec_init_i32
	.p2align	1
	.type	sparsevec_init_i32,@function
sparsevec_init_i32:
	beqz	a0, .LBB0_8
	zext.w	a7, a0
	csrr	a0, vlenb
	srli	a4, a0, 2
	bgeu	a7, a4, .LBB0_3
	li	a3, 0
	j	.LBB0_6
.LBB0_3:
	addi	a3, a4, -1
	and	a6, a7, a3
	sub	a3, a7, a6
	vsetvli	a5, zero, e32, m1, ta, mu
	vid.v	v8
	srli	t0, a0, 1
	mv	a0, a3
	mv	a5, a2
.LBB0_4:
	vle16.v	v9, (a5)
	vsetvli	zero, zero, e64, m2, ta, mu
	vsext.vf4	v10, v9
	vsll.vi	v10, v10, 2
	vsetvli	zero, zero, e32, m1, ta, mu
	vsoxei64.v	v8, (a1), v10
	vadd.vx	v8, v8, a4
	sub	a0, a0, a4
	add	a5, a5, t0
	bnez	a0, .LBB0_4
	beqz	a6, .LBB0_8
.LBB0_6:
	sh1add	a0, a3, a2
.LBB0_7:
	lh	a2, 0(a0)
	sh2add	a2, a2, a1
	sw	a3, 0(a2)
	addi	a3, a3, 1
	addi	a0, a0, 2
	bne	a7, a3, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	sparsevec_init_i32, .Lfunc_end0-sparsevec_init_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 86b67a310dedf4d0c6a5bc012d8bee7dbac1d2ad)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
