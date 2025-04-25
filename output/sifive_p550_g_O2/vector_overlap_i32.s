	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0"
	.file	"vector_overlap_i32.c"
	.text
	.globl	vector_overlap                  # -- Begin function vector_overlap
	.p2align	1
	.type	vector_overlap,@function
vector_overlap:                         # @vector_overlap
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "vector_overlap_i32.c" md5 0x43011eac5976cadbd4b57f0c2030f238
	.loc	0 6 0                           # vector_overlap_i32.c:6:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: vector_overlap:a <- $x10
	#DEBUG_VALUE: vector_overlap:b <- $x11
	#DEBUG_VALUE: vector_overlap:N <- $x12
	li	a3, 2
.Ltmp0:
	#DEBUG_VALUE: i <- 1
	.loc	0 7 3 prologue_end              # vector_overlap_i32.c:7:3
	bltu	a2, a3, .LBB0_13
.Ltmp1:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 1
	#DEBUG_VALUE: vector_overlap:N <- $x12
	#DEBUG_VALUE: vector_overlap:b <- $x11
	#DEBUG_VALUE: vector_overlap:a <- $x10
	.loc	0 8 21                          # vector_overlap_i32.c:8:21
	lw	t1, 4(a0)
.Ltmp2:
	.loc	0 7 21                          # vector_overlap_i32.c:7:21
	zext.w	a4, a2
.Ltmp3:
	.loc	0 7 3 is_stmt 0                 # vector_overlap_i32.c:7:3
	addiw	a2, a2, -2
.Ltmp4:
	addi	a4, a4, -1
	li	a5, 7
	andi	a6, a4, 7
	bgeu	a2, a5, .LBB0_3
.Ltmp5:
# %bb.2:
	#DEBUG_VALUE: i <- 1
	#DEBUG_VALUE: vector_overlap:b <- $x11
	#DEBUG_VALUE: vector_overlap:a <- $x10
	.loc	0 0 3                           # vector_overlap_i32.c:0:3
	li	t0, 1
	j	.LBB0_5
.Ltmp6:
.LBB0_3:                                # %for.body.preheader.new
	#DEBUG_VALUE: i <- 1
	#DEBUG_VALUE: vector_overlap:b <- $x11
	#DEBUG_VALUE: vector_overlap:a <- $x10
	.loc	0 7 3                           # vector_overlap_i32.c:7:3
	andi	a2, a4, -8
	addi	a4, a0, 20
	addi	a5, a1, 16
	addi	a2, a2, -8
	li	t0, 1
	sh2add	a2, a2, a0
	addi	a7, a2, 52
.Ltmp7:
.LBB0_4:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: vector_overlap:b <- $x11
	#DEBUG_VALUE: vector_overlap:a <- $x10
	#DEBUG_VALUE: i <- $x5
	.loc	0 8 12 is_stmt 1                # vector_overlap_i32.c:8:12
	lw	t2, -20(a4)
	lw	t3, -16(a4)
	.loc	0 8 28 is_stmt 0                # vector_overlap_i32.c:8:28
	lw	a2, -12(a4)
	lw	t4, -8(a4)
	.loc	0 8 31                          # vector_overlap_i32.c:8:31
	addi	t0, t0, 8
.Ltmp8:
	.loc	0 8 19                          # vector_overlap_i32.c:8:19
	add	t1, t1, t2
	.loc	0 8 28                          # vector_overlap_i32.c:8:28
	lw	t5, -4(a4)
	lw	a3, 0(a4)
	.loc	0 8 19                          # vector_overlap_i32.c:8:19
	add	t3, t3, a2
	add	t2, t4, a2
	.loc	0 8 26                          # vector_overlap_i32.c:8:26
	add	t1, t1, a2
	.loc	0 8 28                          # vector_overlap_i32.c:8:28
	lw	a2, 4(a4)
	lw	t6, 8(a4)
	.loc	0 8 26                          # vector_overlap_i32.c:8:26
	add	t3, t3, t4
	.loc	0 8 19                          # vector_overlap_i32.c:8:19
	add	t4, t4, t5
	.loc	0 8 26                          # vector_overlap_i32.c:8:26
	add	t2, t2, t5
	.loc	0 8 19                          # vector_overlap_i32.c:8:19
	add	t5, t5, a3
	.loc	0 8 26                          # vector_overlap_i32.c:8:26
	add	t4, t4, a3
	.loc	0 8 10                          # vector_overlap_i32.c:8:10
	sw	t1, -12(a5)
.Ltmp9:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 1, DW_OP_stack_value] $x5
	sw	t3, -8(a5)
.Ltmp10:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 2, DW_OP_stack_value] $x5
	sw	t2, -4(a5)
.Ltmp11:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 3, DW_OP_stack_value] $x5
	sw	t4, 0(a5)
.Ltmp12:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 4, DW_OP_stack_value] $x5
	.loc	0 8 19                          # vector_overlap_i32.c:8:19
	add	a3, a3, a2
	.loc	0 8 26                          # vector_overlap_i32.c:8:26
	add	t5, t5, a2
	.loc	0 8 19                          # vector_overlap_i32.c:8:19
	add	a2, a2, t6
	.loc	0 8 26                          # vector_overlap_i32.c:8:26
	add	t2, a3, t6
	.loc	0 8 28                          # vector_overlap_i32.c:8:28
	lw	a3, 12(a4)
	lw	t1, 16(a4)
	.loc	0 8 10                          # vector_overlap_i32.c:8:10
	sw	t5, 4(a5)
.Ltmp13:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 5, DW_OP_stack_value] $x5
	.loc	0 7 3 is_stmt 1                 # vector_overlap_i32.c:7:3
	addi	a4, a4, 32
.Ltmp14:
	.loc	0 8 26                          # vector_overlap_i32.c:8:26
	add	a2, a2, a3
	.loc	0 8 10 is_stmt 0                # vector_overlap_i32.c:8:10
	sw	t2, 8(a5)
.Ltmp15:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 6, DW_OP_stack_value] $x5
	.loc	0 8 19                          # vector_overlap_i32.c:8:19
	add	a3, a3, t6
	.loc	0 8 26                          # vector_overlap_i32.c:8:26
	add	a3, a3, t1
	.loc	0 8 10                          # vector_overlap_i32.c:8:10
	sw	a2, 12(a5)
.Ltmp16:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 7, DW_OP_stack_value] $x5
	sw	a3, 16(a5)
.Ltmp17:
	#DEBUG_VALUE: i <- $x5
	.loc	0 7 3 is_stmt 1                 # vector_overlap_i32.c:7:3
	addi	a5, a5, 32
	bne	a4, a7, .LBB0_4
.Ltmp18:
.LBB0_5:                                # %for.cond.cleanup.loopexit.unr-lcssa
	#DEBUG_VALUE: vector_overlap:b <- $x11
	#DEBUG_VALUE: vector_overlap:a <- $x10
	.loc	0 7 3                           # vector_overlap_i32.c:7:3
	beqz	a6, .LBB0_13
.Ltmp19:
# %bb.6:                                # %for.body.epil
	#DEBUG_VALUE: vector_overlap:b <- $x11
	#DEBUG_VALUE: vector_overlap:a <- $x10
	#DEBUG_VALUE: i <- $x5
	.loc	0 8 12                          # vector_overlap_i32.c:8:12
	sh2add	a0, t0, a0
.Ltmp20:
	.loc	0 8 5 is_stmt 0                 # vector_overlap_i32.c:8:5
	sh2add	a1, t0, a1
.Ltmp21:
	.loc	0 0 5                           # vector_overlap_i32.c:0:5
	li	a2, 1
.Ltmp22:
	#DEBUG_VALUE: i <- undef
	.loc	0 8 12                          # vector_overlap_i32.c:8:12
	lw	a5, -4(a0)
	.loc	0 8 28                          # vector_overlap_i32.c:8:28
	lw	a4, 4(a0)
	.loc	0 8 19                          # vector_overlap_i32.c:8:19
	add	a3, t1, a5
	.loc	0 8 26                          # vector_overlap_i32.c:8:26
	add	a3, a3, a4
	.loc	0 8 10                          # vector_overlap_i32.c:8:10
	sw	a3, 0(a1)
.Ltmp23:
	.loc	0 7 3 is_stmt 1                 # vector_overlap_i32.c:7:3
	beq	a6, a2, .LBB0_13
.Ltmp24:
# %bb.7:                                # %for.body.epil.1
	#DEBUG_VALUE: i <- undef
	.loc	0 8 12                          # vector_overlap_i32.c:8:12
	lw	a3, 0(a0)
	.loc	0 8 28 is_stmt 0                # vector_overlap_i32.c:8:28
	lw	a2, 8(a0)
	.loc	0 8 19                          # vector_overlap_i32.c:8:19
	add	a3, a3, a4
	.loc	0 8 26                          # vector_overlap_i32.c:8:26
	add	a3, a3, a2
	.loc	0 8 10                          # vector_overlap_i32.c:8:10
	sw	a3, 4(a1)
	li	a3, 2
.Ltmp25:
	.loc	0 7 3 is_stmt 1                 # vector_overlap_i32.c:7:3
	beq	a6, a3, .LBB0_13
.Ltmp26:
# %bb.8:                                # %for.body.epil.2
	#DEBUG_VALUE: i <- undef
	.loc	0 8 12                          # vector_overlap_i32.c:8:12
	lw	a4, 4(a0)
	.loc	0 8 28 is_stmt 0                # vector_overlap_i32.c:8:28
	lw	a3, 12(a0)
	.loc	0 8 19                          # vector_overlap_i32.c:8:19
	add	a2, a2, a4
	.loc	0 8 26                          # vector_overlap_i32.c:8:26
	add	a2, a2, a3
	.loc	0 8 10                          # vector_overlap_i32.c:8:10
	sw	a2, 8(a1)
	li	a2, 3
.Ltmp27:
	.loc	0 7 3 is_stmt 1                 # vector_overlap_i32.c:7:3
	beq	a6, a2, .LBB0_13
.Ltmp28:
# %bb.9:                                # %for.body.epil.3
	#DEBUG_VALUE: i <- undef
	.loc	0 8 12                          # vector_overlap_i32.c:8:12
	lw	a4, 8(a0)
	.loc	0 8 28 is_stmt 0                # vector_overlap_i32.c:8:28
	lw	a2, 16(a0)
	.loc	0 8 19                          # vector_overlap_i32.c:8:19
	add	a3, a3, a4
	.loc	0 8 26                          # vector_overlap_i32.c:8:26
	add	a3, a3, a2
	.loc	0 8 10                          # vector_overlap_i32.c:8:10
	sw	a3, 12(a1)
	li	a3, 4
.Ltmp29:
	.loc	0 7 3 is_stmt 1                 # vector_overlap_i32.c:7:3
	beq	a6, a3, .LBB0_13
.Ltmp30:
# %bb.10:                               # %for.body.epil.4
	#DEBUG_VALUE: i <- undef
	.loc	0 8 12                          # vector_overlap_i32.c:8:12
	lw	a4, 12(a0)
	.loc	0 8 28 is_stmt 0                # vector_overlap_i32.c:8:28
	lw	a3, 20(a0)
	.loc	0 8 19                          # vector_overlap_i32.c:8:19
	add	a2, a2, a4
	.loc	0 8 26                          # vector_overlap_i32.c:8:26
	add	a2, a2, a3
	.loc	0 8 10                          # vector_overlap_i32.c:8:10
	sw	a2, 16(a1)
	li	a2, 5
.Ltmp31:
	.loc	0 7 3 is_stmt 1                 # vector_overlap_i32.c:7:3
	beq	a6, a2, .LBB0_13
.Ltmp32:
# %bb.11:                               # %for.body.epil.5
	#DEBUG_VALUE: i <- undef
	.loc	0 8 12                          # vector_overlap_i32.c:8:12
	lw	a4, 16(a0)
	.loc	0 8 28 is_stmt 0                # vector_overlap_i32.c:8:28
	lw	a2, 24(a0)
	.loc	0 8 19                          # vector_overlap_i32.c:8:19
	add	a3, a3, a4
	.loc	0 8 26                          # vector_overlap_i32.c:8:26
	add	a3, a3, a2
	.loc	0 8 10                          # vector_overlap_i32.c:8:10
	sw	a3, 20(a1)
	li	a3, 6
.Ltmp33:
	.loc	0 7 3 is_stmt 1                 # vector_overlap_i32.c:7:3
	beq	a6, a3, .LBB0_13
.Ltmp34:
# %bb.12:                               # %for.body.epil.6
	#DEBUG_VALUE: i <- undef
	.loc	0 8 12                          # vector_overlap_i32.c:8:12
	lw	a3, 20(a0)
	.loc	0 8 19 is_stmt 0                # vector_overlap_i32.c:8:19
	add	a2, a2, a3
	.loc	0 8 28                          # vector_overlap_i32.c:8:28
	lw	a0, 28(a0)
	.loc	0 8 26                          # vector_overlap_i32.c:8:26
	add	a0, a0, a2
	.loc	0 8 10                          # vector_overlap_i32.c:8:10
	sw	a0, 24(a1)
.Ltmp35:
	#DEBUG_VALUE: i <- [DW_OP_plus_uconst 7, DW_OP_stack_value] undef
.LBB0_13:                               # %for.cond.cleanup
	.loc	0 10 1 is_stmt 1                # vector_overlap_i32.c:10:1
	ret
.Ltmp36:
.Lfunc_end0:
	.size	vector_overlap, .Lfunc_end0-vector_overlap
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
	.uleb128 .Ltmp20-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp21-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp4-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp0-.Lfunc_begin0           #   starting offset
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
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	1                               # 1
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp10-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp11-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	2                               # 2
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp11-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp12-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	3                               # 3
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp13-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	4                               # 4
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp15-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	5                               # 5
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp15-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp16-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	6                               # 6
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp16-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp17-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	117                             # DW_OP_breg5
	.byte	7                               # 7
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp17-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp18-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp19-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp22-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
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
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
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
	.byte	1                               # Abbrev [1] 0xc:0x65 DW_TAG_compile_unit
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
	.byte	2                               # Abbrev [2] 0x27:0x37 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x32:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.word	94                              # DW_AT_type
	.byte	3                               # Abbrev [3] 0x3b:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.word	94                              # DW_AT_type
	.byte	3                               # Abbrev [3] 0x44:0x9 DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.word	108                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x4d:0x10 DW_TAG_lexical_block
	.byte	1                               # DW_AT_low_pc
	.word	.Ltmp35-.Ltmp0                  # DW_AT_high_pc
	.byte	5                               # Abbrev [5] 0x53:0x9 DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.word	104                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x5e:0x5 DW_TAG_restrict_type
	.word	99                              # DW_AT_type
	.byte	7                               # Abbrev [7] 0x63:0x5 DW_TAG_pointer_type
	.word	104                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x68:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x6c:0x4 DW_TAG_base_type
	.byte	8                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.word	44                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"vector_overlap_i32.c"          # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=129
.Linfo_string3:
	.asciz	"vector_overlap"                # string offset=176
.Linfo_string4:
	.asciz	"a"                             # string offset=191
.Linfo_string5:
	.asciz	"int"                           # string offset=193
.Linfo_string6:
	.asciz	"b"                             # string offset=197
.Linfo_string7:
	.asciz	"N"                             # string offset=199
.Linfo_string8:
	.asciz	"unsigned int"                  # string offset=201
.Linfo_string9:
	.asciz	"i"                             # string offset=214
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
	.quad	.Ltmp0
.Ldebug_addr_end0:
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
