	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_xmipscmov1p0_xmipslsp1p0"
	.file	"openblas_gepb_16x4.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	fsd	fs0, 24(sp)                     # 8-byte Folded Spill
	fsd	fs1, 16(sp)                     # 8-byte Folded Spill
	fsd	fs2, 8(sp)                      # 8-byte Folded Spill
	fsd	fs3, 0(sp)                      # 8-byte Folded Spill
	.cfi_offset fs0, -8
	.cfi_offset fs1, -16
	.cfi_offset fs2, -24
	.cfi_offset fs3, -32
	flw	fa2, 48(a0)
	flw	fa3, 52(a0)
	flw	fa4, 56(a0)
	flw	fa5, 60(a0)
	flw	ft1, 32(a0)
	flw	ft0, 36(a0)
	flw	fa0, 40(a0)
	flw	fa1, 44(a0)
	flw	ft5, 16(a0)
	flw	ft4, 20(a0)
	flw	ft3, 24(a0)
	flw	ft2, 28(a0)
	flw	fa6, 0(a0)
	flw	ft7, 4(a0)
	flw	ft6, 8(a0)
	flw	fa7, 12(a0)
	flw	fs0, 0(a2)
	flw	fs1, 4(a2)
	flw	fs2, 8(a2)
	flw	fs3, 12(a2)
	flw	ft11, 0(a1)
	flw	ft9, 4(a1)
	flw	ft10, 8(a1)
	flw	ft8, 12(a1)
	fmadd.s	fs0, fa6, ft11, fs0
	fmadd.s	fs1, ft7, ft11, fs1
	fmadd.s	fs2, ft6, ft11, fs2
	fmadd.s	fs3, fa7, ft11, fs3
	fsw	fs0, 0(a2)
	fsw	fs1, 4(a2)
	fsw	fs2, 8(a2)
	fsw	fs3, 12(a2)
	flw	fs0, 16(a2)
	flw	fs1, 20(a2)
	flw	fs2, 24(a2)
	flw	fs3, 28(a2)
	fmadd.s	fs0, ft5, ft11, fs0
	fmadd.s	fs1, ft4, ft11, fs1
	fmadd.s	fs2, ft3, ft11, fs2
	fmadd.s	fs3, ft2, ft11, fs3
	fsw	fs0, 16(a2)
	fsw	fs1, 20(a2)
	fsw	fs2, 24(a2)
	fsw	fs3, 28(a2)
	flw	fs0, 32(a2)
	flw	fs1, 36(a2)
	flw	fs2, 40(a2)
	flw	fs3, 44(a2)
	fmadd.s	fs0, ft1, ft11, fs0
	fmadd.s	fs1, ft0, ft11, fs1
	fmadd.s	fs2, fa0, ft11, fs2
	fmadd.s	fs3, fa1, ft11, fs3
	fsw	fs0, 32(a2)
	fsw	fs1, 36(a2)
	fsw	fs2, 40(a2)
	fsw	fs3, 44(a2)
	flw	fs0, 48(a2)
	flw	fs1, 52(a2)
	flw	fs2, 56(a2)
	flw	fs3, 60(a2)
	fmadd.s	fs0, fa2, ft11, fs0
	fmadd.s	fs1, fa3, ft11, fs1
	fmadd.s	fs2, fa4, ft11, fs2
	fmadd.s	ft11, fa5, ft11, fs3
	fsw	fs0, 48(a2)
	fsw	fs1, 52(a2)
	fsw	fs2, 56(a2)
	fsw	ft11, 60(a2)
	flw	ft11, 64(a2)
	flw	fs0, 68(a2)
	flw	fs1, 72(a2)
	flw	fs2, 76(a2)
	fmadd.s	ft11, fa6, ft9, ft11
	fmadd.s	fs0, ft7, ft9, fs0
	fmadd.s	fs1, ft6, ft9, fs1
	fmadd.s	fs2, fa7, ft9, fs2
	fsw	ft11, 64(a2)
	fsw	fs0, 68(a2)
	fsw	fs1, 72(a2)
	fsw	fs2, 76(a2)
	flw	ft11, 80(a2)
	flw	fs0, 84(a2)
	flw	fs1, 88(a2)
	flw	fs2, 92(a2)
	fmadd.s	ft11, ft5, ft9, ft11
	fmadd.s	fs0, ft4, ft9, fs0
	fmadd.s	fs1, ft3, ft9, fs1
	fmadd.s	fs2, ft2, ft9, fs2
	fsw	ft11, 80(a2)
	fsw	fs0, 84(a2)
	fsw	fs1, 88(a2)
	fsw	fs2, 92(a2)
	flw	ft11, 96(a2)
	flw	fs0, 100(a2)
	flw	fs1, 104(a2)
	flw	fs2, 108(a2)
	fmadd.s	ft11, ft1, ft9, ft11
	fmadd.s	fs0, ft0, ft9, fs0
	fmadd.s	fs1, fa0, ft9, fs1
	fmadd.s	fs2, fa1, ft9, fs2
	fsw	ft11, 96(a2)
	fsw	fs0, 100(a2)
	fsw	fs1, 104(a2)
	fsw	fs2, 108(a2)
	flw	ft11, 112(a2)
	flw	fs0, 116(a2)
	flw	fs1, 120(a2)
	flw	fs2, 124(a2)
	fmadd.s	ft11, fa2, ft9, ft11
	fmadd.s	fs0, fa3, ft9, fs0
	fmadd.s	fs1, fa4, ft9, fs1
	fmadd.s	ft9, fa5, ft9, fs2
	fsw	ft11, 112(a2)
	fsw	fs0, 116(a2)
	fsw	fs1, 120(a2)
	fsw	ft9, 124(a2)
	flw	ft9, 128(a2)
	flw	ft11, 132(a2)
	flw	fs0, 136(a2)
	flw	fs1, 140(a2)
	fmadd.s	ft9, fa6, ft10, ft9
	fmadd.s	ft11, ft7, ft10, ft11
	fmadd.s	fs0, ft6, ft10, fs0
	fmadd.s	fs1, fa7, ft10, fs1
	fsw	ft9, 128(a2)
	fsw	ft11, 132(a2)
	fsw	fs0, 136(a2)
	fsw	fs1, 140(a2)
	flw	ft9, 144(a2)
	flw	ft11, 148(a2)
	flw	fs0, 152(a2)
	flw	fs1, 156(a2)
	fmadd.s	ft9, ft5, ft10, ft9
	fmadd.s	ft11, ft4, ft10, ft11
	fmadd.s	fs0, ft3, ft10, fs0
	fmadd.s	fs1, ft2, ft10, fs1
	fsw	ft9, 144(a2)
	fsw	ft11, 148(a2)
	fsw	fs0, 152(a2)
	fsw	fs1, 156(a2)
	flw	ft9, 160(a2)
	flw	ft11, 164(a2)
	flw	fs0, 168(a2)
	flw	fs1, 172(a2)
	fmadd.s	ft9, ft1, ft10, ft9
	fmadd.s	ft11, ft0, ft10, ft11
	fmadd.s	fs0, fa0, ft10, fs0
	fmadd.s	fs1, fa1, ft10, fs1
	fsw	ft9, 160(a2)
	fsw	ft11, 164(a2)
	fsw	fs0, 168(a2)
	fsw	fs1, 172(a2)
	flw	ft9, 176(a2)
	flw	ft11, 180(a2)
	flw	fs0, 184(a2)
	flw	fs1, 188(a2)
	fmadd.s	ft9, fa2, ft10, ft9
	fmadd.s	ft11, fa3, ft10, ft11
	fmadd.s	fs0, fa4, ft10, fs0
	fmadd.s	ft10, fa5, ft10, fs1
	fsw	ft9, 176(a2)
	fsw	ft11, 180(a2)
	fsw	fs0, 184(a2)
	fsw	ft10, 188(a2)
	flw	ft9, 192(a2)
	flw	ft10, 196(a2)
	flw	ft11, 200(a2)
	flw	fs0, 204(a2)
	fmadd.s	fa6, fa6, ft8, ft9
	fmadd.s	ft7, ft7, ft8, ft10
	fmadd.s	ft6, ft6, ft8, ft11
	fmadd.s	fa7, fa7, ft8, fs0
	fsw	fa6, 192(a2)
	fsw	ft7, 196(a2)
	fsw	ft6, 200(a2)
	fsw	fa7, 204(a2)
	flw	ft6, 208(a2)
	flw	ft7, 212(a2)
	flw	fa6, 216(a2)
	flw	fa7, 220(a2)
	fmadd.s	ft5, ft5, ft8, ft6
	fmadd.s	ft4, ft4, ft8, ft7
	fmadd.s	ft3, ft3, ft8, fa6
	fmadd.s	ft2, ft2, ft8, fa7
	fsw	ft5, 208(a2)
	fsw	ft4, 212(a2)
	fsw	ft3, 216(a2)
	fsw	ft2, 220(a2)
	flw	ft2, 224(a2)
	flw	ft3, 228(a2)
	flw	ft4, 232(a2)
	flw	ft5, 236(a2)
	fmadd.s	ft1, ft1, ft8, ft2
	fmadd.s	ft0, ft0, ft8, ft3
	fmadd.s	fa0, fa0, ft8, ft4
	fmadd.s	fa1, fa1, ft8, ft5
	fsw	ft1, 224(a2)
	fsw	ft0, 228(a2)
	fsw	fa0, 232(a2)
	fsw	fa1, 236(a2)
	flw	fa1, 240(a2)
	flw	fa0, 244(a2)
	flw	ft0, 248(a2)
	flw	ft1, 252(a2)
	fmadd.s	fa2, fa2, ft8, fa1
	fmadd.s	fa3, fa3, ft8, fa0
	fmadd.s	fa4, fa4, ft8, ft0
	fmadd.s	fa5, fa5, ft8, ft1
	fsw	fa2, 240(a2)
	fsw	fa3, 244(a2)
	fsw	fa4, 248(a2)
	fsw	fa5, 252(a2)
	fld	fs0, 24(sp)                     # 8-byte Folded Reload
	fld	fs1, 16(sp)                     # 8-byte Folded Reload
	fld	fs2, 8(sp)                      # 8-byte Folded Reload
	fld	fs3, 0(sp)                      # 8-byte Folded Reload
	.cfi_restore fs0
	.cfi_restore fs1
	.cfi_restore fs2
	.cfi_restore fs3
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
