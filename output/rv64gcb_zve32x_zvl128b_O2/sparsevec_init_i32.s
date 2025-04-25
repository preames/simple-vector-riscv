	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"sparsevec_init_i32.c"
	.text
	.globl	sparsevec_init_i32              # -- Begin function sparsevec_init_i32
	.p2align	1
	.type	sparsevec_init_i32,@function
sparsevec_init_i32:                     # @sparsevec_init_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_9
# %bb.1:                                # %for.body.preheader
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sd	s0, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset s0, -8
	li	a4, 8
	zext.w	a6, a0
	bgeu	a0, a4, .LBB0_3
# %bb.2:
	li	a0, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	andi	a0, a6, -8
	addi	a4, a0, -8
	sh1add	a4, a4, a2
	addi	a7, a4, 16
	vsetivli	zero, 8, e32, m2, ta, ma
	vid.v	v8
	mv	a5, a2
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vle16.v	v10, (a5)
	vsetivli	zero, 2, e16, mf2, ta, ma
	vmv.x.s	t0, v10
	vslidedown.vi	v11, v10, 1
	vmv.x.s	t1, v11
	vslidedown.vi	v11, v10, 2
	vsetivli	zero, 4, e16, m1, ta, ma
	vslidedown.vi	v10, v10, 4
	vmv.x.s	t3, v11
	vsetivli	zero, 1, e16, mf2, ta, ma
	vslidedown.vi	v11, v11, 1
	vmv.x.s	t4, v11
	vslidedown.vi	v11, v10, 1
	vmv.x.s	t2, v11
	vsetvli	zero, zero, e32, m1, ta, ma
	vslidedown.vi	v11, v8, 1
	vsetivli	zero, 2, e16, mf2, ta, ma
	vmv.x.s	s0, v10
	vslidedown.vi	v10, v10, 2
	vmv.x.s	t6, v10
	vslidedown.vi	v10, v10, 1
	vmv.x.s	t5, v10
	vsetvli	zero, zero, e32, m1, ta, ma
	vslidedown.vi	v10, v8, 2
	sh2add	a4, t0, a1
	sh2add	a3, t1, a1
	vsetivli	zero, 1, e32, m1, ta, ma
	vse32.v	v8, (a4)
	vse32.v	v11, (a3)
	vslidedown.vi	v11, v8, 3
	sh2add	a3, t3, a1
	sh2add	a4, t4, a1
	vse32.v	v10, (a3)
	vse32.v	v11, (a4)
	vsetivli	zero, 1, e32, m2, ta, ma
	vslidedown.vi	v10, v8, 4
	sh2add	a3, s0, a1
	vsetivli	zero, 1, e32, m1, ta, ma
	vse32.v	v10, (a3)
	vsetivli	zero, 1, e32, m2, ta, ma
	vslidedown.vi	v10, v8, 5
	sh2add	a3, t2, a1
	vsetivli	zero, 1, e32, m1, ta, ma
	vse32.v	v10, (a3)
	vsetivli	zero, 1, e32, m2, ta, ma
	vslidedown.vi	v10, v8, 6
	sh2add	a3, t6, a1
	vsetivli	zero, 1, e32, m1, ta, ma
	vse32.v	v10, (a3)
	vsetivli	zero, 1, e32, m2, ta, ma
	vslidedown.vi	v10, v8, 7
	addi	a5, a5, 16
	sh2add	a3, t5, a1
	vsetivli	zero, 1, e32, m1, ta, ma
	vse32.v	v10, (a3)
	vsetivli	zero, 8, e32, m2, ta, ma
	vadd.vi	v8, v8, 8
	bne	a5, a7, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a0, a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader8
	sh1add	a4, a0, a2
	sh1add	a2, a6, a2
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lh	a3, 0(a4)
	addi	a4, a4, 2
	sh2add	a3, a3, a1
	sw	a0, 0(a3)
	addi	a0, a0, 1
	bne	a4, a2, .LBB0_7
.LBB0_8:
	ld	s0, 8(sp)                       # 8-byte Folded Reload
	.cfi_restore s0
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
.LBB0_9:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	sparsevec_init_i32, .Lfunc_end0-sparsevec_init_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
