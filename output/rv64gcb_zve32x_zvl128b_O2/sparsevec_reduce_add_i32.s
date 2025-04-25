	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"sparsevec_reduce_add_i32.c"
	.text
	.globl	sparsevec_reduce_add_i32        # -- Begin function sparsevec_reduce_add_i32
	.p2align	1
	.type	sparsevec_reduce_add_i32,@function
sparsevec_reduce_add_i32:               # @sparsevec_reduce_add_i32
	.cfi_startproc
# %bb.0:                                # %entry
	beqz	a0, .LBB0_9
# %bb.1:                                # %for.body.preheader
	addi	sp, sp, -96
	.cfi_def_cfa_offset 96
	sd	s0, 88(sp)                      # 8-byte Folded Spill
	sd	s1, 80(sp)                      # 8-byte Folded Spill
	sd	s2, 72(sp)                      # 8-byte Folded Spill
	sd	s3, 64(sp)                      # 8-byte Folded Spill
	sd	s4, 56(sp)                      # 8-byte Folded Spill
	sd	s5, 48(sp)                      # 8-byte Folded Spill
	sd	s6, 40(sp)                      # 8-byte Folded Spill
	sd	s7, 32(sp)                      # 8-byte Folded Spill
	sd	s8, 24(sp)                      # 8-byte Folded Spill
	sd	s9, 16(sp)                      # 8-byte Folded Spill
	sd	s10, 8(sp)                      # 8-byte Folded Spill
	sd	s11, 0(sp)                      # 8-byte Folded Spill
	.cfi_offset s0, -8
	.cfi_offset s1, -16
	.cfi_offset s2, -24
	.cfi_offset s3, -32
	.cfi_offset s4, -40
	.cfi_offset s5, -48
	.cfi_offset s6, -56
	.cfi_offset s7, -64
	.cfi_offset s8, -72
	.cfi_offset s9, -80
	.cfi_offset s10, -88
	.cfi_offset s11, -96
	li	a4, 16
	zext.w	a6, a0
	bgeu	a0, a4, .LBB0_3
# %bb.2:
	li	a7, 0
	li	a0, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	andi	a7, a6, -16
	addi	a0, a7, -16
	sh1add	a0, a0, a2
	vsetivli	zero, 8, e32, m2, ta, ma
	vmv.v.i	v8, 0
	addi	t0, a0, 32
	mv	a3, a2
	vmv.v.i	v10, 0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vle16.v	v12, (a3)
	addi	a5, a3, 16
	vle16.v	v13, (a5)
	vsetivli	zero, 2, e16, mf2, ta, ma
	vmv.x.s	a5, v12
	vslidedown.vi	v14, v12, 1
	vslidedown.vi	v15, v12, 2
	vsetivli	zero, 4, e16, m1, ta, ma
	vslidedown.vi	v12, v12, 4
	vmv.x.s	t1, v14
	vmv.x.s	t2, v15
	vsetivli	zero, 2, e16, mf2, ta, ma
	vslidedown.vi	v14, v15, 1
	vmv.x.s	t6, v12
	vslidedown.vi	v15, v12, 1
	vslidedown.vi	v12, v12, 2
	vmv.x.s	t5, v13
	vmv.x.s	t3, v14
	vslidedown.vi	v14, v13, 1
	vmv.x.s	t4, v15
	vslidedown.vi	v15, v13, 2
	vsetivli	zero, 4, e16, m1, ta, ma
	vslidedown.vi	v13, v13, 4
	sh2add	a5, a5, a1
	vmv.x.s	s3, v12
	vsetivli	zero, 2, e16, mf2, ta, ma
	vslidedown.vi	v12, v12, 1
	vmv.x.s	s2, v14
	vmv.x.s	s4, v15
	vslidedown.vi	v14, v15, 1
	vmv.x.s	s1, v13
	vslidedown.vi	v15, v13, 1
	vslidedown.vi	v13, v13, 2
	sh2add	s6, t6, a1
	sh2add	a0, t2, a1
	sh2add	s0, t1, a1
	sh2add	t1, t5, a1
	lw	t2, 0(a5)
	vmv.x.s	s5, v12
	vmv.x.s	t5, v14
	vmv.x.s	t6, v15
	vmv.x.s	s9, v13
	vslidedown.vi	v12, v13, 1
	sh2add	s3, s3, a1
	sh2add	t4, t4, a1
	sh2add	s10, t3, a1
	sh2add	t3, s1, a1
	sh2add	s4, s4, a1
	sh2add	s11, s2, a1
	lw	s8, 0(s0)
	lw	s7, 0(a0)
	lw	s2, 0(s6)
	lw	t1, 0(t1)
	vmv.x.s	s0, v12
	sh2add	a5, s5, a1
	sh2add	a4, s9, a1
	sh2add	s1, t6, a1
	sh2add	a0, t5, a1
	lw	t5, 0(s10)
	lw	t4, 0(t4)
	lw	t6, 0(s3)
	lw	s3, 0(s11)
	lw	s4, 0(s4)
	lw	t3, 0(t3)
	sh2add	s0, s0, a1
	lw	a5, 0(a5)
	lw	a0, 0(a0)
	lw	s1, 0(s1)
	lw	a4, 0(a4)
	vsetivli	zero, 8, e32, m2, ta, ma
	vmv.v.x	v12, t2
	lw	s0, 0(s0)
	vslide1down.vx	v12, v12, s8
	vmv.v.x	v14, t1
	vslide1down.vx	v12, v12, s7
	vslide1down.vx	v14, v14, s3
	vslide1down.vx	v12, v12, t5
	vslide1down.vx	v14, v14, s4
	vslide1down.vx	v12, v12, s2
	vslide1down.vx	v14, v14, a0
	vslide1down.vx	v12, v12, t4
	vslide1down.vx	v14, v14, t3
	vslide1down.vx	v12, v12, t6
	vslide1down.vx	v14, v14, s1
	vslide1down.vx	v12, v12, a5
	vslide1down.vx	v14, v14, a4
	vslide1down.vx	v14, v14, s0
	vadd.vv	v8, v12, v8
	addi	a3, a3, 32
	vadd.vv	v10, v14, v10
	bne	a3, t0, .LBB0_4
# %bb.5:                                # %middle.block
	vadd.vv	v8, v10, v8
	vmv.s.x	v10, zero
	vredsum.vs	v8, v8, v10
	vmv.x.s	a0, v8
	beq	a7, a6, .LBB0_8
.LBB0_6:                                # %for.body.preheader12
	sh1add	a4, a7, a2
	sh1add	a2, a6, a2
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lh	a3, 0(a4)
	sh2add	a3, a3, a1
	lw	a3, 0(a3)
	addi	a4, a4, 2
	addw	a0, a0, a3
	bne	a4, a2, .LBB0_7
.LBB0_8:
	ld	s0, 88(sp)                      # 8-byte Folded Reload
	ld	s1, 80(sp)                      # 8-byte Folded Reload
	ld	s2, 72(sp)                      # 8-byte Folded Reload
	ld	s3, 64(sp)                      # 8-byte Folded Reload
	ld	s4, 56(sp)                      # 8-byte Folded Reload
	ld	s5, 48(sp)                      # 8-byte Folded Reload
	ld	s6, 40(sp)                      # 8-byte Folded Reload
	ld	s7, 32(sp)                      # 8-byte Folded Reload
	ld	s8, 24(sp)                      # 8-byte Folded Reload
	ld	s9, 16(sp)                      # 8-byte Folded Reload
	ld	s10, 8(sp)                      # 8-byte Folded Reload
	ld	s11, 0(sp)                      # 8-byte Folded Reload
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	.cfi_restore s3
	.cfi_restore s4
	.cfi_restore s5
	.cfi_restore s6
	.cfi_restore s7
	.cfi_restore s8
	.cfi_restore s9
	.cfi_restore s10
	.cfi_restore s11
	addi	sp, sp, 96
	.cfi_def_cfa_offset 0
.LBB0_9:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	sparsevec_reduce_add_i32, .Lfunc_end0-sparsevec_reduce_add_i32
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
