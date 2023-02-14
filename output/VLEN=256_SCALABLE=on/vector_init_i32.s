	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_init_i32.c"
	.globl	vector_init_i32
	.p2align	1
	.type	vector_init_i32,@function
vector_init_i32:
	beqz	a1, .LBB0_8
	zext.w	a7, a1
	csrr	a2, vlenb
	srli	a3, a2, 1
	bgeu	a7, a3, .LBB0_3
	li	a4, 0
	j	.LBB0_6
.LBB0_3:
	addi	a1, a3, -1
	and	a6, a7, a1
	sub	a4, a7, a6
	vsetvli	a1, zero, e32, m2, ta, ma
	vid.v	v8
	slli	a2, a2, 1
	mv	a1, a4
	mv	a5, a0
.LBB0_4:
	vs2r.v	v8, (a5)
	vadd.vx	v8, v8, a3
	sub	a1, a1, a3
	add	a5, a5, a2
	bnez	a1, .LBB0_4
	beqz	a6, .LBB0_8
.LBB0_6:
	sh2add	a0, a4, a0
	sub	a2, a7, a4
.LBB0_7:
	sw	a4, 0(a0)
	addiw	a4, a4, 1
	addi	a2, a2, -1
	addi	a0, a0, 4
	bnez	a2, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_init_i32, .Lfunc_end0-vector_init_i32

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
