	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"dotproduct_i32.c"
	.text
	.globl	dotproduct_i32                  # -- Begin function dotproduct_i32
	.p2align	1
	.type	dotproduct_i32,@function
dotproduct_i32:                         # @dotproduct_i32
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "dotproduct_i32.c" md5 0xa688ea1622d8ab832b775b7ef22f9fc7
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: dotproduct_i32:len <- $x10
	#DEBUG_VALUE: dotproduct_i32:a <- $x11
	#DEBUG_VALUE: dotproduct_i32:b <- $x12
	#DEBUG_VALUE: dotproduct_i32:res <- 0
	#DEBUG_VALUE: i <- 0
	.loc	0 5 3 prologue_end              # dotproduct_i32.c:5:3
	beqz	a0, .LBB0_4
.Ltmp0:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: dotproduct_i32:res <- 0
	#DEBUG_VALUE: dotproduct_i32:b <- $x12
	#DEBUG_VALUE: dotproduct_i32:a <- $x11
	#DEBUG_VALUE: dotproduct_i32:len <- $x10
	andi	a6, a0, 7
	li	a3, 8
	bgeu	a0, a3, .LBB0_5
.Ltmp1:
# %bb.2:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: dotproduct_i32:res <- 0
	#DEBUG_VALUE: dotproduct_i32:b <- $x12
	#DEBUG_VALUE: dotproduct_i32:a <- $x11
	#DEBUG_VALUE: dotproduct_i32:len <- $x10
	.loc	0 0 3 is_stmt 0                 # dotproduct_i32.c:0:3
	li	a3, 0
	li	t0, 0
	.loc	0 5 3                           # dotproduct_i32.c:5:3
	bnez	a6, .LBB0_8
.Ltmp2:
.LBB0_3:                                # %for.cond.cleanup
	.loc	0 7 3 is_stmt 1                 # dotproduct_i32.c:7:3
	sext.w	a0, t0
	ret
.LBB0_4:
.Ltmp3:
	#DEBUG_VALUE: dotproduct_i32:res <- 0
	#DEBUG_VALUE: dotproduct_i32:b <- $x12
	#DEBUG_VALUE: dotproduct_i32:a <- $x11
	#DEBUG_VALUE: dotproduct_i32:len <- $x10
	.loc	0 7 3                           # dotproduct_i32.c:7:3
	li	a0, 0
.Ltmp4:
	ret
.Ltmp5:
.LBB0_5:                                # %for.body.preheader.new
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: dotproduct_i32:res <- 0
	#DEBUG_VALUE: dotproduct_i32:b <- $x12
	#DEBUG_VALUE: dotproduct_i32:a <- $x11
	#DEBUG_VALUE: dotproduct_i32:len <- $x10
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sd	s0, 8(sp)                       # 8-byte Folded Spill
	sd	s1, 0(sp)                       # 8-byte Folded Spill
	.cfi_offset s0, -8
	.cfi_offset s1, -16
.Ltmp6:
	.loc	0 5 0                           # dotproduct_i32.c:5
	zext.w	a0, a0
.Ltmp7:
	.loc	0 0 0 is_stmt 0                 # dotproduct_i32.c:0:0
	li	t5, 0
	li	t0, 0
	.loc	0 5 3                           # dotproduct_i32.c:5:3
	andi	a0, a0, -8
	addi	a3, a2, 16
	neg	a7, a0
	addi	a0, a1, 16
.Ltmp8:
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: dotproduct_i32:b <- $x12
	#DEBUG_VALUE: dotproduct_i32:a <- $x11
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_stack_value] $x30
	.loc	0 6 12 is_stmt 1                # dotproduct_i32.c:6:12
	lw	t1, -16(a0)
	lw	t2, -12(a0)
	lw	t3, -8(a0)
	lw	t4, -4(a0)
.Ltmp9:
	.loc	0 5 3                           # dotproduct_i32.c:5:3
	addi	t5, t5, -8
.Ltmp10:
	.loc	0 6 19                          # dotproduct_i32.c:6:19
	lw	a4, -16(a3)
	lw	a5, -12(a3)
	lw	t6, -8(a3)
	lw	s0, -4(a3)
	.loc	0 6 17 is_stmt 0                # dotproduct_i32.c:6:17
	mul	t1, a4, t1
	mul	a5, a5, t2
.Ltmp11:
	#DEBUG_VALUE: dotproduct_i32:res <- undef
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 2, DW_OP_plus, DW_OP_stack_value] $x30
	mul	a4, t6, t3
	mul	t2, s0, t4
.Ltmp12:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 4, DW_OP_plus, DW_OP_stack_value] $x30
	.loc	0 6 9                           # dotproduct_i32.c:6:9
	add	t0, t0, t1
.Ltmp13:
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $x30
	add	a4, a4, a5
	add	t0, t0, a4
.Ltmp14:
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 3, DW_OP_plus, DW_OP_stack_value] $x30
	.loc	0 6 12                          # dotproduct_i32.c:6:12
	lw	t1, 0(a0)
	lw	t3, 4(a0)
	lw	t4, 8(a0)
	lw	t6, 12(a0)
.Ltmp15:
	.loc	0 5 3 is_stmt 1                 # dotproduct_i32.c:5:3
	addi	a0, a0, 32
.Ltmp16:
	.loc	0 6 19                          # dotproduct_i32.c:6:19
	lw	a4, 0(a3)
	lw	s0, 4(a3)
	lw	a5, 8(a3)
	lw	s1, 12(a3)
.Ltmp17:
	.loc	0 5 3                           # dotproduct_i32.c:5:3
	addi	a3, a3, 32
.Ltmp18:
	.loc	0 6 17                          # dotproduct_i32.c:6:17
	mul	a4, a4, t1
	mul	s0, s0, t3
	mul	a5, a5, t4
.Ltmp19:
	#DEBUG_VALUE: dotproduct_i32:res <- undef
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 7, DW_OP_plus, DW_OP_stack_value] $x30
	mul	s1, s1, t6
	.loc	0 6 9 is_stmt 0                 # dotproduct_i32.c:6:9
	add	a4, a4, t2
	#DEBUG_VALUE: dotproduct_i32:res <- undef
.Ltmp20:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 5, DW_OP_plus, DW_OP_stack_value] $x30
	add	a5, a5, s1
	add	a4, a4, s0
	add	a4, a4, t0
.Ltmp21:
	#DEBUG_VALUE: dotproduct_i32:res <- $x14
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 6, DW_OP_plus, DW_OP_stack_value] $x30
	add	t0, a5, a4
.Ltmp22:
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 8, DW_OP_plus, DW_OP_stack_value] $x30
	.loc	0 5 3 is_stmt 1                 # dotproduct_i32.c:5:3
	bne	a7, t5, .LBB0_6
.Ltmp23:
# %bb.7:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 8, DW_OP_plus, DW_OP_stack_value] $x30
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: dotproduct_i32:b <- $x12
	#DEBUG_VALUE: dotproduct_i32:a <- $x11
	.loc	0 0 3 is_stmt 0                 # dotproduct_i32.c:0:3
	ld	s0, 8(sp)                       # 8-byte Folded Reload
	.loc	0 5 3                           # dotproduct_i32.c:5:3
	neg	a3, t5
	ld	s1, 0(sp)                       # 8-byte Folded Reload
	.cfi_restore s0
	.cfi_restore s1
	addi	sp, sp, 16
	.cfi_def_cfa_offset 0
	beqz	a6, .LBB0_3
.Ltmp24:
.LBB0_8:                                # %for.body.epil
	#DEBUG_VALUE: dotproduct_i32:b <- $x12
	#DEBUG_VALUE: dotproduct_i32:a <- $x11
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: i <- $x13
	.loc	0 6 12 is_stmt 1                # dotproduct_i32.c:6:12
	sh2add	a0, a3, a1
	.loc	0 6 19 is_stmt 0                # dotproduct_i32.c:6:19
	sh2add	a1, a3, a2
.Ltmp25:
	.loc	0 6 12                          # dotproduct_i32.c:6:12
	lw	a5, 0(a0)
	.loc	0 6 19                          # dotproduct_i32.c:6:19
	lw	a2, 0(a1)
.Ltmp26:
	.loc	0 6 17                          # dotproduct_i32.c:6:17
	mul	a2, a2, a5
	.loc	0 6 9                           # dotproduct_i32.c:6:9
	add	t0, t0, a2
.Ltmp27:
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	.loc	0 0 9                           # dotproduct_i32.c:0:9
	li	a2, 1
.Ltmp28:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	.loc	0 5 3 is_stmt 1                 # dotproduct_i32.c:5:3
	beq	a6, a2, .LBB0_3
.Ltmp29:
# %bb.9:                                # %for.body.epil.1
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: i <- undef
	.loc	0 6 12                          # dotproduct_i32.c:6:12
	lw	a2, 4(a0)
	.loc	0 6 19 is_stmt 0                # dotproduct_i32.c:6:19
	lw	a3, 4(a1)
	.loc	0 6 17                          # dotproduct_i32.c:6:17
	mul	a2, a3, a2
	.loc	0 6 9                           # dotproduct_i32.c:6:9
	add	t0, t0, a2
.Ltmp30:
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	.loc	0 0 9                           # dotproduct_i32.c:0:9
	li	a2, 2
.Ltmp31:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 2, DW_OP_stack_value] undef
	.loc	0 5 3 is_stmt 1                 # dotproduct_i32.c:5:3
	beq	a6, a2, .LBB0_3
.Ltmp32:
# %bb.10:                               # %for.body.epil.2
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: i <- undef
	.loc	0 6 12                          # dotproduct_i32.c:6:12
	lw	a2, 8(a0)
	.loc	0 6 19 is_stmt 0                # dotproduct_i32.c:6:19
	lw	a3, 8(a1)
	.loc	0 6 17                          # dotproduct_i32.c:6:17
	mul	a2, a3, a2
	.loc	0 6 9                           # dotproduct_i32.c:6:9
	add	t0, t0, a2
.Ltmp33:
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	.loc	0 0 9                           # dotproduct_i32.c:0:9
	li	a2, 3
.Ltmp34:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 3, DW_OP_stack_value] undef
	.loc	0 5 3 is_stmt 1                 # dotproduct_i32.c:5:3
	beq	a6, a2, .LBB0_3
.Ltmp35:
# %bb.11:                               # %for.body.epil.3
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: i <- undef
	.loc	0 6 12                          # dotproduct_i32.c:6:12
	lw	a2, 12(a0)
	.loc	0 6 19 is_stmt 0                # dotproduct_i32.c:6:19
	lw	a3, 12(a1)
	.loc	0 6 17                          # dotproduct_i32.c:6:17
	mul	a2, a3, a2
	.loc	0 6 9                           # dotproduct_i32.c:6:9
	add	t0, t0, a2
.Ltmp36:
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	.loc	0 0 9                           # dotproduct_i32.c:0:9
	li	a2, 4
.Ltmp37:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 4, DW_OP_stack_value] undef
	.loc	0 5 3 is_stmt 1                 # dotproduct_i32.c:5:3
	beq	a6, a2, .LBB0_3
.Ltmp38:
# %bb.12:                               # %for.body.epil.4
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: i <- undef
	.loc	0 6 12                          # dotproduct_i32.c:6:12
	lw	a2, 16(a0)
	.loc	0 6 19 is_stmt 0                # dotproduct_i32.c:6:19
	lw	a3, 16(a1)
	.loc	0 6 17                          # dotproduct_i32.c:6:17
	mul	a2, a3, a2
	.loc	0 6 9                           # dotproduct_i32.c:6:9
	add	t0, t0, a2
.Ltmp39:
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	.loc	0 0 9                           # dotproduct_i32.c:0:9
	li	a2, 5
.Ltmp40:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 5, DW_OP_stack_value] undef
	.loc	0 5 3 is_stmt 1                 # dotproduct_i32.c:5:3
	beq	a6, a2, .LBB0_3
.Ltmp41:
# %bb.13:                               # %for.body.epil.5
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: i <- undef
	.loc	0 6 12                          # dotproduct_i32.c:6:12
	lw	a2, 20(a0)
	.loc	0 6 19 is_stmt 0                # dotproduct_i32.c:6:19
	lw	a3, 20(a1)
	.loc	0 6 17                          # dotproduct_i32.c:6:17
	mul	a2, a3, a2
	.loc	0 6 9                           # dotproduct_i32.c:6:9
	add	t0, t0, a2
.Ltmp42:
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	.loc	0 0 9                           # dotproduct_i32.c:0:9
	li	a2, 6
.Ltmp43:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 6, DW_OP_stack_value] undef
	.loc	0 5 3 is_stmt 1                 # dotproduct_i32.c:5:3
	beq	a6, a2, .LBB0_3
.Ltmp44:
# %bb.14:                               # %for.body.epil.6
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: dotproduct_i32:res <- $x5
	#DEBUG_VALUE: i <- undef
	.loc	0 6 12                          # dotproduct_i32.c:6:12
	lw	a0, 24(a0)
	.loc	0 6 19 is_stmt 0                # dotproduct_i32.c:6:19
	lw	a1, 24(a1)
	.loc	0 6 17                          # dotproduct_i32.c:6:17
	mul	a0, a1, a0
	.loc	0 6 9                           # dotproduct_i32.c:6:9
	add	t0, t0, a0
.Ltmp45:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 7, DW_OP_stack_value] undef
	.loc	0 7 3 is_stmt 1                 # dotproduct_i32.c:7:3
	sext.w	a0, t0
	ret
.Ltmp46:
.Lfunc_end0:
	.size	dotproduct_i32, .Lfunc_end0-dotproduct_i32
	.cfi_endproc
                                        # -- End function
	.section	.debug_loclists,"",@progbits
	.word	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	5                               # Offset entry count
.Lloclists_table_base0:
	.word	.Ldebug_loc0-.Lloclists_table_base0
	.word	.Ldebug_loc1-.Lloclists_table_base0
	.word	.Ldebug_loc2-.Lloclists_table_base0
	.word	.Ldebug_loc3-.Lloclists_table_base0
	.word	.Ldebug_loc4-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp4-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp5-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp25-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp26-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	0                               # 0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	0                               # 0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp11-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp19-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp21-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp22-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp22-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp45-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc4:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp5-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	9                               # Loc expr size
	.byte	142                             # DW_OP_breg30
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp11-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp12-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	142                             # DW_OP_breg30
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
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp13-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	142                             # DW_OP_breg30
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
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp14-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	142                             # DW_OP_breg30
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
	.uleb128 .Ltmp14-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp19-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	142                             # DW_OP_breg30
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
	.uleb128 .Ltmp19-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp20-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	142                             # DW_OP_breg30
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
	.uleb128 .Ltmp20-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp21-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	142                             # DW_OP_breg30
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
	.uleb128 .Ltmp21-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp22-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	142                             # DW_OP_breg30
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
	.uleb128 .Ltmp22-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp24-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	142                             # DW_OP_breg30
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
	.uleb128 .Ltmp24-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp28-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
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
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
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
	.byte	5                               # Abbreviation Code
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	85                              # DW_AT_ranges
	.byte	35                              # DW_FORM_rnglistx
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
	.byte	1                               # Abbrev [1] 0xc:0x6d DW_TAG_compile_unit
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
	.byte	2                               # Abbrev [2] 0x2b:0x40 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	107                             # DW_AT_type
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x3a:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	5                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	111                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x43:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	115                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x4c:0x9 DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	115                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x55:0x9 DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	107                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x5e:0xc DW_TAG_lexical_block
	.byte	0                               # DW_AT_ranges
	.byte	4                               # Abbrev [4] 0x60:0x9 DW_TAG_variable
	.byte	4                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	111                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x6b:0x4 DW_TAG_base_type
	.byte	4                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	6                               # Abbrev [6] 0x6f:0x4 DW_TAG_base_type
	.byte	6                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x73:0x5 DW_TAG_pointer_type
	.word	107                             # DW_AT_type
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
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp45-.Lfunc_begin0          #   ending offset
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
	.asciz	"dotproduct_i32.c"              # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=125
.Linfo_string3:
	.asciz	"dotproduct_i32"                # string offset=172
.Linfo_string4:
	.asciz	"int"                           # string offset=187
.Linfo_string5:
	.asciz	"len"                           # string offset=191
.Linfo_string6:
	.asciz	"unsigned int"                  # string offset=195
.Linfo_string7:
	.asciz	"a"                             # string offset=208
.Linfo_string8:
	.asciz	"b"                             # string offset=210
.Linfo_string9:
	.asciz	"res"                           # string offset=212
.Linfo_string10:
	.asciz	"i"                             # string offset=216
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
