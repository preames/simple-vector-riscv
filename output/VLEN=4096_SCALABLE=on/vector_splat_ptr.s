	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_splat_ptr.c"
	.globl	vector_splat_ptr
	.p2align	1
	.type	vector_splat_ptr,@function
vector_splat_ptr:
	beqz	a2, .LBB0_8
	zext.w	t0, a2
	csrr	a2, vlenb
	srli	a4, a2, 2
	bgeu	t0, a4, .LBB0_3
	li	a7, 0
	j	.LBB0_6
.LBB0_3:
	addi	a3, a4, -1
	and	a6, t0, a3
	sub	a7, t0, a6
	vsetvli	a3, zero, e64, m2, ta, ma
	vmv.v.x	v8, a1
	slli	a2, a2, 1
	mv	a3, a7
	mv	a5, a0
.LBB0_4:
	vs2r.v	v8, (a5)
	sub	a3, a3, a4
	add	a5, a5, a2
	bnez	a3, .LBB0_4
	beqz	a6, .LBB0_8
.LBB0_6:
	sh3add	a0, a7, a0
	sub	a2, t0, a7
.LBB0_7:
	sd	a1, 0(a0)
	addi	a2, a2, -1
	addi	a0, a0, 8
	bnez	a2, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_splat_ptr, .Lfunc_end0-vector_splat_ptr

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
