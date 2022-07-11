	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_init_i32.c"
	.globl	vector_init_i32
	.p2align	1
	.type	vector_init_i32,@function
vector_init_i32:
	beqz	a1, .LBB0_8
	zext.w	t1, a1
	csrr	t0, vlenb
	srli	a7, t0, 1
	bgeu	t1, a7, .LBB0_3
	li	a2, 0
	j	.LBB0_6
.LBB0_3:
	li	a5, 0
	remu	a6, t1, a7
	sub	a2, t1, a6
	vsetvli	a1, zero, e32, m1, ta, mu
	vid.v	v8
	srli	a4, t0, 2
	slli	t2, t0, 1
	mv	a1, a0
.LBB0_4:
	vadd.vx	v9, v8, a4
	vs1r.v	v8, (a1)
	add	a3, a1, t0
	vs1r.v	v9, (a3)
	add	a5, a5, a7
	vadd.vx	v8, v9, a4
	add	a1, a1, t2
	bne	a5, a2, .LBB0_4
	beqz	a6, .LBB0_8
.LBB0_6:
	sh2add	a0, a2, a0
.LBB0_7:
	sw	a2, 0(a0)
	addi	a2, a2, 1
	addi	a0, a0, 4
	bne	t1, a2, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_init_i32, .Lfunc_end0-vector_init_i32

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git c7fd7512a5c5b133665bfecbe2e9748c0607286e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
