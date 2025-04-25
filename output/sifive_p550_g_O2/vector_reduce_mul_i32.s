	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"vector_reduce_mul_i32.c"
	.text
	.globl	vector_reduce_mul_i32           # -- Begin function vector_reduce_mul_i32
	.p2align	1
	.type	vector_reduce_mul_i32,@function
vector_reduce_mul_i32:                  # @vector_reduce_mul_i32
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "vector_reduce_mul_i32.c" md5 0x2aab6a76880cd9845feb0a76d2100b86
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: vector_reduce_mul_i32:a <- $x10
	#DEBUG_VALUE: vector_reduce_mul_i32:a_len <- $x11
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- 1
	#DEBUG_VALUE: i <- 0
	.loc	0 5 3 prologue_end              # vector_reduce_mul_i32.c:5:3
	beqz	a1, .LBB0_4
.Ltmp0:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- 1
	#DEBUG_VALUE: vector_reduce_mul_i32:a_len <- $x11
	#DEBUG_VALUE: vector_reduce_mul_i32:a <- $x10
	andi	a6, a1, 7
	li	a3, 8
	bgeu	a1, a3, .LBB0_5
.Ltmp1:
# %bb.2:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- 1
	#DEBUG_VALUE: vector_reduce_mul_i32:a_len <- $x11
	#DEBUG_VALUE: vector_reduce_mul_i32:a <- $x10
	.loc	0 0 3 is_stmt 0                 # vector_reduce_mul_i32.c:0:3
	li	a3, 0
	li	t0, 1
	.loc	0 5 3                           # vector_reduce_mul_i32.c:5:3
	bnez	a6, .LBB0_8
.Ltmp2:
.LBB0_3:                                # %for.cond.cleanup
	.loc	0 7 3 is_stmt 1                 # vector_reduce_mul_i32.c:7:3
	sext.w	a0, t0
	ret
.LBB0_4:
.Ltmp3:
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- 1
	#DEBUG_VALUE: vector_reduce_mul_i32:a_len <- $x11
	#DEBUG_VALUE: vector_reduce_mul_i32:a <- $x10
	.loc	0 0 3 is_stmt 0                 # vector_reduce_mul_i32.c:0:3
	li	t0, 1
	.loc	0 7 3 is_stmt 1                 # vector_reduce_mul_i32.c:7:3
	sext.w	a0, t0
.Ltmp4:
	ret
.Ltmp5:
.LBB0_5:                                # %for.body.preheader.new
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- 1
	#DEBUG_VALUE: vector_reduce_mul_i32:a_len <- $x11
	#DEBUG_VALUE: vector_reduce_mul_i32:a <- $x10
	.loc	0 5 0                           # vector_reduce_mul_i32.c:5
	zext.w	a1, a1
.Ltmp6:
	.loc	0 0 0 is_stmt 0                 # vector_reduce_mul_i32.c:0:0
	li	a3, 0
	.loc	0 5 3                           # vector_reduce_mul_i32.c:5:3
	addi	a4, a0, 16
	andi	a1, a1, -8
	li	t0, 1
	neg	a7, a1
.Ltmp7:
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: vector_reduce_mul_i32:a <- $x10
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_stack_value] $x13
	.loc	0 6 16 is_stmt 1                # vector_reduce_mul_i32.c:6:16
	lw	a2, -16(a4)
	lw	a5, -12(a4)
.Ltmp8:
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- undef
	#DEBUG_VALUE: i <- [DW_OP_constu 2, DW_OP_or, DW_OP_stack_value] $x13
	lw	a1, -8(a4)
	lw	t1, -4(a4)
.Ltmp9:
	#DEBUG_VALUE: i <- [DW_OP_constu 4, DW_OP_or, DW_OP_stack_value] $x13
	.loc	0 5 3                           # vector_reduce_mul_i32.c:5:3
	addi	a3, a3, -8
.Ltmp10:
	.loc	0 6 13                          # vector_reduce_mul_i32.c:6:13
	mul	a2, a2, t0
.Ltmp11:
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x12
	#DEBUG_VALUE: i <- [DW_OP_constu 1, DW_OP_or, DW_OP_stack_value] $x13
	.loc	0 6 16 is_stmt 0                # vector_reduce_mul_i32.c:6:16
	lw	t2, 0(a4)
	lw	t3, 4(a4)
	.loc	0 6 13                          # vector_reduce_mul_i32.c:6:13
	mul	a1, a1, a5
	mul	t0, a1, a2
.Ltmp12:
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: i <- [DW_OP_constu 3, DW_OP_or, DW_OP_stack_value] $x13
	.loc	0 6 16                          # vector_reduce_mul_i32.c:6:16
	lw	a1, 8(a4)
.Ltmp13:
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- undef
	#DEBUG_VALUE: i <- [DW_OP_constu 7, DW_OP_or, DW_OP_stack_value] $x13
	lw	a2, 12(a4)
	.loc	0 6 13                          # vector_reduce_mul_i32.c:6:13
	mul	a5, t2, t1
.Ltmp14:
	#DEBUG_VALUE: i <- [DW_OP_constu 5, DW_OP_or, DW_OP_stack_value] $x13
	.loc	0 5 3 is_stmt 1                 # vector_reduce_mul_i32.c:5:3
	addi	a4, a4, 32
.Ltmp15:
	.loc	0 6 13                          # vector_reduce_mul_i32.c:6:13
	mul	a5, t3, a5
	mul	a1, a2, a1
	mul	a5, a5, t0
.Ltmp16:
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x15
	#DEBUG_VALUE: i <- [DW_OP_constu 6, DW_OP_or, DW_OP_stack_value] $x13
	mul	t0, a1, a5
.Ltmp17:
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 8, DW_OP_plus, DW_OP_stack_value] $x13
	.loc	0 5 3                           # vector_reduce_mul_i32.c:5:3
	bne	a7, a3, .LBB0_6
.Ltmp18:
# %bb.7:                                # %for.cond.cleanup.loopexit.unr-lcssa.loopexit
	#DEBUG_VALUE: i <- [DW_OP_consts 18446744073709551608, DW_OP_div, DW_OP_consts 8, DW_OP_mul, DW_OP_consts 8, DW_OP_plus, DW_OP_stack_value] $x13
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: vector_reduce_mul_i32:a <- $x10
	neg	a3, a3
.Ltmp19:
	beqz	a6, .LBB0_3
.Ltmp20:
.LBB0_8:                                # %for.body.epil
	#DEBUG_VALUE: vector_reduce_mul_i32:a <- $x10
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: i <- $x13
	.loc	0 6 16                          # vector_reduce_mul_i32.c:6:16
	sh2add	a0, a3, a0
.Ltmp21:
	lw	a3, 0(a0)
.Ltmp22:
	.loc	0 6 13 is_stmt 0                # vector_reduce_mul_i32.c:6:13
	mul	t0, a3, t0
.Ltmp23:
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	.loc	0 0 13                          # vector_reduce_mul_i32.c:0:13
	li	a3, 1
.Ltmp24:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	.loc	0 5 3 is_stmt 1                 # vector_reduce_mul_i32.c:5:3
	beq	a6, a3, .LBB0_3
.Ltmp25:
# %bb.9:                                # %for.body.epil.1
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] undef
	.loc	0 6 16                          # vector_reduce_mul_i32.c:6:16
	lw	a3, 4(a0)
	.loc	0 6 13 is_stmt 0                # vector_reduce_mul_i32.c:6:13
	mul	t0, a3, t0
.Ltmp26:
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	.loc	0 0 13                          # vector_reduce_mul_i32.c:0:13
	li	a3, 2
.Ltmp27:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 2, DW_OP_stack_value] undef
	.loc	0 5 3 is_stmt 1                 # vector_reduce_mul_i32.c:5:3
	beq	a6, a3, .LBB0_3
.Ltmp28:
# %bb.10:                               # %for.body.epil.2
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 2, DW_OP_stack_value] undef
	.loc	0 6 16                          # vector_reduce_mul_i32.c:6:16
	lw	a3, 8(a0)
	.loc	0 6 13 is_stmt 0                # vector_reduce_mul_i32.c:6:13
	mul	t0, a3, t0
.Ltmp29:
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	.loc	0 0 13                          # vector_reduce_mul_i32.c:0:13
	li	a3, 3
.Ltmp30:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 3, DW_OP_stack_value] undef
	.loc	0 5 3 is_stmt 1                 # vector_reduce_mul_i32.c:5:3
	beq	a6, a3, .LBB0_3
.Ltmp31:
# %bb.11:                               # %for.body.epil.3
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 3, DW_OP_stack_value] undef
	.loc	0 6 16                          # vector_reduce_mul_i32.c:6:16
	lw	a3, 12(a0)
	.loc	0 6 13 is_stmt 0                # vector_reduce_mul_i32.c:6:13
	mul	t0, a3, t0
.Ltmp32:
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	.loc	0 0 13                          # vector_reduce_mul_i32.c:0:13
	li	a3, 4
.Ltmp33:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 4, DW_OP_stack_value] undef
	.loc	0 5 3 is_stmt 1                 # vector_reduce_mul_i32.c:5:3
	beq	a6, a3, .LBB0_3
.Ltmp34:
# %bb.12:                               # %for.body.epil.4
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 4, DW_OP_stack_value] undef
	.loc	0 6 16                          # vector_reduce_mul_i32.c:6:16
	lw	a3, 16(a0)
	.loc	0 6 13 is_stmt 0                # vector_reduce_mul_i32.c:6:13
	mul	t0, a3, t0
.Ltmp35:
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	.loc	0 0 13                          # vector_reduce_mul_i32.c:0:13
	li	a3, 5
.Ltmp36:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 5, DW_OP_stack_value] undef
	.loc	0 5 3 is_stmt 1                 # vector_reduce_mul_i32.c:5:3
	beq	a6, a3, .LBB0_3
.Ltmp37:
# %bb.13:                               # %for.body.epil.5
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 5, DW_OP_stack_value] undef
	.loc	0 6 16                          # vector_reduce_mul_i32.c:6:16
	lw	a3, 20(a0)
	.loc	0 6 13 is_stmt 0                # vector_reduce_mul_i32.c:6:13
	mul	t0, a3, t0
.Ltmp38:
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	.loc	0 0 13                          # vector_reduce_mul_i32.c:0:13
	li	a3, 6
.Ltmp39:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 6, DW_OP_stack_value] undef
	.loc	0 5 3 is_stmt 1                 # vector_reduce_mul_i32.c:5:3
	beq	a6, a3, .LBB0_3
.Ltmp40:
# %bb.14:                               # %for.body.epil.6
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: vector_reduce_mul_i32:product <- $x5
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 6, DW_OP_stack_value] undef
	.loc	0 6 16                          # vector_reduce_mul_i32.c:6:16
	lw	a0, 24(a0)
	.loc	0 6 13 is_stmt 0                # vector_reduce_mul_i32.c:6:13
	mul	t0, a0, t0
.Ltmp41:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 7, DW_OP_stack_value] undef
	.loc	0 7 3 is_stmt 1                 # vector_reduce_mul_i32.c:7:3
	sext.w	a0, t0
	ret
.Ltmp42:
.Lfunc_end0:
	.size	vector_reduce_mul_i32, .Lfunc_end0-vector_reduce_mul_i32
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
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp4-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp5-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp21-.Lfunc_begin0          #   ending offset
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
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp7-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp11-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp12-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp13-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp16-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp17-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	95                              # DW_OP_reg15
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp17-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp41-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp5-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp7-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	9                               # Loc expr size
	.byte	125                             # DW_OP_breg13
	.byte	0                               # 0
	.byte	17                              # DW_OP_consts
	.byte	120                             # -8
	.byte	27                              # DW_OP_div
	.byte	17                              # DW_OP_consts
	.byte	8                               # 8
	.byte	30                              # DW_OP_mul
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	5                               # Loc expr size
	.byte	125                             # DW_OP_breg13
	.byte	0                               # 0
	.byte	50                              # DW_OP_lit2
	.byte	33                              # DW_OP_or
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	5                               # Loc expr size
	.byte	125                             # DW_OP_breg13
	.byte	0                               # 0
	.byte	52                              # DW_OP_lit4
	.byte	33                              # DW_OP_or
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp11-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp12-.Lfunc_begin0          #   ending offset
	.byte	5                               # Loc expr size
	.byte	125                             # DW_OP_breg13
	.byte	0                               # 0
	.byte	49                              # DW_OP_lit1
	.byte	33                              # DW_OP_or
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp13-.Lfunc_begin0          #   ending offset
	.byte	5                               # Loc expr size
	.byte	125                             # DW_OP_breg13
	.byte	0                               # 0
	.byte	51                              # DW_OP_lit3
	.byte	33                              # DW_OP_or
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp14-.Lfunc_begin0          #   ending offset
	.byte	5                               # Loc expr size
	.byte	125                             # DW_OP_breg13
	.byte	0                               # 0
	.byte	55                              # DW_OP_lit7
	.byte	33                              # DW_OP_or
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp14-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp16-.Lfunc_begin0          #   ending offset
	.byte	5                               # Loc expr size
	.byte	125                             # DW_OP_breg13
	.byte	0                               # 0
	.byte	53                              # DW_OP_lit5
	.byte	33                              # DW_OP_or
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp16-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp17-.Lfunc_begin0          #   ending offset
	.byte	5                               # Loc expr size
	.byte	125                             # DW_OP_breg13
	.byte	0                               # 0
	.byte	54                              # DW_OP_lit6
	.byte	33                              # DW_OP_or
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp17-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp19-.Lfunc_begin0          #   ending offset
	.byte	12                              # Loc expr size
	.byte	125                             # DW_OP_breg13
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
	.uleb128 .Ltmp22-.Lfunc_begin0          #   ending offset
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
	.byte	1                               # Abbrev [1] 0xc:0x64 DW_TAG_compile_unit
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
	.byte	3                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	98                              # DW_AT_type
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x3a:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	5                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	102                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x43:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.word	107                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x4c:0x9 DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	98                              # DW_AT_type
	.byte	5                               # Abbrev [5] 0x55:0xc DW_TAG_lexical_block
	.byte	0                               # DW_AT_ranges
	.byte	4                               # Abbrev [4] 0x57:0x9 DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	107                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x62:0x4 DW_TAG_base_type
	.byte	4                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x66:0x5 DW_TAG_pointer_type
	.word	98                              # DW_AT_type
	.byte	6                               # Abbrev [6] 0x6b:0x4 DW_TAG_base_type
	.byte	7                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
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
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp5-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp41-.Lfunc_begin0          #   ending offset
	.byte	0                               # DW_RLE_end_of_list
.Ldebug_list_header_end1:
	.section	.debug_str_offsets,"",@progbits
	.word	44                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"vector_reduce_mul_i32.c"       # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=132
.Linfo_string3:
	.asciz	"vector_reduce_mul_i32"         # string offset=179
.Linfo_string4:
	.asciz	"int"                           # string offset=201
.Linfo_string5:
	.asciz	"a"                             # string offset=205
.Linfo_string6:
	.asciz	"a_len"                         # string offset=207
.Linfo_string7:
	.asciz	"unsigned int"                  # string offset=213
.Linfo_string8:
	.asciz	"product"                       # string offset=226
.Linfo_string9:
	.asciz	"i"                             # string offset=234
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
