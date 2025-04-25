	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"openblas_gepb_16x4.c"
	.text
	.globl	test                            # -- Begin function test
	.p2align	1
	.type	test,@function
test:                                   # @test
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "openblas_gepb_16x4.c" md5 0xd8686e7109744cf94f07a7a2da3a108c
	.loc	0 5 0                           # openblas_gepb_16x4.c:5:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: test:A <- $x10
	#DEBUG_VALUE: test:B <- $x11
	#DEBUG_VALUE: test:C <- $x12
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
.Ltmp0:
	#DEBUG_VALUE: ki <- 0
	flw	ft4, 0(a0)
	flw	ft3, 4(a0)
	flw	ft2, 8(a0)
.Ltmp1:
	.loc	0 8 34 prologue_end             # openblas_gepb_16x4.c:8:34
	flw	ft5, 12(a0)
	.loc	0 8 31 is_stmt 0                # openblas_gepb_16x4.c:8:31
	flw	ft8, 0(a2)
	flw	ft9, 4(a2)
	flw	ft10, 8(a2)
	flw	ft11, 12(a2)
	flw	fa7, 0(a1)
.Ltmp2:
	#DEBUG_VALUE: kj <- 0
	.loc	0 0 31                          # openblas_gepb_16x4.c:0:31
	flw	ft7, 4(a1)
	flw	fa6, 8(a1)
	flw	ft6, 12(a1)
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fmadd.s	ft8, ft4, fa7, ft8
	fmadd.s	ft9, ft3, fa7, ft9
	fmadd.s	ft10, ft2, fa7, ft10
	fmadd.s	ft11, ft5, fa7, ft11
	fsw	ft8, 0(a2)
.Ltmp3:
	#DEBUG_VALUE: kj <- 1
	fsw	ft9, 4(a2)
.Ltmp4:
	#DEBUG_VALUE: kj <- 2
	fsw	ft10, 8(a2)
.Ltmp5:
	#DEBUG_VALUE: kj <- 3
	fsw	ft11, 12(a2)
.Ltmp6:
	#DEBUG_VALUE: kj <- 4
	.loc	0 8 34                          # openblas_gepb_16x4.c:8:34
	flw	ft1, 16(a0)
	flw	ft0, 20(a0)
	flw	fa0, 24(a0)
	flw	fa1, 28(a0)
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	flw	ft8, 16(a2)
	flw	ft9, 20(a2)
	flw	ft10, 24(a2)
	flw	ft11, 28(a2)
	fmadd.s	ft8, ft1, fa7, ft8
	fmadd.s	ft9, ft0, fa7, ft9
	fmadd.s	ft10, fa0, fa7, ft10
	fmadd.s	ft11, fa1, fa7, ft11
	fsw	ft8, 16(a2)
.Ltmp7:
	#DEBUG_VALUE: kj <- 5
	fsw	ft9, 20(a2)
.Ltmp8:
	#DEBUG_VALUE: kj <- 6
	fsw	ft10, 24(a2)
.Ltmp9:
	#DEBUG_VALUE: kj <- 7
	fsw	ft11, 28(a2)
.Ltmp10:
	#DEBUG_VALUE: kj <- 8
	.loc	0 8 34                          # openblas_gepb_16x4.c:8:34
	flw	fa2, 32(a0)
	flw	fa3, 36(a0)
	flw	fa4, 40(a0)
	flw	fa5, 44(a0)
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	flw	ft8, 32(a2)
	flw	ft9, 36(a2)
	flw	ft10, 40(a2)
	flw	ft11, 44(a2)
	fmadd.s	ft8, fa2, fa7, ft8
	fmadd.s	ft9, fa3, fa7, ft9
	fmadd.s	ft10, fa4, fa7, ft10
	fmadd.s	ft11, fa5, fa7, ft11
	fsw	ft8, 32(a2)
.Ltmp11:
	#DEBUG_VALUE: kj <- 9
	fsw	ft9, 36(a2)
.Ltmp12:
	#DEBUG_VALUE: kj <- 10
	fsw	ft10, 40(a2)
.Ltmp13:
	#DEBUG_VALUE: kj <- 11
	fsw	ft11, 44(a2)
.Ltmp14:
	#DEBUG_VALUE: kj <- 12
	.loc	0 8 34                          # openblas_gepb_16x4.c:8:34
	flw	ft11, 48(a0)
	flw	ft10, 52(a0)
	flw	ft9, 56(a0)
	flw	ft8, 60(a0)
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	flw	fs0, 48(a2)
	flw	fs1, 52(a2)
	flw	fs2, 56(a2)
	flw	fs3, 60(a2)
	fmadd.s	fs0, ft11, fa7, fs0
	fmadd.s	fs1, ft10, fa7, fs1
	fmadd.s	fs2, ft9, fa7, fs2
	fmadd.s	fa7, ft8, fa7, fs3
	fsw	fs0, 48(a2)
.Ltmp15:
	#DEBUG_VALUE: kj <- 13
	fsw	fs1, 52(a2)
.Ltmp16:
	#DEBUG_VALUE: kj <- 14
	fsw	fs2, 56(a2)
.Ltmp17:
	#DEBUG_VALUE: kj <- 15
	fsw	fa7, 60(a2)
.Ltmp18:
	#DEBUG_VALUE: ki <- 1
	#DEBUG_VALUE: kj <- 16
	flw	fa7, 64(a2)
	flw	fs0, 68(a2)
	flw	fs1, 72(a2)
	flw	fs2, 76(a2)
	fmadd.s	fa7, ft4, ft7, fa7
	fmadd.s	fs0, ft3, ft7, fs0
	fmadd.s	fs1, ft2, ft7, fs1
	fmadd.s	fs2, ft5, ft7, fs2
.Ltmp19:
	.loc	0 11 1 epilogue_begin is_stmt 1 # openblas_gepb_16x4.c:11:1
	fld	fs3, 0(sp)                      # 8-byte Folded Reload
.Ltmp20:
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fa7, 64(a2)
.Ltmp21:
	#DEBUG_VALUE: kj <- 1
	fsw	fs0, 68(a2)
.Ltmp22:
	#DEBUG_VALUE: kj <- 2
	fsw	fs1, 72(a2)
.Ltmp23:
	#DEBUG_VALUE: kj <- 3
	fsw	fs2, 76(a2)
.Ltmp24:
	#DEBUG_VALUE: kj <- 4
	flw	fa7, 80(a2)
	flw	fs0, 84(a2)
	flw	fs1, 88(a2)
	flw	fs2, 92(a2)
	fmadd.s	fa7, ft1, ft7, fa7
	fmadd.s	fs0, ft0, ft7, fs0
	fmadd.s	fs1, fa0, ft7, fs1
	fmadd.s	fs2, fa1, ft7, fs2
	fsw	fa7, 80(a2)
.Ltmp25:
	#DEBUG_VALUE: kj <- 5
	fsw	fs0, 84(a2)
.Ltmp26:
	#DEBUG_VALUE: kj <- 6
	fsw	fs1, 88(a2)
.Ltmp27:
	#DEBUG_VALUE: kj <- 7
	fsw	fs2, 92(a2)
.Ltmp28:
	#DEBUG_VALUE: kj <- 8
	flw	fa7, 96(a2)
	flw	fs0, 100(a2)
	flw	fs1, 104(a2)
	flw	fs2, 108(a2)
	fmadd.s	fa7, fa2, ft7, fa7
	fmadd.s	fs0, fa3, ft7, fs0
	fmadd.s	fs1, fa4, ft7, fs1
	fmadd.s	fs2, fa5, ft7, fs2
	fsw	fa7, 96(a2)
.Ltmp29:
	#DEBUG_VALUE: kj <- 9
	fsw	fs0, 100(a2)
.Ltmp30:
	#DEBUG_VALUE: kj <- 10
	fsw	fs1, 104(a2)
.Ltmp31:
	#DEBUG_VALUE: kj <- 11
	fsw	fs2, 108(a2)
.Ltmp32:
	#DEBUG_VALUE: kj <- 12
	flw	fa7, 112(a2)
	flw	fs0, 116(a2)
	flw	fs1, 120(a2)
	flw	fs2, 124(a2)
	fmadd.s	fa7, ft11, ft7, fa7
	fmadd.s	fs0, ft10, ft7, fs0
	fmadd.s	fs1, ft9, ft7, fs1
	fmadd.s	ft7, ft8, ft7, fs2
.Ltmp33:
	.loc	0 11 1                          # openblas_gepb_16x4.c:11:1
	fld	fs2, 8(sp)                      # 8-byte Folded Reload
.Ltmp34:
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	fa7, 112(a2)
.Ltmp35:
	#DEBUG_VALUE: kj <- 13
	fsw	fs0, 116(a2)
.Ltmp36:
	#DEBUG_VALUE: kj <- 14
	fsw	fs1, 120(a2)
.Ltmp37:
	#DEBUG_VALUE: kj <- 15
	fsw	ft7, 124(a2)
.Ltmp38:
	#DEBUG_VALUE: ki <- 2
	#DEBUG_VALUE: kj <- 16
	flw	ft7, 128(a2)
	flw	fa7, 132(a2)
	flw	fs0, 136(a2)
	flw	fs1, 140(a2)
	fmadd.s	ft7, ft4, fa6, ft7
	fmadd.s	fa7, ft3, fa6, fa7
	fmadd.s	fs0, ft2, fa6, fs0
	fmadd.s	fs1, ft5, fa6, fs1
	fsw	ft7, 128(a2)
.Ltmp39:
	#DEBUG_VALUE: kj <- 1
	fsw	fa7, 132(a2)
.Ltmp40:
	#DEBUG_VALUE: kj <- 2
	fsw	fs0, 136(a2)
.Ltmp41:
	#DEBUG_VALUE: kj <- 3
	fsw	fs1, 140(a2)
.Ltmp42:
	#DEBUG_VALUE: kj <- 4
	flw	ft7, 144(a2)
	flw	fa7, 148(a2)
	flw	fs0, 152(a2)
	flw	fs1, 156(a2)
	fmadd.s	ft7, ft1, fa6, ft7
	fmadd.s	fa7, ft0, fa6, fa7
	fmadd.s	fs0, fa0, fa6, fs0
	fmadd.s	fs1, fa1, fa6, fs1
	fsw	ft7, 144(a2)
.Ltmp43:
	#DEBUG_VALUE: kj <- 5
	fsw	fa7, 148(a2)
.Ltmp44:
	#DEBUG_VALUE: kj <- 6
	fsw	fs0, 152(a2)
.Ltmp45:
	#DEBUG_VALUE: kj <- 7
	fsw	fs1, 156(a2)
.Ltmp46:
	#DEBUG_VALUE: kj <- 8
	flw	ft7, 160(a2)
	flw	fa7, 164(a2)
	flw	fs0, 168(a2)
	flw	fs1, 172(a2)
	fmadd.s	ft7, fa2, fa6, ft7
	fmadd.s	fa7, fa3, fa6, fa7
	fmadd.s	fs0, fa4, fa6, fs0
	fmadd.s	fs1, fa5, fa6, fs1
	fsw	ft7, 160(a2)
.Ltmp47:
	#DEBUG_VALUE: kj <- 9
	fsw	fa7, 164(a2)
.Ltmp48:
	#DEBUG_VALUE: kj <- 10
	fsw	fs0, 168(a2)
.Ltmp49:
	#DEBUG_VALUE: kj <- 11
	fsw	fs1, 172(a2)
.Ltmp50:
	#DEBUG_VALUE: kj <- 12
	flw	ft7, 176(a2)
	flw	fa7, 180(a2)
	flw	fs0, 184(a2)
	flw	fs1, 188(a2)
	fmadd.s	ft7, ft11, fa6, ft7
	fmadd.s	fa7, ft10, fa6, fa7
	fmadd.s	fs0, ft9, fa6, fs0
	fmadd.s	fa6, ft8, fa6, fs1
.Ltmp51:
	.loc	0 11 1                          # openblas_gepb_16x4.c:11:1
	fld	fs1, 16(sp)                     # 8-byte Folded Reload
.Ltmp52:
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	ft7, 176(a2)
.Ltmp53:
	#DEBUG_VALUE: kj <- 13
	fsw	fa7, 180(a2)
.Ltmp54:
	#DEBUG_VALUE: kj <- 14
	fsw	fs0, 184(a2)
.Ltmp55:
	#DEBUG_VALUE: kj <- 15
	fsw	fa6, 188(a2)
.Ltmp56:
	#DEBUG_VALUE: ki <- 3
	#DEBUG_VALUE: kj <- 16
	flw	ft7, 192(a2)
	flw	fa6, 196(a2)
	flw	fa7, 200(a2)
	flw	fs0, 204(a2)
	fmadd.s	ft4, ft4, ft6, ft7
	fmadd.s	ft3, ft3, ft6, fa6
	fmadd.s	ft2, ft2, ft6, fa7
	fmadd.s	ft5, ft5, ft6, fs0
.Ltmp57:
	.loc	0 11 1                          # openblas_gepb_16x4.c:11:1
	fld	fs0, 24(sp)                     # 8-byte Folded Reload
.Ltmp58:
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	fsw	ft4, 192(a2)
.Ltmp59:
	#DEBUG_VALUE: kj <- 1
	fsw	ft3, 196(a2)
.Ltmp60:
	#DEBUG_VALUE: kj <- 2
	fsw	ft2, 200(a2)
.Ltmp61:
	#DEBUG_VALUE: kj <- 3
	fsw	ft5, 204(a2)
.Ltmp62:
	#DEBUG_VALUE: kj <- 4
	flw	ft2, 208(a2)
	flw	ft3, 212(a2)
	flw	ft4, 216(a2)
	flw	ft5, 220(a2)
	fmadd.s	ft1, ft1, ft6, ft2
	fmadd.s	ft0, ft0, ft6, ft3
	fmadd.s	fa0, fa0, ft6, ft4
	fmadd.s	fa1, fa1, ft6, ft5
	fsw	ft1, 208(a2)
.Ltmp63:
	#DEBUG_VALUE: kj <- 5
	fsw	ft0, 212(a2)
.Ltmp64:
	#DEBUG_VALUE: kj <- 6
	fsw	fa0, 216(a2)
.Ltmp65:
	#DEBUG_VALUE: kj <- 7
	fsw	fa1, 220(a2)
.Ltmp66:
	#DEBUG_VALUE: kj <- 8
	flw	fa1, 224(a2)
	flw	fa0, 228(a2)
	flw	ft0, 232(a2)
	flw	ft1, 236(a2)
	fmadd.s	fa2, fa2, ft6, fa1
	fmadd.s	fa3, fa3, ft6, fa0
	fmadd.s	fa4, fa4, ft6, ft0
	fmadd.s	fa5, fa5, ft6, ft1
	fsw	fa2, 224(a2)
.Ltmp67:
	#DEBUG_VALUE: kj <- 9
	fsw	fa3, 228(a2)
.Ltmp68:
	#DEBUG_VALUE: kj <- 10
	fsw	fa4, 232(a2)
.Ltmp69:
	#DEBUG_VALUE: kj <- 11
	fsw	fa5, 236(a2)
.Ltmp70:
	#DEBUG_VALUE: kj <- 12
	flw	fa5, 240(a2)
	flw	fa4, 244(a2)
	flw	fa3, 248(a2)
	flw	fa2, 252(a2)
	fmadd.s	fa5, ft11, ft6, fa5
	fmadd.s	fa4, ft10, ft6, fa4
	fmadd.s	fa3, ft9, ft6, fa3
	fmadd.s	fa2, ft8, ft6, fa2
	fsw	fa5, 240(a2)
.Ltmp71:
	#DEBUG_VALUE: kj <- 13
	fsw	fa4, 244(a2)
.Ltmp72:
	#DEBUG_VALUE: kj <- 14
	fsw	fa3, 248(a2)
.Ltmp73:
	#DEBUG_VALUE: kj <- 15
	fsw	fa2, 252(a2)
.Ltmp74:
	#DEBUG_VALUE: ki <- 4
	#DEBUG_VALUE: kj <- 16
	.cfi_restore fs0
	.cfi_restore fs1
	.cfi_restore fs2
	.cfi_restore fs3
	.loc	0 11 1                          # openblas_gepb_16x4.c:11:1
	addi	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
.Ltmp75:
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.section	.debug_loclists,"",@progbits
	.word	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	2                               # Offset entry count
.Lloclists_table_base0:
	.word	.Ldebug_loc0-.Lloclists_table_base0
	.word	.Ldebug_loc1-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp0-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp18-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	0                               # 0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp18-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp38-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp38-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp56-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	2                               # 2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp56-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp74-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	3                               # 3
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp74-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	4                               # 4
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp2-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	0                               # 0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp4-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp4-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp5-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	2                               # 2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp5-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	3                               # 3
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	4                               # 4
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp7-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	5                               # 5
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	6                               # 6
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	7                               # 7
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp10-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp11-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp11-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp12-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	9                               # 9
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp13-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	10                              # 10
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp14-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	11                              # 11
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp14-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp15-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	12                              # 12
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp15-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp16-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	13                              # 13
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp16-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp17-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	14                              # 14
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp17-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp18-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	15                              # 15
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp18-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp21-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	16                              # 16
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp21-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp22-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp22-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp23-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	2                               # 2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp23-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp24-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	3                               # 3
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp24-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp25-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	4                               # 4
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp25-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp26-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	5                               # 5
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp26-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp27-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	6                               # 6
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp27-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp28-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	7                               # 7
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp28-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp29-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp29-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp30-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	9                               # 9
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp30-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp31-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	10                              # 10
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp31-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp32-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	11                              # 11
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp32-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp35-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	12                              # 12
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp35-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp36-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	13                              # 13
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp36-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp37-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	14                              # 14
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp37-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp38-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	15                              # 15
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp38-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp39-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	16                              # 16
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp39-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp40-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp40-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp41-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	2                               # 2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp41-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp42-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	3                               # 3
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp42-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp43-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	4                               # 4
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp43-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp44-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	5                               # 5
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp44-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp45-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	6                               # 6
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp45-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp46-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	7                               # 7
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp46-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp47-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp47-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp48-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	9                               # 9
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp48-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp49-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	10                              # 10
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp49-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp50-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	11                              # 11
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp50-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp53-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	12                              # 12
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp53-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp54-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	13                              # 13
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp54-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp55-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	14                              # 14
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp55-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp56-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	15                              # 15
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp56-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp59-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	16                              # 16
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp59-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp60-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp60-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp61-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	2                               # 2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp61-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp62-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	3                               # 3
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp62-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp63-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	4                               # 4
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp63-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp64-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	5                               # 5
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp64-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp65-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	6                               # 6
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp65-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp66-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	7                               # 7
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp66-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp67-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp67-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp68-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	9                               # 9
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp68-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp69-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	10                              # 10
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp69-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp70-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	11                              # 11
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp70-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp71-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	12                              # 12
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp71-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp72-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	13                              # 13
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp72-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp73-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	14                              # 14
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp73-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp74-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	15                              # 15
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp74-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	16                              # 16
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_list_header_end0:
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	37                              # DW_FORM_strx1
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	114                             # DW_AT_str_offsets_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	37                              # DW_FORM_strx1
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	115                             # DW_AT_addr_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	116                             # DW_AT_rnglists_base
	.byte	23                              # DW_FORM_sec_offset
	.ascii	"\214\001"                      # DW_AT_loclists_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	122                             # DW_AT_call_all_calls
	.byte	25                              # DW_FORM_flag_present
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	85                              # DW_AT_ranges
	.byte	35                              # DW_FORM_rnglistx
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	55                              # DW_TAG_restrict_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.word	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.half	5                               # DWARF version number
	.byte	1                               # DWARF Unit Type
	.byte	8                               # Address Size (in bytes)
	.word	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	1                               # Abbrev [1] 0xc:0x83 DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.half	29                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.word	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.word	.Laddr_table_base0              # DW_AT_addr_base
	.word	.Lrnglists_table_base0          # DW_AT_rnglists_base
	.word	.Lloclists_table_base0          # DW_AT_loclists_base
	.byte	2                               # Abbrev [2] 0x2b:0x42 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x36:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	90
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	109                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x40:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	91
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	109                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x4a:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	92
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	128                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x54:0x18 DW_TAG_lexical_block
	.byte	0                               # DW_AT_ranges
	.byte	5                               # Abbrev [5] 0x56:0x9 DW_TAG_variable
	.byte	0                               # DW_AT_location
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.word	138                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x5f:0xc DW_TAG_lexical_block
	.byte	0                               # DW_AT_ranges
	.byte	5                               # Abbrev [5] 0x61:0x9 DW_TAG_variable
	.byte	1                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.word	138                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x6d:0x5 DW_TAG_restrict_type
	.word	114                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x72:0x5 DW_TAG_pointer_type
	.word	119                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x77:0x5 DW_TAG_const_type
	.word	124                             # DW_AT_type
	.byte	9                               # Abbrev [9] 0x7c:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	6                               # Abbrev [6] 0x80:0x5 DW_TAG_restrict_type
	.word	133                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x85:0x5 DW_TAG_pointer_type
	.word	124                             # DW_AT_type
	.byte	9                               # Abbrev [9] 0x8a:0x4 DW_TAG_base_type
	.byte	9                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_rnglists,"",@progbits
	.word	.Ldebug_list_header_end1-.Ldebug_list_header_start1 # Length
.Ldebug_list_header_start1:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	1                               # Offset entry count
.Lrnglists_table_base0:
	.word	.Ldebug_ranges0-.Lrnglists_table_base0
.Ldebug_ranges0:
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp1-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp19-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp20-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp33-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp34-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp51-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp52-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp57-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp58-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp74-.Lfunc_begin0          #   ending offset
	.byte	0                               # DW_RLE_end_of_list
.Ldebug_list_header_end1:
	.section	.debug_str_offsets,"",@progbits
	.word	48                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"openblas_gepb_16x4.c"          # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=129
.Linfo_string3:
	.asciz	"test"                          # string offset=176
.Linfo_string4:
	.asciz	"A"                             # string offset=181
.Linfo_string5:
	.asciz	"float"                         # string offset=183
.Linfo_string6:
	.asciz	"B"                             # string offset=189
.Linfo_string7:
	.asciz	"C"                             # string offset=191
.Linfo_string8:
	.asciz	"ki"                            # string offset=193
.Linfo_string9:
	.asciz	"int"                           # string offset=196
.Linfo_string10:
	.asciz	"kj"                            # string offset=200
	.section	.debug_str_offsets,"",@progbits
	.word	.Linfo_string0
	.word	.Linfo_string1
	.word	.Linfo_string2
	.word	.Linfo_string3
	.word	.Linfo_string4
	.word	.Linfo_string5
	.word	.Linfo_string6
	.word	.Linfo_string7
	.word	.Linfo_string8
	.word	.Linfo_string9
	.word	.Linfo_string10
	.section	.debug_addr,"",@progbits
	.word	.Ldebug_addr_end0-.Ldebug_addr_start0 # Length of contribution
.Ldebug_addr_start0:
	.half	5                               # DWARF version number
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
.Laddr_table_base0:
	.quad	.Lfunc_begin0
.Ldebug_addr_end0:
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
