	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"vector_addw_i32_i64.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:                                # %entry
	blez	a3, .LBB0_9
# %bb.1:                                # %for.body.preheader
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sd	s0, 24(sp)                      # 8-byte Folded Spill
	sd	s1, 16(sp)                      # 8-byte Folded Spill
	sd	s2, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset s0, -8
	.cfi_offset s1, -16
	.cfi_offset s2, -24
	li	a4, 4
	bgeu	a3, a4, .LBB0_3
# %bb.2:
	li	a6, 0
	j	.LBB0_6
.LBB0_3:                                # %vector.ph
	lui	a4, 524288
	addiw	a4, a4, -4
	and	a6, a3, a4
	addi	a4, a6, -4
	sh3add	a4, a4, a0
	addi	a7, a4, 32
	mv	t0, a1
	mv	a5, a2
	mv	a4, a0
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vsetivli	zero, 4, e32, m1, ta, ma
	vle32.v	v8, (t0)
	vle32.v	v9, (a5)
	ld	t1, 0(a4)
	ld	t2, 8(a4)
	ld	t3, 16(a4)
	ld	t4, 24(a4)
	vsetivli	zero, 2, e32, m1, ta, ma
	vslidedown.vi	v10, v8, 2
	vmv.x.s	t5, v8
	vslidedown.vi	v8, v8, 1
	vmv.x.s	t6, v8
	vslidedown.vi	v8, v9, 2
	vmv.x.s	s0, v9
	vslidedown.vi	v9, v9, 1
	vmv.x.s	s1, v10
	vslidedown.vi	v10, v10, 1
	add	t5, t5, s0
	vmv.x.s	s0, v8
	vslidedown.vi	v8, v8, 1
	add	s2, s0, s1
	vmv.x.s	s1, v9
	add	t6, t6, s1
	vmv.x.s	s1, v10
	add	t1, t1, t5
	vmv.x.s	s0, v8
	add	s0, s0, s1
	add	t2, t2, t6
	add	t3, t3, s2
	add	t4, t4, s0
	sd	t1, 0(a4)
	sd	t2, 8(a4)
	sd	t3, 16(a4)
	sd	t4, 24(a4)
	addi	a4, a4, 32
	addi	a5, a5, 16
	addi	t0, t0, 16
	bne	a4, a7, .LBB0_4
# %bb.5:                                # %middle.block
	beq	a6, a3, .LBB0_8
.LBB0_6:                                # %for.body.preheader15
	sh3add	a4, a6, a0
	sh2add	a2, a6, a2
	sh2add	a1, a6, a1
	sh3add	a0, a3, a0
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lw	a3, 0(a1)
	lw	a5, 0(a2)
	ld	s1, 0(a4)
	add	a3, a3, a5
	add	a3, a3, s1
	sd	a3, 0(a4)
	addi	a4, a4, 8
	addi	a2, a2, 4
	addi	a1, a1, 4
	bne	a4, a0, .LBB0_7
.LBB0_8:
	ld	s0, 24(sp)                      # 8-byte Folded Reload
	ld	s1, 16(sp)                      # 8-byte Folded Reload
	ld	s2, 8(sp)                       # 8-byte Folded Reload
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
.LBB0_9:                                # %for.cond.cleanup
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
