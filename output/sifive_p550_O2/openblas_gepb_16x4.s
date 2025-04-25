	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
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
	flw	ft4, 0(a0)
	flw	ft3, 4(a0)
	flw	ft2, 8(a0)
	flw	ft5, 12(a0)
	flw	ft8, 0(a2)
	flw	ft9, 4(a2)
	flw	ft10, 8(a2)
	flw	ft11, 12(a2)
	flw	fa7, 0(a1)
	flw	ft7, 4(a1)
	flw	fa6, 8(a1)
	flw	ft6, 12(a1)
	fmadd.s	ft8, ft4, fa7, ft8
	fmadd.s	ft9, ft3, fa7, ft9
	fmadd.s	ft10, ft2, fa7, ft10
	fmadd.s	ft11, ft5, fa7, ft11
	fsw	ft8, 0(a2)
	fsw	ft9, 4(a2)
	fsw	ft10, 8(a2)
	fsw	ft11, 12(a2)
	flw	ft1, 16(a0)
	flw	ft0, 20(a0)
	flw	fa0, 24(a0)
	flw	fa1, 28(a0)
	flw	ft8, 16(a2)
	flw	ft9, 20(a2)
	flw	ft10, 24(a2)
	flw	ft11, 28(a2)
	fmadd.s	ft8, ft1, fa7, ft8
	fmadd.s	ft9, ft0, fa7, ft9
	fmadd.s	ft10, fa0, fa7, ft10
	fmadd.s	ft11, fa1, fa7, ft11
	fsw	ft8, 16(a2)
	fsw	ft9, 20(a2)
	fsw	ft10, 24(a2)
	fsw	ft11, 28(a2)
	flw	fa2, 32(a0)
	flw	fa3, 36(a0)
	flw	fa4, 40(a0)
	flw	fa5, 44(a0)
	flw	ft8, 32(a2)
	flw	ft9, 36(a2)
	flw	ft10, 40(a2)
	flw	ft11, 44(a2)
	fmadd.s	ft8, fa2, fa7, ft8
	fmadd.s	ft9, fa3, fa7, ft9
	fmadd.s	ft10, fa4, fa7, ft10
	fmadd.s	ft11, fa5, fa7, ft11
	fsw	ft8, 32(a2)
	fsw	ft9, 36(a2)
	fsw	ft10, 40(a2)
	fsw	ft11, 44(a2)
	flw	ft11, 48(a0)
	flw	ft10, 52(a0)
	flw	ft9, 56(a0)
	flw	ft8, 60(a0)
	flw	fs0, 48(a2)
	flw	fs1, 52(a2)
	flw	fs2, 56(a2)
	flw	fs3, 60(a2)
	fmadd.s	fs0, ft11, fa7, fs0
	fmadd.s	fs1, ft10, fa7, fs1
	fmadd.s	fs2, ft9, fa7, fs2
	fmadd.s	fa7, ft8, fa7, fs3
	fsw	fs0, 48(a2)
	fsw	fs1, 52(a2)
	fsw	fs2, 56(a2)
	fsw	fa7, 60(a2)
	flw	fa7, 64(a2)
	flw	fs0, 68(a2)
	flw	fs1, 72(a2)
	flw	fs2, 76(a2)
	fmadd.s	fa7, ft4, ft7, fa7
	fmadd.s	fs0, ft3, ft7, fs0
	fmadd.s	fs1, ft2, ft7, fs1
	fmadd.s	fs2, ft5, ft7, fs2
	fld	fs3, 0(sp)                      # 8-byte Folded Reload
	fsw	fa7, 64(a2)
	fsw	fs0, 68(a2)
	fsw	fs1, 72(a2)
	fsw	fs2, 76(a2)
	flw	fa7, 80(a2)
	flw	fs0, 84(a2)
	flw	fs1, 88(a2)
	flw	fs2, 92(a2)
	fmadd.s	fa7, ft1, ft7, fa7
	fmadd.s	fs0, ft0, ft7, fs0
	fmadd.s	fs1, fa0, ft7, fs1
	fmadd.s	fs2, fa1, ft7, fs2
	fsw	fa7, 80(a2)
	fsw	fs0, 84(a2)
	fsw	fs1, 88(a2)
	fsw	fs2, 92(a2)
	flw	fa7, 96(a2)
	flw	fs0, 100(a2)
	flw	fs1, 104(a2)
	flw	fs2, 108(a2)
	fmadd.s	fa7, fa2, ft7, fa7
	fmadd.s	fs0, fa3, ft7, fs0
	fmadd.s	fs1, fa4, ft7, fs1
	fmadd.s	fs2, fa5, ft7, fs2
	fsw	fa7, 96(a2)
	fsw	fs0, 100(a2)
	fsw	fs1, 104(a2)
	fsw	fs2, 108(a2)
	flw	fa7, 112(a2)
	flw	fs0, 116(a2)
	flw	fs1, 120(a2)
	flw	fs2, 124(a2)
	fmadd.s	fa7, ft11, ft7, fa7
	fmadd.s	fs0, ft10, ft7, fs0
	fmadd.s	fs1, ft9, ft7, fs1
	fmadd.s	ft7, ft8, ft7, fs2
	fld	fs2, 8(sp)                      # 8-byte Folded Reload
	fsw	fa7, 112(a2)
	fsw	fs0, 116(a2)
	fsw	fs1, 120(a2)
	fsw	ft7, 124(a2)
	flw	ft7, 128(a2)
	flw	fa7, 132(a2)
	flw	fs0, 136(a2)
	flw	fs1, 140(a2)
	fmadd.s	ft7, ft4, fa6, ft7
	fmadd.s	fa7, ft3, fa6, fa7
	fmadd.s	fs0, ft2, fa6, fs0
	fmadd.s	fs1, ft5, fa6, fs1
	fsw	ft7, 128(a2)
	fsw	fa7, 132(a2)
	fsw	fs0, 136(a2)
	fsw	fs1, 140(a2)
	flw	ft7, 144(a2)
	flw	fa7, 148(a2)
	flw	fs0, 152(a2)
	flw	fs1, 156(a2)
	fmadd.s	ft7, ft1, fa6, ft7
	fmadd.s	fa7, ft0, fa6, fa7
	fmadd.s	fs0, fa0, fa6, fs0
	fmadd.s	fs1, fa1, fa6, fs1
	fsw	ft7, 144(a2)
	fsw	fa7, 148(a2)
	fsw	fs0, 152(a2)
	fsw	fs1, 156(a2)
	flw	ft7, 160(a2)
	flw	fa7, 164(a2)
	flw	fs0, 168(a2)
	flw	fs1, 172(a2)
	fmadd.s	ft7, fa2, fa6, ft7
	fmadd.s	fa7, fa3, fa6, fa7
	fmadd.s	fs0, fa4, fa6, fs0
	fmadd.s	fs1, fa5, fa6, fs1
	fsw	ft7, 160(a2)
	fsw	fa7, 164(a2)
	fsw	fs0, 168(a2)
	fsw	fs1, 172(a2)
	flw	ft7, 176(a2)
	flw	fa7, 180(a2)
	flw	fs0, 184(a2)
	flw	fs1, 188(a2)
	fmadd.s	ft7, ft11, fa6, ft7
	fmadd.s	fa7, ft10, fa6, fa7
	fmadd.s	fs0, ft9, fa6, fs0
	fmadd.s	fa6, ft8, fa6, fs1
	fld	fs1, 16(sp)                     # 8-byte Folded Reload
	fsw	ft7, 176(a2)
	fsw	fa7, 180(a2)
	fsw	fs0, 184(a2)
	fsw	fa6, 188(a2)
	flw	ft7, 192(a2)
	flw	fa6, 196(a2)
	flw	fa7, 200(a2)
	flw	fs0, 204(a2)
	fmadd.s	ft4, ft4, ft6, ft7
	fmadd.s	ft3, ft3, ft6, fa6
	fmadd.s	ft2, ft2, ft6, fa7
	fmadd.s	ft5, ft5, ft6, fs0
	fld	fs0, 24(sp)                     # 8-byte Folded Reload
	fsw	ft4, 192(a2)
	fsw	ft3, 196(a2)
	fsw	ft2, 200(a2)
	fsw	ft5, 204(a2)
	flw	ft2, 208(a2)
	flw	ft3, 212(a2)
	flw	ft4, 216(a2)
	flw	ft5, 220(a2)
	fmadd.s	ft1, ft1, ft6, ft2
	fmadd.s	ft0, ft0, ft6, ft3
	fmadd.s	fa0, fa0, ft6, ft4
	fmadd.s	fa1, fa1, ft6, ft5
	fsw	ft1, 208(a2)
	fsw	ft0, 212(a2)
	fsw	fa0, 216(a2)
	fsw	fa1, 220(a2)
	flw	fa1, 224(a2)
	flw	fa0, 228(a2)
	flw	ft0, 232(a2)
	flw	ft1, 236(a2)
	fmadd.s	fa2, fa2, ft6, fa1
	fmadd.s	fa3, fa3, ft6, fa0
	fmadd.s	fa4, fa4, ft6, ft0
	fmadd.s	fa5, fa5, ft6, ft1
	fsw	fa2, 224(a2)
	fsw	fa3, 228(a2)
	fsw	fa4, 232(a2)
	fsw	fa5, 236(a2)
	flw	fa5, 240(a2)
	flw	fa4, 244(a2)
	flw	fa3, 248(a2)
	flw	fa2, 252(a2)
	fmadd.s	fa5, ft11, ft6, fa5
	fmadd.s	fa4, ft10, ft6, fa4
	fmadd.s	fa3, ft9, ft6, fa3
	fmadd.s	fa2, ft8, ft6, fa2
	fsw	fa5, 240(a2)
	fsw	fa4, 244(a2)
	fsw	fa3, 248(a2)
	fsw	fa2, 252(a2)
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
