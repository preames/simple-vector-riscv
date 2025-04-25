	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"riscv_vspec_example_a5.c"
	.text
	.globl	saxpy                           # -- Begin function saxpy
	.p2align	1
	.type	saxpy,@function
saxpy:                                  # @saxpy
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "riscv_vspec_example_a5.c" md5 0xba6b96ab101e730324eb097b45ae3b3b
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: saxpy:n <- $x10
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:x <- $x11
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:i <- 0
	.loc	0 6 3 prologue_end              # riscv_vspec_example_a5.c:6:3
	blez	a0, .LBB0_5
.Ltmp0:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: saxpy:i <- 0
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:x <- $x11
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:n <- $x10
	andi	a6, a0, 7
	srli	a3, a0, 3
	beqz	a3, .LBB0_6
.Ltmp1:
# %bb.2:                                # %for.body.preheader.new
	#DEBUG_VALUE: saxpy:i <- 0
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:x <- $x11
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:n <- $x10
	slli	a3, a3, 4
	li	a0, 0
.Ltmp2:
	addi	a5, a2, 16
	srli	a3, a3, 1
	neg	a4, a3
	addi	a3, a1, 16
.Ltmp3:
.LBB0_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:x <- $x11
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_stack_value] $x10
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	flw	fa5, -16(a3)
.Ltmp4:
	.loc	0 6 3                           # riscv_vspec_example_a5.c:6:3
	addi	a0, a0, -8
.Ltmp5:
	.loc	0 7 23                          # riscv_vspec_example_a5.c:7:23
	flw	fa4, -16(a5)
	flw	fa3, -12(a5)
	flw	fa2, -8(a5)
	flw	fa1, -4(a5)
	.loc	0 7 21 is_stmt 0                # riscv_vspec_example_a5.c:7:21
	fmadd.s	fa5, fa0, fa5, fa4
	.loc	0 7 23                          # riscv_vspec_example_a5.c:7:23
	flw	fa4, 0(a5)
	.loc	0 7 10                          # riscv_vspec_example_a5.c:7:10
	fsw	fa5, -16(a5)
.Ltmp6:
	#DEBUG_VALUE: saxpy:i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $x10
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	flw	fa5, -12(a3)
	.loc	0 7 21                          # riscv_vspec_example_a5.c:7:21
	fmadd.s	fa5, fa0, fa5, fa3
	.loc	0 7 23                          # riscv_vspec_example_a5.c:7:23
	flw	fa3, 4(a5)
	.loc	0 7 10                          # riscv_vspec_example_a5.c:7:10
	fsw	fa5, -12(a5)
.Ltmp7:
	#DEBUG_VALUE: saxpy:i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 2, DW_OP_plus, DW_OP_stack_value] $x10
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	flw	fa5, -8(a3)
	.loc	0 7 21                          # riscv_vspec_example_a5.c:7:21
	fmadd.s	fa5, fa0, fa5, fa2
	.loc	0 7 23                          # riscv_vspec_example_a5.c:7:23
	flw	fa2, 8(a5)
	.loc	0 7 10                          # riscv_vspec_example_a5.c:7:10
	fsw	fa5, -8(a5)
.Ltmp8:
	#DEBUG_VALUE: saxpy:i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 3, DW_OP_plus, DW_OP_stack_value] $x10
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	flw	fa5, -4(a3)
	.loc	0 7 21                          # riscv_vspec_example_a5.c:7:21
	fmadd.s	fa5, fa0, fa5, fa1
	.loc	0 7 23                          # riscv_vspec_example_a5.c:7:23
	flw	fa1, 12(a5)
	.loc	0 7 10                          # riscv_vspec_example_a5.c:7:10
	fsw	fa5, -4(a5)
.Ltmp9:
	#DEBUG_VALUE: saxpy:i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 4, DW_OP_plus, DW_OP_stack_value] $x10
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	flw	fa5, 0(a3)
	.loc	0 7 21                          # riscv_vspec_example_a5.c:7:21
	fmadd.s	fa5, fa0, fa5, fa4
	.loc	0 7 10                          # riscv_vspec_example_a5.c:7:10
	fsw	fa5, 0(a5)
.Ltmp10:
	#DEBUG_VALUE: saxpy:i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 5, DW_OP_plus, DW_OP_stack_value] $x10
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	flw	fa5, 4(a3)
	.loc	0 7 21                          # riscv_vspec_example_a5.c:7:21
	fmadd.s	fa5, fa0, fa5, fa3
	.loc	0 7 10                          # riscv_vspec_example_a5.c:7:10
	fsw	fa5, 4(a5)
.Ltmp11:
	#DEBUG_VALUE: saxpy:i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 6, DW_OP_plus, DW_OP_stack_value] $x10
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	flw	fa5, 8(a3)
	.loc	0 7 21                          # riscv_vspec_example_a5.c:7:21
	fmadd.s	fa5, fa0, fa5, fa2
	.loc	0 7 10                          # riscv_vspec_example_a5.c:7:10
	fsw	fa5, 8(a5)
.Ltmp12:
	#DEBUG_VALUE: saxpy:i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 7, DW_OP_plus, DW_OP_stack_value] $x10
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	flw	fa5, 12(a3)
.Ltmp13:
	.loc	0 6 3 is_stmt 1                 # riscv_vspec_example_a5.c:6:3
	addi	a3, a3, 32
.Ltmp14:
	.loc	0 7 21                          # riscv_vspec_example_a5.c:7:21
	fmadd.s	fa5, fa0, fa5, fa1
	.loc	0 7 10 is_stmt 0                # riscv_vspec_example_a5.c:7:10
	fsw	fa5, 12(a5)
.Ltmp15:
	#DEBUG_VALUE: saxpy:i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 8, DW_OP_plus, DW_OP_stack_value] $x10
	.loc	0 6 3 is_stmt 1                 # riscv_vspec_example_a5.c:6:3
	addi	a5, a5, 32
	bne	a4, a0, .LBB0_3
.Ltmp16:
# %bb.4:                                # %for.end.loopexit.unr-lcssa.loopexit
	#DEBUG_VALUE: saxpy:i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 8, DW_OP_plus, DW_OP_stack_value] $x10
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:x <- $x11
	#DEBUG_VALUE: saxpy:a <- $f10_f
	neg	a0, a0
.Ltmp17:
	bnez	a6, .LBB0_7
.Ltmp18:
.LBB0_5:                                # %for.end
	#DEBUG_VALUE: saxpy:a <- $f10_f
	.loc	0 8 1                           # riscv_vspec_example_a5.c:8:1
	ret
.Ltmp19:
.LBB0_6:
	#DEBUG_VALUE: saxpy:i <- 0
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:x <- $x11
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:n <- $x10
	.loc	0 0 1 is_stmt 0                 # riscv_vspec_example_a5.c:0:1
	li	a0, 0
.Ltmp20:
	.loc	0 6 3 is_stmt 1                 # riscv_vspec_example_a5.c:6:3
	beqz	a6, .LBB0_5
.Ltmp21:
.LBB0_7:                                # %for.body.epil
	#DEBUG_VALUE: saxpy:y <- $x12
	#DEBUG_VALUE: saxpy:x <- $x11
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:i <- $x10
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	sh2add	a1, a0, a1
.Ltmp22:
	.loc	0 7 23 is_stmt 0                # riscv_vspec_example_a5.c:7:23
	sh2add	a0, a0, a2
.Ltmp23:
	.loc	0 0 23                          # riscv_vspec_example_a5.c:0:23
	li	a2, 1
.Ltmp24:
	#DEBUG_VALUE: saxpy:i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	flw	fa5, 0(a1)
	.loc	0 7 23                          # riscv_vspec_example_a5.c:7:23
	flw	fa4, 0(a0)
	.loc	0 7 21                          # riscv_vspec_example_a5.c:7:21
	fmadd.s	fa5, fa0, fa5, fa4
	.loc	0 7 10                          # riscv_vspec_example_a5.c:7:10
	fsw	fa5, 0(a0)
.Ltmp25:
	.loc	0 6 3 is_stmt 1                 # riscv_vspec_example_a5.c:6:3
	beq	a6, a2, .LBB0_5
.Ltmp26:
# %bb.8:                                # %for.body.epil.1
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:i <- undef
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	flw	fa5, 4(a1)
	li	a2, 2
.Ltmp27:
	#DEBUG_VALUE: saxpy:i <- [DW_OP_plus_uconst 2, DW_OP_stack_value] undef
	.loc	0 7 23 is_stmt 0                # riscv_vspec_example_a5.c:7:23
	flw	fa4, 4(a0)
	.loc	0 7 21                          # riscv_vspec_example_a5.c:7:21
	fmadd.s	fa5, fa0, fa5, fa4
	.loc	0 7 10                          # riscv_vspec_example_a5.c:7:10
	fsw	fa5, 4(a0)
.Ltmp28:
	.loc	0 6 3 is_stmt 1                 # riscv_vspec_example_a5.c:6:3
	beq	a6, a2, .LBB0_5
.Ltmp29:
# %bb.9:                                # %for.body.epil.2
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:i <- undef
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	flw	fa5, 8(a1)
	li	a2, 3
.Ltmp30:
	#DEBUG_VALUE: saxpy:i <- [DW_OP_plus_uconst 3, DW_OP_stack_value] undef
	.loc	0 7 23 is_stmt 0                # riscv_vspec_example_a5.c:7:23
	flw	fa4, 8(a0)
	.loc	0 7 21                          # riscv_vspec_example_a5.c:7:21
	fmadd.s	fa5, fa0, fa5, fa4
	.loc	0 7 10                          # riscv_vspec_example_a5.c:7:10
	fsw	fa5, 8(a0)
.Ltmp31:
	.loc	0 6 3 is_stmt 1                 # riscv_vspec_example_a5.c:6:3
	beq	a6, a2, .LBB0_5
.Ltmp32:
# %bb.10:                               # %for.body.epil.3
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:i <- undef
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	flw	fa5, 12(a1)
	li	a2, 4
.Ltmp33:
	#DEBUG_VALUE: saxpy:i <- [DW_OP_plus_uconst 4, DW_OP_stack_value] undef
	.loc	0 7 23 is_stmt 0                # riscv_vspec_example_a5.c:7:23
	flw	fa4, 12(a0)
	.loc	0 7 21                          # riscv_vspec_example_a5.c:7:21
	fmadd.s	fa5, fa0, fa5, fa4
	.loc	0 7 10                          # riscv_vspec_example_a5.c:7:10
	fsw	fa5, 12(a0)
.Ltmp34:
	.loc	0 6 3 is_stmt 1                 # riscv_vspec_example_a5.c:6:3
	beq	a6, a2, .LBB0_5
.Ltmp35:
# %bb.11:                               # %for.body.epil.4
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:i <- undef
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	flw	fa5, 16(a1)
	li	a2, 5
.Ltmp36:
	#DEBUG_VALUE: saxpy:i <- [DW_OP_plus_uconst 5, DW_OP_stack_value] undef
	.loc	0 7 23 is_stmt 0                # riscv_vspec_example_a5.c:7:23
	flw	fa4, 16(a0)
	.loc	0 7 21                          # riscv_vspec_example_a5.c:7:21
	fmadd.s	fa5, fa0, fa5, fa4
	.loc	0 7 10                          # riscv_vspec_example_a5.c:7:10
	fsw	fa5, 16(a0)
.Ltmp37:
	.loc	0 6 3 is_stmt 1                 # riscv_vspec_example_a5.c:6:3
	beq	a6, a2, .LBB0_5
.Ltmp38:
# %bb.12:                               # %for.body.epil.5
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:i <- undef
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	flw	fa5, 20(a1)
	li	a2, 6
.Ltmp39:
	#DEBUG_VALUE: saxpy:i <- [DW_OP_plus_uconst 6, DW_OP_stack_value] undef
	.loc	0 7 23 is_stmt 0                # riscv_vspec_example_a5.c:7:23
	flw	fa4, 20(a0)
	.loc	0 7 21                          # riscv_vspec_example_a5.c:7:21
	fmadd.s	fa5, fa0, fa5, fa4
	.loc	0 7 10                          # riscv_vspec_example_a5.c:7:10
	fsw	fa5, 20(a0)
.Ltmp40:
	.loc	0 6 3 is_stmt 1                 # riscv_vspec_example_a5.c:6:3
	beq	a6, a2, .LBB0_5
.Ltmp41:
# %bb.13:                               # %for.body.epil.6
	#DEBUG_VALUE: saxpy:a <- $f10_f
	#DEBUG_VALUE: saxpy:i <- undef
	.loc	0 7 16                          # riscv_vspec_example_a5.c:7:16
	flw	fa5, 24(a1)
	.loc	0 7 23 is_stmt 0                # riscv_vspec_example_a5.c:7:23
	flw	fa4, 24(a0)
	.loc	0 7 21                          # riscv_vspec_example_a5.c:7:21
	fmadd.s	fa5, fa0, fa5, fa4
	.loc	0 7 10                          # riscv_vspec_example_a5.c:7:10
	fsw	fa5, 24(a0)
.Ltmp42:
	#DEBUG_VALUE: saxpy:i <- [DW_OP_plus_uconst 7, DW_OP_stack_value] undef
	.loc	0 8 1 is_stmt 1                 # riscv_vspec_example_a5.c:8:1
	ret
.Ltmp43:
.Lfunc_end0:
	.size	saxpy, .Lfunc_end0-saxpy
	.cfi_endproc
                                        # -- End function
	.section	.debug_loclists,"",@progbits
	.word	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	4                               # Offset entry count
.Lloclists_table_base0:
	.word	.Ldebug_loc0-.Lloclists_table_base0
	.word	.Ldebug_loc1-.Lloclists_table_base0
	.word	.Ldebug_loc2-.Lloclists_table_base0
	.word	.Ldebug_loc3-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp19-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp20-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp18-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp19-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp22-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp18-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp19-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp24-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	0                               # 0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp5-.Lfunc_begin0           #   ending offset
	.byte	9                               # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	12                              # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp7-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	12                              # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	2                               # 2
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	12                              # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	3                               # 3
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	4                               # 4
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp10-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp11-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	5                               # 5
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp11-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp12-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	6                               # 6
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp15-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	7                               # 7
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp15-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp17-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	34                              # DW_OP_plus
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp19-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp21-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	0                               # 0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp21-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp23-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
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
	.byte	4                               # Abbreviation Code
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
	.byte	7                               # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
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
	.byte	1                               # Abbrev [1] 0xc:0x6e DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.half	29                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.word	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.word	.Laddr_table_base0              # DW_AT_addr_base
	.word	.Lloclists_table_base0          # DW_AT_loclists_base
	.byte	2                               # Abbrev [2] 0x27:0x3b DW_TAG_subprogram
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
	.byte	3                               # Abbrev [3] 0x32:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	98                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0x3b:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	144
	.byte	42
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	102                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x46:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	111                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x4f:0x9 DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	116                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x58:0x9 DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	98                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x62:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x66:0x5 DW_TAG_const_type
	.word	107                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x6b:0x4 DW_TAG_base_type
	.byte	7                               # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x6f:0x5 DW_TAG_pointer_type
	.word	102                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x74:0x5 DW_TAG_pointer_type
	.word	107                             # DW_AT_type
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.word	48                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"riscv_vspec_example_a5.c"      # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=133
.Linfo_string3:
	.asciz	"saxpy"                         # string offset=180
.Linfo_string4:
	.asciz	"n"                             # string offset=186
.Linfo_string5:
	.asciz	"long"                          # string offset=188
.Linfo_string6:
	.asciz	"a"                             # string offset=193
.Linfo_string7:
	.asciz	"float"                         # string offset=195
.Linfo_string8:
	.asciz	"x"                             # string offset=201
.Linfo_string9:
	.asciz	"y"                             # string offset=203
.Linfo_string10:
	.asciz	"i"                             # string offset=205
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
