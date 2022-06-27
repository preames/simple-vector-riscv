	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_splat_ptr.c"
	.globl	vector_splat_ptr
	.p2align	1
	.type	vector_splat_ptr,@function
vector_splat_ptr:
	beqz	a2, .LBB0_8
	zext.w	a7, a2
	csrr	t0, vlenb
	srli	a4, t0, 3
	bgeu	a7, a4, .LBB0_3
	li	a5, 0
	j	.LBB0_6
.LBB0_3:
	li	a2, 0
	remu	a6, a7, a4
	sub	a5, a7, a6
	vsetvli	a3, zero, e64, m1, ta, mu
	vmv.v.x	v8, a1
	mv	a3, a0
.LBB0_4:
	vs1r.v	v8, (a3)
	add	a2, a2, a4
	add	a3, a3, t0
	bne	a2, a5, .LBB0_4
	beqz	a6, .LBB0_8
.LBB0_6:
	sh3add	a0, a5, a0
	sub	a2, a7, a5
.LBB0_7:
	sd	a1, 0(a0)
	addi	a2, a2, -1
	addi	a0, a0, 8
	bnez	a2, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_splat_ptr, .Lfunc_end0-vector_splat_ptr

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 20dd3297b1c08ce08cbefa4fa41041e68c8e81a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
