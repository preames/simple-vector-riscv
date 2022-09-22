	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"sparsevec_init_i32.c"
	.globl	sparsevec_init_i32
	.p2align	1
	.type	sparsevec_init_i32,@function
sparsevec_init_i32:
	beqz	a0, .LBB0_8
	li	a6, 128
	zext.w	a3, a0
	bgeu	a0, a6, .LBB0_3
	li	a0, 0
	j	.LBB0_6
.LBB0_3:
	andi	a0, a3, -128
	vsetvli	zero, a6, e32, m1, ta, mu
	vid.v	v8
	mv	a5, a0
	mv	a4, a2
.LBB0_4:
	vle16.v	v9, (a4)
	vsetvli	zero, zero, e64, m2, ta, mu
	vsext.vf4	v10, v9
	vsll.vi	v10, v10, 2
	vsetvli	zero, zero, e32, m1, ta, mu
	vsoxei64.v	v8, (a1), v10
	vadd.vx	v8, v8, a6
	addi	a5, a5, -128
	addi	a4, a4, 256
	bnez	a5, .LBB0_4
	beq	a0, a3, .LBB0_8
.LBB0_6:
	sh1add	a2, a0, a2
.LBB0_7:
	lh	a4, 0(a2)
	sh2add	a4, a4, a1
	sw	a0, 0(a4)
	addi	a0, a0, 1
	addi	a2, a2, 2
	bne	a3, a0, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	sparsevec_init_i32, .Lfunc_end0-sparsevec_init_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 0cf0a120fd4242dfc047116ea6a506874c1ea3d0)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
