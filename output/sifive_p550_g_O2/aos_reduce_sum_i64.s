	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"aos_reduce_sum_i64.c"
	.text
	.globl	aos_reduce_sum_i64              # -- Begin function aos_reduce_sum_i64
	.p2align	1
	.type	aos_reduce_sum_i64,@function
aos_reduce_sum_i64:                     # @aos_reduce_sum_i64
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "aos_reduce_sum_i64.c" md5 0xc52a8f62bfccb6b11703c239583eaf5a
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: aos_reduce_sum_i64:len <- $x10
	#DEBUG_VALUE: aos_reduce_sum_i64:a <- $x11
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- 0
	#DEBUG_VALUE: i <- 0
	.loc	0 17 3 prologue_end             # aos_reduce_sum_i64.c:17:3
	beqz	a0, .LBB0_4
.Ltmp0:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- 0
	#DEBUG_VALUE: aos_reduce_sum_i64:a <- $x11
	#DEBUG_VALUE: aos_reduce_sum_i64:len <- $x10
	andi	a6, a0, 7
	li	a2, 8
	bgeu	a0, a2, .LBB0_5
.Ltmp1:
# %bb.2:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- 0
	#DEBUG_VALUE: aos_reduce_sum_i64:a <- $x11
	#DEBUG_VALUE: aos_reduce_sum_i64:len <- $x10
	.loc	0 0 3 is_stmt 0                 # aos_reduce_sum_i64.c:0:3
	li	a0, 0
.Ltmp2:
	li	t0, 0
	.loc	0 17 3                          # aos_reduce_sum_i64.c:17:3
	bnez	a6, .LBB0_8
.Ltmp3:
.LBB0_3:                                # %for.cond.cleanup
	.loc	0 19 3 is_stmt 1                # aos_reduce_sum_i64.c:19:3
	sext.w	a0, t0
	ret
.LBB0_4:
.Ltmp4:
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- 0
	#DEBUG_VALUE: aos_reduce_sum_i64:a <- $x11
	#DEBUG_VALUE: aos_reduce_sum_i64:len <- $x10
	.loc	0 19 3                          # aos_reduce_sum_i64.c:19:3
	li	a0, 0
.Ltmp5:
	ret
.Ltmp6:
.LBB0_5:                                # %for.body.preheader.new
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- 0
	#DEBUG_VALUE: aos_reduce_sum_i64:a <- $x11
	#DEBUG_VALUE: aos_reduce_sum_i64:len <- $x10
	.loc	0 17 0                          # aos_reduce_sum_i64.c:17
	zext.w	a0, a0
.Ltmp7:
	.loc	0 0 0 is_stmt 0                 # aos_reduce_sum_i64.c:0:0
	li	a4, 0
	li	t0, 0
	.loc	0 17 3                          # aos_reduce_sum_i64.c:17:3
	andi	a0, a0, -8
	addi	a5, a1, 272
	neg	a7, a0
.Ltmp8:
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: aos_reduce_sum_i64:a <- $x11
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_stack_value] $x14
	.loc	0 18 17 is_stmt 1               # aos_reduce_sum_i64.c:18:17
	ld	a3, -224(a5)
	ld	a0, -168(a5)
.Ltmp9:
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- undef
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 2, DW_OP_plus, DW_OP_stack_value] $x14
	ld	a2, -112(a5)
	ld	t1, -56(a5)
.Ltmp10:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 4, DW_OP_plus, DW_OP_stack_value] $x14
	.loc	0 17 3                          # aos_reduce_sum_i64.c:17:3
	addi	a4, a4, -8
.Ltmp11:
	.loc	0 18 9                          # aos_reduce_sum_i64.c:18:9
	add	a3, a3, t0
.Ltmp12:
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x13
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $x14
	add	a0, a0, a2
	.loc	0 18 17 is_stmt 0               # aos_reduce_sum_i64.c:18:17
	ld	t2, 0(a5)
	.loc	0 18 9                          # aos_reduce_sum_i64.c:18:9
	add	t0, a0, a3
.Ltmp13:
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 3, DW_OP_plus, DW_OP_stack_value] $x14
	.loc	0 18 17                         # aos_reduce_sum_i64.c:18:17
	ld	a3, 56(a5)
	ld	a0, 112(a5)
.Ltmp14:
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- undef
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 7, DW_OP_plus, DW_OP_stack_value] $x14
	ld	a2, 168(a5)
	.loc	0 18 9                          # aos_reduce_sum_i64.c:18:9
	add	t1, t1, t2
.Ltmp15:
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 5, DW_OP_plus, DW_OP_stack_value] $x14
	.loc	0 17 3 is_stmt 1                # aos_reduce_sum_i64.c:17:3
	addi	a5, a5, 448
.Ltmp16:
	.loc	0 18 9                          # aos_reduce_sum_i64.c:18:9
	add	a3, a3, t1
	add	a0, a0, a2
	add	a3, a3, t0
.Ltmp17:
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x13
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 6, DW_OP_plus, DW_OP_stack_value] $x14
	add	t0, a0, a3
.Ltmp18:
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 8, DW_OP_plus, DW_OP_stack_value] $x14
	.loc	0 17 3                          # aos_reduce_sum_i64.c:17:3
	bne	a7, a4, .LBB0_6
.Ltmp19:
# %bb.7:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 8, DW_OP_plus, DW_OP_stack_value] $x14
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: aos_reduce_sum_i64:a <- $x11
	neg	a0, a4
	beqz	a6, .LBB0_3
.Ltmp20:
.LBB0_8:                                # %for.body.epil
	#DEBUG_VALUE: aos_reduce_sum_i64:a <- $x11
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: i <- $x10
	.loc	0 18 17                         # aos_reduce_sum_i64.c:18:17
	slli	a4, a0, 3
	slli	a0, a0, 6
.Ltmp21:
	sub	a0, a0, a4
	add	a1, a1, a0
.Ltmp22:
	ld	a0, 48(a1)
	.loc	0 18 9 is_stmt 0                # aos_reduce_sum_i64.c:18:9
	add	t0, t0, a0
.Ltmp23:
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	.loc	0 0 9                           # aos_reduce_sum_i64.c:0:9
	li	a0, 1
.Ltmp24:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	.loc	0 17 3 is_stmt 1                # aos_reduce_sum_i64.c:17:3
	beq	a6, a0, .LBB0_3
.Ltmp25:
# %bb.9:                                # %for.body.epil.1
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: i <- undef
	.loc	0 18 17                         # aos_reduce_sum_i64.c:18:17
	ld	a0, 104(a1)
	.loc	0 18 9 is_stmt 0                # aos_reduce_sum_i64.c:18:9
	add	t0, t0, a0
.Ltmp26:
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	.loc	0 0 9                           # aos_reduce_sum_i64.c:0:9
	li	a0, 2
.Ltmp27:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 2, DW_OP_stack_value] undef
	.loc	0 17 3 is_stmt 1                # aos_reduce_sum_i64.c:17:3
	beq	a6, a0, .LBB0_3
.Ltmp28:
# %bb.10:                               # %for.body.epil.2
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: i <- undef
	.loc	0 18 17                         # aos_reduce_sum_i64.c:18:17
	ld	a0, 160(a1)
	.loc	0 18 9 is_stmt 0                # aos_reduce_sum_i64.c:18:9
	add	t0, t0, a0
.Ltmp29:
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	.loc	0 0 9                           # aos_reduce_sum_i64.c:0:9
	li	a0, 3
.Ltmp30:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 3, DW_OP_stack_value] undef
	.loc	0 17 3 is_stmt 1                # aos_reduce_sum_i64.c:17:3
	beq	a6, a0, .LBB0_3
.Ltmp31:
# %bb.11:                               # %for.body.epil.3
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: i <- undef
	.loc	0 18 17                         # aos_reduce_sum_i64.c:18:17
	ld	a0, 216(a1)
	.loc	0 18 9 is_stmt 0                # aos_reduce_sum_i64.c:18:9
	add	t0, t0, a0
.Ltmp32:
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	.loc	0 0 9                           # aos_reduce_sum_i64.c:0:9
	li	a0, 4
.Ltmp33:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 4, DW_OP_stack_value] undef
	.loc	0 17 3 is_stmt 1                # aos_reduce_sum_i64.c:17:3
	beq	a6, a0, .LBB0_3
.Ltmp34:
# %bb.12:                               # %for.body.epil.4
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: i <- undef
	.loc	0 18 17                         # aos_reduce_sum_i64.c:18:17
	ld	a0, 272(a1)
	.loc	0 18 9 is_stmt 0                # aos_reduce_sum_i64.c:18:9
	add	t0, t0, a0
.Ltmp35:
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	.loc	0 0 9                           # aos_reduce_sum_i64.c:0:9
	li	a0, 5
.Ltmp36:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 5, DW_OP_stack_value] undef
	.loc	0 17 3 is_stmt 1                # aos_reduce_sum_i64.c:17:3
	beq	a6, a0, .LBB0_3
.Ltmp37:
# %bb.13:                               # %for.body.epil.5
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: i <- undef
	.loc	0 18 17                         # aos_reduce_sum_i64.c:18:17
	ld	a0, 328(a1)
	.loc	0 18 9 is_stmt 0                # aos_reduce_sum_i64.c:18:9
	add	t0, t0, a0
.Ltmp38:
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	.loc	0 0 9                           # aos_reduce_sum_i64.c:0:9
	li	a0, 6
.Ltmp39:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 6, DW_OP_stack_value] undef
	.loc	0 17 3 is_stmt 1                # aos_reduce_sum_i64.c:17:3
	beq	a6, a0, .LBB0_3
.Ltmp40:
# %bb.14:                               # %for.body.epil.6
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: aos_reduce_sum_i64:sum <- $x5
	#DEBUG_VALUE: i <- undef
	.loc	0 18 17                         # aos_reduce_sum_i64.c:18:17
	ld	a0, 384(a1)
	.loc	0 18 9 is_stmt 0                # aos_reduce_sum_i64.c:18:9
	add	t0, t0, a0
.Ltmp41:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 7, DW_OP_stack_value] undef
	.loc	0 19 3 is_stmt 1                # aos_reduce_sum_i64.c:19:3
	sext.w	a0, t0
	ret
.Ltmp42:
.Lfunc_end0:
	.size	aos_reduce_sum_i64, .Lfunc_end0-aos_reduce_sum_i64
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
	.uleb128 .Ltmp4-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp5-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp4-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp22-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	0                               # 0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp4-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	0                               # 0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp13-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp14-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp17-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp18-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp18-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp41-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	9                               # Loc expr size
	.byte	126                             # DW_OP_breg14
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	126                             # DW_OP_breg14
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
	.uleb128 .Ltmp10-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp11-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	126                             # DW_OP_breg14
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
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp13-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	126                             # DW_OP_breg14
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
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp14-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	126                             # DW_OP_breg14
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
	.uleb128 .Ltmp14-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp15-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	126                             # DW_OP_breg14
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
	.byte	126                             # DW_OP_breg14
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
	.uleb128 .Ltmp17-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp18-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	126                             # DW_OP_breg14
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
	.uleb128 .Ltmp18-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp20-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	126                             # DW_OP_breg14
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
	.uleb128 .Ltmp20-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp21-.Lfunc_begin0          #   ending offset
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
	.byte	8                               # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	56                              # DW_AT_data_member_location
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
	.byte	1                               # Abbrev [1] 0xc:0xad DW_TAG_compile_unit
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
	.byte	2                               # Abbrev [2] 0x2b:0x37 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	15                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	98                              # DW_AT_type
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x3a:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	5                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	15                              # DW_AT_decl_line
	.word	102                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x43:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	15                              # DW_AT_decl_line
	.word	106                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x4c:0x9 DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	16                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	16                              # DW_AT_decl_line
	.word	180                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x55:0xc DW_TAG_lexical_block
	.byte	0                               # DW_AT_ranges
	.byte	4                               # Abbrev [4] 0x57:0x9 DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	17                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	17                              # DW_AT_decl_line
	.word	102                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x62:0x4 DW_TAG_base_type
	.byte	4                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	6                               # Abbrev [6] 0x66:0x4 DW_TAG_base_type
	.byte	6                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x6a:0x5 DW_TAG_pointer_type
	.word	111                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x6f:0x45 DW_TAG_structure_type
	.byte	15                              # DW_AT_name
	.byte	56                              # DW_AT_byte_size
	.byte	0                               # DW_AT_decl_file
	.byte	2                               # DW_AT_decl_line
	.byte	9                               # Abbrev [9] 0x74:0x9 DW_TAG_member
	.byte	7                               # DW_AT_name
	.word	180                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x7d:0x9 DW_TAG_member
	.byte	9                               # DW_AT_name
	.word	180                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x86:0x9 DW_TAG_member
	.byte	10                              # DW_AT_name
	.word	180                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.byte	16                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x8f:0x9 DW_TAG_member
	.byte	11                              # DW_AT_name
	.word	180                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.byte	24                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0x98:0x9 DW_TAG_member
	.byte	12                              # DW_AT_name
	.word	180                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.byte	32                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0xa1:0x9 DW_TAG_member
	.byte	13                              # DW_AT_name
	.word	180                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	8                               # DW_AT_decl_line
	.byte	40                              # DW_AT_data_member_location
	.byte	9                               # Abbrev [9] 0xaa:0x9 DW_TAG_member
	.byte	14                              # DW_AT_name
	.word	180                             # DW_AT_type
	.byte	0                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
	.byte	48                              # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0xb4:0x4 DW_TAG_base_type
	.byte	8                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
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
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp41-.Lfunc_begin0          #   ending offset
	.byte	0                               # DW_RLE_end_of_list
.Ldebug_list_header_end1:
	.section	.debug_str_offsets,"",@progbits
	.word	76                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"aos_reduce_sum_i64.c"          # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=129
.Linfo_string3:
	.asciz	"aos_reduce_sum_i64"            # string offset=176
.Linfo_string4:
	.asciz	"int"                           # string offset=195
.Linfo_string5:
	.asciz	"len"                           # string offset=199
.Linfo_string6:
	.asciz	"unsigned int"                  # string offset=203
.Linfo_string7:
	.asciz	"a"                             # string offset=216
.Linfo_string8:
	.asciz	"long"                          # string offset=218
.Linfo_string9:
	.asciz	"b"                             # string offset=223
.Linfo_string10:
	.asciz	"c"                             # string offset=225
.Linfo_string11:
	.asciz	"d"                             # string offset=227
.Linfo_string12:
	.asciz	"e"                             # string offset=229
.Linfo_string13:
	.asciz	"f"                             # string offset=231
.Linfo_string14:
	.asciz	"g"                             # string offset=233
.Linfo_string15:
	.asciz	"T"                             # string offset=235
.Linfo_string16:
	.asciz	"sum"                           # string offset=237
.Linfo_string17:
	.asciz	"i"                             # string offset=241
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
	.word	.Linfo_string11
	.word	.Linfo_string12
	.word	.Linfo_string13
	.word	.Linfo_string14
	.word	.Linfo_string15
	.word	.Linfo_string16
	.word	.Linfo_string17
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
