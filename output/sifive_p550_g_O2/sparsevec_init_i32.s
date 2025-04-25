	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"sparsevec_init_i32.c"
	.text
	.globl	sparsevec_init_i32              # -- Begin function sparsevec_init_i32
	.p2align	1
	.type	sparsevec_init_i32,@function
sparsevec_init_i32:                     # @sparsevec_init_i32
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "sparsevec_init_i32.c" md5 0x2295d027641b61dbcecd06ee41ab3ede
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: sparsevec_init_i32:len <- $x10
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	#DEBUG_VALUE: sparsevec_init_i32:aidx <- $x12
	#DEBUG_VALUE: i <- 0
	.loc	0 5 3 prologue_end              # sparsevec_init_i32.c:5:3
	beqz	a0, .LBB0_13
.Ltmp0:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_init_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	#DEBUG_VALUE: sparsevec_init_i32:len <- $x10
	andi	a6, a0, 7
	li	a3, 8
	bgeu	a0, a3, .LBB0_3
.Ltmp1:
# %bb.2:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_init_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	#DEBUG_VALUE: sparsevec_init_i32:len <- $x10
	.loc	0 0 3 is_stmt 0                 # sparsevec_init_i32.c:0:3
	li	a4, 0
	j	.LBB0_5
.Ltmp2:
.LBB0_3:                                # %for.body.preheader.new
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_init_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	#DEBUG_VALUE: sparsevec_init_i32:len <- $x10
	.loc	0 5 0                           # sparsevec_init_i32.c:5
	zext.w	a0, a0
.Ltmp3:
	.loc	0 0 0                           # sparsevec_init_i32.c:0:0
	li	t5, 0
	li	a4, 0
	.loc	0 5 3                           # sparsevec_init_i32.c:5:3
	andi	a7, a0, -8
	addi	a3, a2, 8
.Ltmp4:
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: sparsevec_init_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	#DEBUG_VALUE: i <- $x14
	.loc	0 6 7 is_stmt 1                 # sparsevec_init_i32.c:6:7
	lh	a0, -8(a3)
	lh	t1, -6(a3)
	lh	t2, -4(a3)
	lh	t3, -2(a3)
	.loc	0 5 34                          # sparsevec_init_i32.c:5:34
	addi	t0, a4, 1
.Ltmp5:
	#DEBUG_VALUE: i <- $x5
	addi	t4, a4, 2
.Ltmp6:
	#DEBUG_VALUE: i <- $x29
	.loc	0 6 5                           # sparsevec_init_i32.c:6:5
	sh2add	a0, a0, a1
	sh2add	a5, t3, a1
	.loc	0 6 16 is_stmt 0                # sparsevec_init_i32.c:6:16
	sw	t5, 0(a0)
	.loc	0 6 5                           # sparsevec_init_i32.c:6:5
	sh2add	a0, t1, a1
	.loc	0 5 34 is_stmt 1                # sparsevec_init_i32.c:5:34
	addi	t1, a4, 3
.Ltmp7:
	#DEBUG_VALUE: i <- $x6
	.loc	0 5 3 is_stmt 0                 # sparsevec_init_i32.c:5:3
	addi	t5, t5, 8
.Ltmp8:
	.loc	0 6 16 is_stmt 1                # sparsevec_init_i32.c:6:16
	sw	t0, 0(a0)
	.loc	0 6 5 is_stmt 0                 # sparsevec_init_i32.c:6:5
	sh2add	a0, t2, a1
	.loc	0 5 34 is_stmt 1                # sparsevec_init_i32.c:5:34
	addi	t0, a4, 4
.Ltmp9:
	#DEBUG_VALUE: i <- $x5
	.loc	0 6 16                          # sparsevec_init_i32.c:6:16
	sw	t4, 0(a0)
	sw	t1, 0(a5)
	.loc	0 6 7 is_stmt 0                 # sparsevec_init_i32.c:6:7
	lh	t1, 0(a3)
	lh	t2, 2(a3)
	lh	t3, 4(a3)
	lh	t4, 6(a3)
.Ltmp10:
	.loc	0 5 3 is_stmt 1                 # sparsevec_init_i32.c:5:3
	addi	a3, a3, 16
.Ltmp11:
	.loc	0 6 5                           # sparsevec_init_i32.c:6:5
	sh2add	a0, t1, a1
	sh2add	a5, t2, a1
	.loc	0 6 16 is_stmt 0                # sparsevec_init_i32.c:6:16
	sw	t0, 0(a0)
	.loc	0 5 34 is_stmt 1                # sparsevec_init_i32.c:5:34
	addi	a0, a4, 5
.Ltmp12:
	#DEBUG_VALUE: i <- $x10
	.loc	0 6 16                          # sparsevec_init_i32.c:6:16
	sw	a0, 0(a5)
	.loc	0 5 34                          # sparsevec_init_i32.c:5:34
	addi	a0, a4, 6
.Ltmp13:
	#DEBUG_VALUE: i <- $x10
	.loc	0 6 5                           # sparsevec_init_i32.c:6:5
	sh2add	a5, t3, a1
	.loc	0 6 16 is_stmt 0                # sparsevec_init_i32.c:6:16
	sw	a0, 0(a5)
	.loc	0 5 34 is_stmt 1                # sparsevec_init_i32.c:5:34
	addi	a0, a4, 7
.Ltmp14:
	#DEBUG_VALUE: i <- $x10
	.loc	0 6 5                           # sparsevec_init_i32.c:6:5
	sh2add	a5, t4, a1
	.loc	0 5 34                          # sparsevec_init_i32.c:5:34
	addi	a4, a4, 8
.Ltmp15:
	#DEBUG_VALUE: i <- $x14
	.loc	0 6 16                          # sparsevec_init_i32.c:6:16
	sw	a0, 0(a5)
.Ltmp16:
	.loc	0 5 3                           # sparsevec_init_i32.c:5:3
	bne	a4, a7, .LBB0_4
.Ltmp17:
.LBB0_5:                                # %for.cond.cleanup.loopexit.unr-lcssa
	#DEBUG_VALUE: sparsevec_init_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	.loc	0 5 3                           # sparsevec_init_i32.c:5:3
	beqz	a6, .LBB0_13
.Ltmp18:
# %bb.6:                                # %for.body.epil
	#DEBUG_VALUE: sparsevec_init_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	#DEBUG_VALUE: i <- $x14
	.loc	0 6 7                           # sparsevec_init_i32.c:6:7
	sh1add	a0, a4, a2
	lh	a2, 0(a0)
.Ltmp19:
	.loc	0 6 5 is_stmt 0                 # sparsevec_init_i32.c:6:5
	sh2add	a2, a2, a1
	.loc	0 6 16                          # sparsevec_init_i32.c:6:16
	sw	a4, 0(a2)
	li	a2, 1
.Ltmp20:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] $x14
	.loc	0 5 3 is_stmt 1                 # sparsevec_init_i32.c:5:3
	beq	a6, a2, .LBB0_13
.Ltmp21:
# %bb.7:                                # %for.body.epil.1
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] $x14
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	.loc	0 6 7                           # sparsevec_init_i32.c:6:7
	lh	a3, 2(a0)
	.loc	0 5 34                          # sparsevec_init_i32.c:5:34
	addi	a2, a4, 1
.Ltmp22:
	#DEBUG_VALUE: i <- $x12
	.loc	0 6 5                           # sparsevec_init_i32.c:6:5
	sh2add	a3, a3, a1
	.loc	0 6 16 is_stmt 0                # sparsevec_init_i32.c:6:16
	sw	a2, 0(a3)
	li	a2, 2
.Ltmp23:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 2, DW_OP_stack_value] $x14
	.loc	0 5 3 is_stmt 1                 # sparsevec_init_i32.c:5:3
	beq	a6, a2, .LBB0_13
.Ltmp24:
# %bb.8:                                # %for.body.epil.2
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 2, DW_OP_stack_value] $x14
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	.loc	0 6 7                           # sparsevec_init_i32.c:6:7
	lh	a3, 4(a0)
	.loc	0 5 34                          # sparsevec_init_i32.c:5:34
	addi	a2, a4, 2
.Ltmp25:
	#DEBUG_VALUE: i <- $x12
	.loc	0 6 5                           # sparsevec_init_i32.c:6:5
	sh2add	a3, a3, a1
	.loc	0 6 16 is_stmt 0                # sparsevec_init_i32.c:6:16
	sw	a2, 0(a3)
	li	a2, 3
.Ltmp26:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 3, DW_OP_stack_value] $x14
	.loc	0 5 3 is_stmt 1                 # sparsevec_init_i32.c:5:3
	beq	a6, a2, .LBB0_13
.Ltmp27:
# %bb.9:                                # %for.body.epil.3
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 3, DW_OP_stack_value] $x14
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	.loc	0 6 7                           # sparsevec_init_i32.c:6:7
	lh	a3, 6(a0)
	.loc	0 5 34                          # sparsevec_init_i32.c:5:34
	addi	a2, a4, 3
.Ltmp28:
	#DEBUG_VALUE: i <- $x12
	.loc	0 6 5                           # sparsevec_init_i32.c:6:5
	sh2add	a3, a3, a1
	.loc	0 6 16 is_stmt 0                # sparsevec_init_i32.c:6:16
	sw	a2, 0(a3)
	li	a2, 4
.Ltmp29:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 4, DW_OP_stack_value] $x14
	.loc	0 5 3 is_stmt 1                 # sparsevec_init_i32.c:5:3
	beq	a6, a2, .LBB0_13
.Ltmp30:
# %bb.10:                               # %for.body.epil.4
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 4, DW_OP_stack_value] $x14
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	.loc	0 6 7                           # sparsevec_init_i32.c:6:7
	lh	a3, 8(a0)
	.loc	0 5 34                          # sparsevec_init_i32.c:5:34
	addi	a2, a4, 4
.Ltmp31:
	#DEBUG_VALUE: i <- $x12
	.loc	0 6 5                           # sparsevec_init_i32.c:6:5
	sh2add	a3, a3, a1
	.loc	0 6 16 is_stmt 0                # sparsevec_init_i32.c:6:16
	sw	a2, 0(a3)
	li	a2, 5
.Ltmp32:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 5, DW_OP_stack_value] $x14
	.loc	0 5 3 is_stmt 1                 # sparsevec_init_i32.c:5:3
	beq	a6, a2, .LBB0_13
.Ltmp33:
# %bb.11:                               # %for.body.epil.5
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 5, DW_OP_stack_value] $x14
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	.loc	0 6 7                           # sparsevec_init_i32.c:6:7
	lh	a3, 10(a0)
	.loc	0 5 34                          # sparsevec_init_i32.c:5:34
	addi	a2, a4, 5
.Ltmp34:
	#DEBUG_VALUE: i <- $x12
	.loc	0 6 5                           # sparsevec_init_i32.c:6:5
	sh2add	a3, a3, a1
	.loc	0 6 16 is_stmt 0                # sparsevec_init_i32.c:6:16
	sw	a2, 0(a3)
	li	a2, 6
.Ltmp35:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 6, DW_OP_stack_value] $x14
	.loc	0 5 3 is_stmt 1                 # sparsevec_init_i32.c:5:3
	beq	a6, a2, .LBB0_13
.Ltmp36:
# %bb.12:                               # %for.body.epil.6
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 6, DW_OP_stack_value] $x14
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	.loc	0 6 7                           # sparsevec_init_i32.c:6:7
	lh	a0, 12(a0)
	.loc	0 5 34                          # sparsevec_init_i32.c:5:34
	addi	a4, a4, 6
.Ltmp37:
	#DEBUG_VALUE: i <- $x14
	.loc	0 6 5                           # sparsevec_init_i32.c:6:5
	sh2add	a0, a0, a1
	.loc	0 6 16 is_stmt 0                # sparsevec_init_i32.c:6:16
	sw	a4, 0(a0)
.Ltmp38:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 7, DW_OP_stack_value] undef
.LBB0_13:                               # %for.cond.cleanup
	#DEBUG_VALUE: sparsevec_init_i32:a <- $x11
	.loc	0 7 1 is_stmt 1                 # sparsevec_init_i32.c:7:1
	ret
.Ltmp39:
.Lfunc_end0:
	.size	sparsevec_init_i32, .Lfunc_end0-sparsevec_init_i32
	.cfi_endproc
                                        # -- End function
	.section	.debug_loclists,"",@progbits
	.word	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	3                               # Offset entry count
.Lloclists_table_base0:
	.word	.Ldebug_loc0-.Lloclists_table_base0
	.word	.Ldebug_loc1-.Lloclists_table_base0
	.word	.Ldebug_loc2-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp3-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp19-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp4-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp4-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp5-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp5-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	109                             # DW_OP_reg29
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp7-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp12-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp15-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp15-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp17-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp18-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp20-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp20-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp22-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	126                             # DW_OP_breg14
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp22-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp23-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp23-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp25-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	126                             # DW_OP_breg14
	.byte	2                               # 2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp25-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp26-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp26-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp28-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	126                             # DW_OP_breg14
	.byte	3                               # 3
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp28-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp29-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp29-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp31-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	126                             # DW_OP_breg14
	.byte	4                               # 4
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp31-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp32-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp32-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp34-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	126                             # DW_OP_breg14
	.byte	5                               # 5
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp34-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp35-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp35-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp37-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	126                             # DW_OP_breg14
	.byte	6                               # 6
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp37-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp38-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
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
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
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
	.byte	7                               # Abbreviation Code
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
	.byte	1                               # Abbrev [1] 0xc:0x6a DW_TAG_compile_unit
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
	.byte	2                               # Abbrev [2] 0x27:0x38 DW_TAG_subprogram
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
	.word	95                              # DW_AT_type
	.byte	4                               # Abbrev [4] 0x3b:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	91
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	99                              # DW_AT_type
	.byte	3                               # Abbrev [3] 0x45:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	108                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x4e:0x10 DW_TAG_lexical_block
	.byte	0                               # DW_AT_low_pc
	.word	.Ltmp38-.Lfunc_begin0           # DW_AT_high_pc
	.byte	6                               # Abbrev [6] 0x54:0x9 DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	95                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x5f:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x63:0x5 DW_TAG_pointer_type
	.word	104                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x68:0x4 DW_TAG_base_type
	.byte	7                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x6c:0x5 DW_TAG_pointer_type
	.word	113                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x71:0x4 DW_TAG_base_type
	.byte	9                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	2                               # DW_AT_byte_size
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
	.asciz	"sparsevec_init_i32.c"          # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=129
.Linfo_string3:
	.asciz	"sparsevec_init_i32"            # string offset=176
.Linfo_string4:
	.asciz	"len"                           # string offset=195
.Linfo_string5:
	.asciz	"unsigned int"                  # string offset=199
.Linfo_string6:
	.asciz	"a"                             # string offset=212
.Linfo_string7:
	.asciz	"int"                           # string offset=214
.Linfo_string8:
	.asciz	"aidx"                          # string offset=218
.Linfo_string9:
	.asciz	"short"                         # string offset=223
.Linfo_string10:
	.asciz	"i"                             # string offset=229
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
