	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_add_fp32.c"
	.globl	vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:
	beqz	a1, .LBB0_8
	zext.w	a1, a1
	csrr	a4, vlenb
	srli	a3, a4, 1
	bgeu	a1, a3, .LBB0_3
	li	a7, 0
	j	.LBB0_6
.LBB0_3:
	addi	a2, a3, -1
	and	a6, a1, a2
	sub	a7, a1, a6
	slli	a4, a4, 1
	vsetvli	a2, zero, e32, m2, ta, ma
	mv	a2, a7
	mv	a5, a0
.LBB0_4:
	vl2re32.v	v8, (a5)
	vfadd.vf	v8, v8, fa0
	vs2r.v	v8, (a5)
	sub	a2, a2, a3
	add	a5, a5, a4
	bnez	a2, .LBB0_4
	beqz	a6, .LBB0_8
.LBB0_6:
	sh2add	a0, a7, a0
	sub	a1, a1, a7
.LBB0_7:
	flw	fa5, 0(a0)
	fadd.s	fa5, fa5, fa0
	fsw	fa5, 0(a0)
	addi	a1, a1, -1
	addi	a0, a0, 4
	bnez	a1, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_add_i32, .Lfunc_end0-vector_add_i32

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
