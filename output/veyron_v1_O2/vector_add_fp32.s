	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zicbom1p0_zicbop1p0_zicboz1p0_zicntr2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zihpm2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_xventanacondops1p0"
	.file	"vector_add_fp32.c"
	.text
	.globl	vector_add_i32                  # -- Begin function vector_add_i32
	.p2align	1
	.type	vector_add_i32,@function
vector_add_i32:                         # @vector_add_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a1, .LBB0_3
# %bb.1:                                # %for.body.preheader
	sh2add.uw	a1, a1, a0
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	flw	fa5, 0(a0)
	fadd.s	fa5, fa0, fa5
	fsw	fa5, 0(a0)
	addi	a0, a0, 4
	bne	a0, a1, .LBB0_2
.LBB0_3:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	vector_add_i32, .Lfunc_end0-vector_add_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
