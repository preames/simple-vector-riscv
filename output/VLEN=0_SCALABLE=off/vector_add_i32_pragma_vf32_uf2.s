	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_add_i32_pragma_vf32_uf2.c"
	.globl	vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:
	beqz	a1, .LBB0_8
	li	a3, 64
	zext.w	a6, a1
	bgeu	a1, a3, .LBB0_3
	li	a7, 0
	j	.LBB0_6
.LBB0_3:
	andi	a7, a6, -64
	mv	t1, a7
	mv	a5, a0
.LBB0_4:
	lw	a1, 124(a5)
	lw	a3, 120(a5)
	lw	t0, 116(a5)
	addw	a1, a1, a2
	sw	a1, 124(a5)
	lw	a1, 112(a5)
	addw	a3, a3, a2
	sw	a3, 120(a5)
	lw	a3, 108(a5)
	addw	a4, t0, a2
	sw	a4, 116(a5)
	lw	a4, 104(a5)
	addw	a1, a1, a2
	sw	a1, 112(a5)
	lw	a1, 100(a5)
	addw	a3, a3, a2
	sw	a3, 108(a5)
	lw	a3, 96(a5)
	addw	a4, a4, a2
	sw	a4, 104(a5)
	lw	a4, 92(a5)
	addw	a1, a1, a2
	sw	a1, 100(a5)
	lw	a1, 88(a5)
	addw	a3, a3, a2
	sw	a3, 96(a5)
	lw	a3, 84(a5)
	addw	a4, a4, a2
	sw	a4, 92(a5)
	lw	a4, 80(a5)
	addw	a1, a1, a2
	sw	a1, 88(a5)
	lw	a1, 76(a5)
	addw	a3, a3, a2
	sw	a3, 84(a5)
	lw	a3, 72(a5)
	addw	a4, a4, a2
	sw	a4, 80(a5)
	lw	a4, 68(a5)
	addw	a1, a1, a2
	sw	a1, 76(a5)
	lw	a1, 64(a5)
	addw	a3, a3, a2
	sw	a3, 72(a5)
	lw	a3, 60(a5)
	addw	a4, a4, a2
	sw	a4, 68(a5)
	lw	a4, 56(a5)
	addw	a1, a1, a2
	sw	a1, 64(a5)
	lw	a1, 52(a5)
	addw	a3, a3, a2
	sw	a3, 60(a5)
	lw	a3, 48(a5)
	addw	a4, a4, a2
	sw	a4, 56(a5)
	lw	a4, 44(a5)
	addw	a1, a1, a2
	sw	a1, 52(a5)
	lw	a1, 40(a5)
	addw	a3, a3, a2
	sw	a3, 48(a5)
	lw	a3, 36(a5)
	addw	a4, a4, a2
	sw	a4, 44(a5)
	lw	a4, 32(a5)
	addw	a1, a1, a2
	sw	a1, 40(a5)
	lw	a1, 28(a5)
	addw	a3, a3, a2
	sw	a3, 36(a5)
	lw	a3, 24(a5)
	addw	a4, a4, a2
	sw	a4, 32(a5)
	lw	a4, 20(a5)
	addw	a1, a1, a2
	sw	a1, 28(a5)
	lw	a1, 16(a5)
	addw	a3, a3, a2
	sw	a3, 24(a5)
	lw	a3, 12(a5)
	addw	a4, a4, a2
	sw	a4, 20(a5)
	lw	a4, 8(a5)
	addw	a1, a1, a2
	sw	a1, 16(a5)
	lw	a1, 4(a5)
	addw	a3, a3, a2
	sw	a3, 12(a5)
	lw	a3, 0(a5)
	addw	a4, a4, a2
	sw	a4, 8(a5)
	lw	a4, 252(a5)
	addw	a1, a1, a2
	sw	a1, 4(a5)
	lw	a1, 248(a5)
	addw	a3, a3, a2
	sw	a3, 0(a5)
	lw	a3, 244(a5)
	addw	a4, a4, a2
	sw	a4, 252(a5)
	lw	a4, 240(a5)
	addw	a1, a1, a2
	sw	a1, 248(a5)
	lw	a1, 236(a5)
	addw	a3, a3, a2
	sw	a3, 244(a5)
	lw	a3, 232(a5)
	addw	a4, a4, a2
	sw	a4, 240(a5)
	lw	a4, 228(a5)
	addw	a1, a1, a2
	sw	a1, 236(a5)
	lw	a1, 224(a5)
	addw	a3, a3, a2
	sw	a3, 232(a5)
	lw	a3, 220(a5)
	addw	a4, a4, a2
	sw	a4, 228(a5)
	lw	a4, 216(a5)
	addw	a1, a1, a2
	sw	a1, 224(a5)
	lw	a1, 212(a5)
	addw	a3, a3, a2
	sw	a3, 220(a5)
	lw	a3, 208(a5)
	addw	a4, a4, a2
	sw	a4, 216(a5)
	lw	a4, 204(a5)
	addw	a1, a1, a2
	sw	a1, 212(a5)
	lw	a1, 200(a5)
	addw	a3, a3, a2
	sw	a3, 208(a5)
	lw	a3, 196(a5)
	addw	a4, a4, a2
	sw	a4, 204(a5)
	lw	a4, 192(a5)
	addw	a1, a1, a2
	sw	a1, 200(a5)
	lw	a1, 188(a5)
	addw	a3, a3, a2
	sw	a3, 196(a5)
	lw	a3, 184(a5)
	addw	a4, a4, a2
	sw	a4, 192(a5)
	lw	a4, 180(a5)
	addw	a1, a1, a2
	sw	a1, 188(a5)
	lw	a1, 176(a5)
	addw	a3, a3, a2
	sw	a3, 184(a5)
	lw	a3, 172(a5)
	addw	a4, a4, a2
	sw	a4, 180(a5)
	lw	a4, 168(a5)
	addw	a1, a1, a2
	sw	a1, 176(a5)
	lw	a1, 164(a5)
	addw	a3, a3, a2
	sw	a3, 172(a5)
	lw	a3, 160(a5)
	addw	a4, a4, a2
	sw	a4, 168(a5)
	lw	a4, 156(a5)
	addw	a1, a1, a2
	sw	a1, 164(a5)
	lw	a1, 152(a5)
	addw	a3, a3, a2
	sw	a3, 160(a5)
	lw	a3, 148(a5)
	addw	a4, a4, a2
	sw	a4, 156(a5)
	lw	a4, 144(a5)
	addw	a1, a1, a2
	sw	a1, 152(a5)
	lw	a1, 140(a5)
	addw	a3, a3, a2
	sw	a3, 148(a5)
	lw	a3, 136(a5)
	addw	a4, a4, a2
	sw	a4, 144(a5)
	lw	a4, 132(a5)
	addw	a1, a1, a2
	sw	a1, 140(a5)
	lw	a1, 128(a5)
	addw	a3, a3, a2
	sw	a3, 136(a5)
	addw	a3, a4, a2
	sw	a3, 132(a5)
	addw	a1, a1, a2
	sw	a1, 128(a5)
	addi	t1, t1, -64
	addi	a5, a5, 256
	bnez	t1, .LBB0_4
	beq	a7, a6, .LBB0_8
.LBB0_6:
	sh2add	a0, a7, a0
	sub	a1, a6, a7
.LBB0_7:
	lw	a3, 0(a0)
	addw	a3, a3, a2
	sw	a3, 0(a0)
	addi	a1, a1, -1
	addi	a0, a0, 4
	bnez	a1, .LBB0_7
.LBB0_8:
	ret
.Lfunc_end0:
	.size	vector_add_i32, .Lfunc_end0-vector_add_i32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
