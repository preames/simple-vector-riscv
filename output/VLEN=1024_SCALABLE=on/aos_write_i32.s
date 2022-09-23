	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"aos_write_i32.c"
	.globl	aos_init_i32
	.p2align	1
	.type	aos_init_i32,@function
aos_init_i32:
	beqz	a0, .LBB0_8
	zext.w	a0, a0
	csrr	a2, vlenb
	srli	a3, a2, 2
	bgeu	a0, a3, .LBB0_3
	li	a7, 0
	j	.LBB0_6
.LBB0_3:
	addi	a2, a3, -1
	and	a6, a0, a2
	sub	a7, a0, a6
	vsetvli	a2, zero, e64, m2, ta, mu
	vid.v	v8
	li	a5, 56
	addi	a4, a1, 48
	vsetvli	zero, zero, e32, m1, ta, mu
	vmv.v.i	v10, 0
	mv	a2, a7
.LBB0_4:
	vsetvli	zero, zero, e64, m2, ta, mu
	vmul.vx	v12, v8, a5
	vsetvli	zero, zero, e32, m1, ta, mu
	vsoxei64.v	v10, (a4), v12
	vsetvli	zero, zero, e64, m2, ta, mu
	sub	a2, a2, a3
	vadd.vx	v8, v8, a3
	bnez	a2, .LBB0_4
	beqz	a6, .LBB0_8
.LBB0_6:
	li	a2, 56
	mul	a2, a7, a2
	add	a1, a1, a2
	addi	a1, a1, 48
	sub	a0, a0, a7
.LBB0_7:
	sw	zero, 0(a1)
	addi	a0, a0, -1
	addi	a1, a1, 56
	bnez	a0, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	aos_init_i32, .Lfunc_end0-aos_init_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 954c1ed009d423ca9593ee63479a9394a23864fd)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
