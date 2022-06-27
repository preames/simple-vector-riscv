	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"memset_i32.c"
	.globl	my_memset
	.p2align	1
	.type	my_memset,@function
my_memset:
	beqz	a1, .LBB0_8
	zext.w	a7, a1
	csrr	t0, vlenb
	srli	t1, t0, 1
	bgeu	a7, t1, .LBB0_3
	li	t2, 0
	j	.LBB0_6
.LBB0_3:
	li	a1, 0
	remu	a6, a7, t1
	sub	t2, a7, a6
	vsetvli	a3, zero, e32, m1, ta, mu
	vmv.v.x	v8, a2
	slli	a3, t0, 1
	mv	a4, a0
.LBB0_4:
	vs1r.v	v8, (a4)
	add	a5, a4, t0
	vs1r.v	v8, (a5)
	add	a1, a1, t1
	add	a4, a4, a3
	bne	a1, t2, .LBB0_4
	beqz	a6, .LBB0_8
.LBB0_6:
	sh2add	a0, t2, a0
	sub	a1, a7, t2
.LBB0_7:
	sw	a2, 0(a0)
	addi	a1, a1, -1
	addi	a0, a0, 4
	bnez	a1, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	my_memset, .Lfunc_end0-my_memset

	.ident	"clang version 15.0.0 (https://github.com/llvm/llvm-project.git 20dd3297b1c08ce08cbefa4fa41041e68c8e81a4)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
