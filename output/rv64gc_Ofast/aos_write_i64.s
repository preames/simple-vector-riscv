	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0"
	.file	"aos_write_i64.c"
	.text
	.globl	aos_init_i64                    # -- Begin function aos_init_i64
	.p2align	1
	.type	aos_init_i64,@function
aos_init_i64:                           # @aos_init_i64
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_3
# %bb.1:                                # %for.body.preheader
	addi	a1, a1, 48
	slli	a0, a0, 32
	srli	a2, a0, 29
	srli	a0, a0, 26
	sub	a0, a0, a2
	add	a0, a0, a1
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	sd	zero, 0(a1)
	addi	a1, a1, 56
	bne	a1, a0, .LBB0_2
.LBB0_3:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	aos_init_i64, .Lfunc_end0-aos_init_i64
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
