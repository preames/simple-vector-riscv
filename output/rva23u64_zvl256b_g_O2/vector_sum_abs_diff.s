	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zihintntl1p0_zihintpause2p0_zihpm2p0_zimop1p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zawrs1p0_zfa1p0_zfhmin1p0_zca1p0_zcb1p0_zcd1p0_zcmop1p0_zba1p0_zbb1p0_zbs1p0_zkt1p0_zvbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfhmin1p0_zvkb1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_supm1p0"
	.file	"vector_sum_abs_diff.c"
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "vector_sum_abs_diff.c" md5 0x35ff705e57d886c9c8cd065d825c538b
	.text
	.globl	sub                             # -- Begin function sub
	.p2align	1
	.type	sub,@function
sub:                                    # @sub
.Lfunc_begin0:
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: sub:a <- $x10
	#DEBUG_VALUE: sub:b <- $x11
	.loc	0 6 26 prologue_end             # vector_sum_abs_diff.c:6:26
	subw	a0, a0, a1
.Ltmp0:
	.loc	0 6 3 is_stmt 0                 # vector_sum_abs_diff.c:6:3
	sext.b	a0, a0
	ret
.Ltmp1:
.Lfunc_end0:
	.size	sub, .Lfunc_end0-sub
	.cfi_endproc
                                        # -- End function
	.globl	myabs                           # -- Begin function myabs
	.p2align	1
	.type	myabs,@function
myabs:                                  # @myabs
.Lfunc_begin1:
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: myabs:c <- $x10
	.loc	0 11 10 prologue_end is_stmt 1  # vector_sum_abs_diff.c:11:10
	neg	a1, a0
	max	a0, a0, a1
.Ltmp2:
	.loc	0 11 3 is_stmt 0                # vector_sum_abs_diff.c:11:3
	sext.b	a0, a0
	ret
.Ltmp3:
.Lfunc_end1:
	.size	myabs, .Lfunc_end1-myabs
	.cfi_endproc
                                        # -- End function
	.globl	vector_sum_abs_diff             # -- Begin function vector_sum_abs_diff
	.p2align	1
	.type	vector_sum_abs_diff,@function
vector_sum_abs_diff:                    # @vector_sum_abs_diff
.Lfunc_begin2:
	.loc	0 14 0 is_stmt 1                # vector_sum_abs_diff.c:14:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: vector_sum_abs_diff:c <- $x10
	#DEBUG_VALUE: vector_sum_abs_diff:a <- $x11
	#DEBUG_VALUE: vector_sum_abs_diff:b <- $x12
	#DEBUG_VALUE: vector_sum_abs_diff:N <- $x13
	srliw	a7, a3, 3
.Ltmp4:
	#DEBUG_VALUE: i <- 0
	.loc	0 15 3 prologue_end             # vector_sum_abs_diff.c:15:3
	beqz	a7, .LBB2_5
.Ltmp5:
# %bb.1:                                # %for.cond1.preheader.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_sum_abs_diff:N <- $x13
	#DEBUG_VALUE: vector_sum_abs_diff:b <- $x12
	#DEBUG_VALUE: vector_sum_abs_diff:a <- $x11
	#DEBUG_VALUE: vector_sum_abs_diff:c <- $x10
	csrr	a3, vlenb
.Ltmp6:
	srli	t1, a3, 1
	li	a4, 16
	maxu	a4, t1, a4
	sh2add	t3, a7, a0
	bgeu	a7, a4, .LBB2_6
.Ltmp7:
# %bb.2:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_sum_abs_diff:b <- $x12
	#DEBUG_VALUE: vector_sum_abs_diff:a <- $x11
	#DEBUG_VALUE: vector_sum_abs_diff:c <- $x10
	.loc	0 0 3 is_stmt 0                 # vector_sum_abs_diff.c:0:3
	li	a6, 0
.Ltmp8:
.LBB2_3:                                # %for.cond1.preheader.preheader49
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_sum_abs_diff:b <- $x12
	#DEBUG_VALUE: vector_sum_abs_diff:a <- $x11
	#DEBUG_VALUE: vector_sum_abs_diff:c <- $x10
	.loc	0 15 3 is_stmt 1                # vector_sum_abs_diff.c:15:3
	sh2add	a0, a6, a0
.Ltmp9:
	sh3add	a1, a6, a1
.Ltmp10:
	sh3add	a2, a6, a2
.Ltmp11:
	.loc	0 0 3 is_stmt 0                 # vector_sum_abs_diff.c:0:3
	vsetivli	zero, 8, e32, m1, ta, ma
	vmv.s.x	v8, zero
.Ltmp12:
.LBB2_4:                                # %for.cond1.preheader
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: i <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 4, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	#DEBUG_VALUE: myabs:c <- undef
	#DEBUG_VALUE: accum <- undef
	#DEBUG_VALUE: j <- 7
	#DEBUG_VALUE: idx <- [DW_OP_constu 7, DW_OP_or, DW_OP_stack_value] $x10
	.loc	0 19 22 is_stmt 1               # vector_sum_abs_diff.c:19:22
	vsetivli	zero, 8, e8, mf4, ta, ma
	vle8.v	v9, (a1)
	.loc	0 19 31 is_stmt 0               # vector_sum_abs_diff.c:19:31
	vle8.v	v10, (a2)
	.loc	0 19 29                         # vector_sum_abs_diff.c:19:29
	vsub.vv	v9, v9, v10
.Ltmp13:
	.loc	0 11 10 is_stmt 1               # vector_sum_abs_diff.c:11:10 @[ vector_sum_abs_diff.c:19:16 ]
	vrsub.vi	v10, v9, 0
	vmax.vv	v9, v9, v10
.Ltmp14:
	.loc	0 19 13                         # vector_sum_abs_diff.c:19:13
	vsetvli	zero, zero, e32, m1, ta, ma
	vsext.vf4	v10, v9
	vredsum.vs	v9, v10, v8
.Ltmp15:
	#DEBUG_VALUE: j <- 8
	.loc	0 21 10                         # vector_sum_abs_diff.c:21:10
	vsetivli	zero, 1, e32, m1, ta, ma
	vse32.v	v9, (a0)
.Ltmp16:
	#DEBUG_VALUE: i <- [DW_OP_LLVM_arg 0, DW_OP_consts 4, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 4, DW_OP_div, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 15 26                         # vector_sum_abs_diff.c:15:26
	addi	a0, a0, 4
.Ltmp17:
	addi	a1, a1, 8
	addi	a2, a2, 8
.Ltmp18:
	.loc	0 15 3 is_stmt 0                # vector_sum_abs_diff.c:15:3
	bne	a0, t3, .LBB2_4
.Ltmp19:
.LBB2_5:                                # %for.cond.cleanup
	.loc	0 23 1 is_stmt 1                # vector_sum_abs_diff.c:23:1
	ret
.LBB2_6:                                # %vector.memcheck
.Ltmp20:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_sum_abs_diff:b <- $x12
	#DEBUG_VALUE: vector_sum_abs_diff:a <- $x11
	#DEBUG_VALUE: vector_sum_abs_diff:c <- $x10
	.loc	0 15 3                          # vector_sum_abs_diff.c:15:3
	sh3add	a4, a7, a1
	sltu	a4, a0, a4
	sltu	a5, a1, t3
	and	a4, a4, a5
	li	a6, 0
	bnez	a4, .LBB2_3
.Ltmp21:
# %bb.7:                                # %vector.memcheck
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_sum_abs_diff:b <- $x12
	#DEBUG_VALUE: vector_sum_abs_diff:a <- $x11
	#DEBUG_VALUE: vector_sum_abs_diff:c <- $x10
	sh3add	a4, a7, a2
	sltu	a4, a0, a4
	sltu	a5, a2, t3
	and	a4, a4, a5
	bnez	a4, .LBB2_3
.Ltmp22:
# %bb.8:                                # %vector.ph
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_sum_abs_diff:b <- $x12
	#DEBUG_VALUE: vector_sum_abs_diff:a <- $x11
	#DEBUG_VALUE: vector_sum_abs_diff:c <- $x10
	srli	a3, a3, 3
	slli	a4, a3, 2
	neg	a4, a4
	and	a6, a4, a7
	slli	t0, a3, 4
	slli	t2, a3, 5
	mv	t4, a1
	mv	t5, a2
	mv	a3, a0
	mv	a4, a6
.Ltmp23:
.LBB2_9:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_sum_abs_diff:b <- $x12
	#DEBUG_VALUE: vector_sum_abs_diff:a <- $x11
	#DEBUG_VALUE: vector_sum_abs_diff:c <- $x10
	.loc	0 19 22                         # vector_sum_abs_diff.c:19:22
	vsetvli	a5, zero, e8, mf2, ta, ma
	vlseg8e8.v	v8, (t4)
	.loc	0 19 31 is_stmt 0               # vector_sum_abs_diff.c:19:31
	vlseg8e8.v	v16, (t5)
	.loc	0 19 29                         # vector_sum_abs_diff.c:19:29
	vsub.vv	v8, v8, v16
	vsub.vv	v9, v9, v17
	vsub.vv	v10, v10, v18
	vsub.vv	v11, v11, v19
	vsub.vv	v12, v12, v20
	vsub.vv	v13, v13, v21
	vsub.vv	v14, v14, v22
	vsub.vv	v15, v15, v23
.Ltmp24:
	.loc	0 15 34 is_stmt 1               # vector_sum_abs_diff.c:15:34
	sub	a4, a4, t1
	add	t5, t5, t2
.Ltmp25:
	.loc	0 11 10                         # vector_sum_abs_diff.c:11:10 @[ vector_sum_abs_diff.c:19:16 ]
	vrsub.vi	v16, v8, 0
	vrsub.vi	v17, v9, 0
	vrsub.vi	v18, v10, 0
	vrsub.vi	v19, v11, 0
	vrsub.vi	v20, v12, 0
	vrsub.vi	v21, v13, 0
	vrsub.vi	v22, v14, 0
	vrsub.vi	v23, v15, 0
	vmax.vv	v8, v8, v16
	vmax.vv	v9, v9, v17
	vmax.vv	v10, v10, v18
	vmax.vv	v11, v11, v19
	vmax.vv	v12, v12, v20
	vmax.vv	v13, v13, v21
	vmax.vv	v14, v14, v22
	vmax.vv	v15, v15, v23
.Ltmp26:
	.loc	0 19 16                         # vector_sum_abs_diff.c:19:16
	vsetvli	zero, zero, e16, m1, ta, ma
	vsext.vf2	v16, v8
	vsext.vf2	v17, v9
	vsext.vf2	v18, v10
	vsext.vf2	v10, v11
	vsext.vf2	v11, v12
	vsext.vf2	v12, v13
	vsext.vf2	v13, v14
	vsext.vf2	v14, v15
	.loc	0 19 13 is_stmt 0               # vector_sum_abs_diff.c:19:13
	vwadd.vv	v8, v16, v17
	vwadd.wv	v8, v8, v18
	vwadd.wv	v8, v8, v10
	vwadd.wv	v8, v8, v11
	vwadd.wv	v8, v8, v12
	vwadd.wv	v8, v8, v13
	vwadd.wv	v8, v8, v14
.Ltmp27:
	.loc	0 21 10 is_stmt 1               # vector_sum_abs_diff.c:21:10
	vs2r.v	v8, (a3)
.Ltmp28:
	.loc	0 15 34                         # vector_sum_abs_diff.c:15:34
	add	a3, a3, t0
	add	t4, t4, t2
	bnez	a4, .LBB2_9
.Ltmp29:
# %bb.10:                               # %middle.block
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: vector_sum_abs_diff:b <- $x12
	#DEBUG_VALUE: vector_sum_abs_diff:a <- $x11
	#DEBUG_VALUE: vector_sum_abs_diff:c <- $x10
	.loc	0 15 3 is_stmt 0                # vector_sum_abs_diff.c:15:3
	bne	a6, a7, .LBB2_3
	j	.LBB2_5
.Ltmp30:
.Lfunc_end2:
	.size	vector_sum_abs_diff, .Lfunc_end2-vector_sum_abs_diff
	.cfi_endproc
                                        # -- End function
	.section	.debug_loclists,"",@progbits
	.word	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	9                               # Offset entry count
.Lloclists_table_base0:
	.word	.Ldebug_loc0-.Lloclists_table_base0
	.word	.Ldebug_loc1-.Lloclists_table_base0
	.word	.Ldebug_loc2-.Lloclists_table_base0
	.word	.Ldebug_loc3-.Lloclists_table_base0
	.word	.Ldebug_loc4-.Lloclists_table_base0
	.word	.Ldebug_loc5-.Lloclists_table_base0
	.word	.Ldebug_loc6-.Lloclists_table_base0
	.word	.Ldebug_loc7-.Lloclists_table_base0
	.word	.Ldebug_loc8-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp0-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin1-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin2-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp20-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end2-.Lfunc_begin0      #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin2-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp20-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end2-.Lfunc_begin0      #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc4:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin2-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp11-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp20-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end2-.Lfunc_begin0      #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc5:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin2-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc6:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp4-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp12-.Lfunc_begin0          #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp20-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end2-.Lfunc_begin0      #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc7:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp15-.Lfunc_begin0          #   ending offset
	.byte	2                               # Loc expr size
	.byte	55                              # DW_OP_lit7
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp15-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp19-.Lfunc_begin0          #   ending offset
	.byte	2                               # Loc expr size
	.byte	56                              # DW_OP_lit8
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc8:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp17-.Lfunc_begin0          #   ending offset
	.byte	5                               # Loc expr size
	.byte	122                             # DW_OP_breg10
	.byte	0                               # 0
	.byte	55                              # DW_OP_lit7
	.byte	33                              # DW_OP_or
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
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
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
	.byte	4                               # Abbreviation Code
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
	.byte	5                               # Abbreviation Code
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
	.byte	6                               # Abbreviation Code
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
	.byte	7                               # Abbreviation Code
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
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
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
	.byte	32                              # DW_AT_inline
	.byte	33                              # DW_FORM_implicit_const
	.byte	1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	10                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
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
	.byte	11                              # Abbreviation Code
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
	.byte	12                              # Abbreviation Code
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	85                              # DW_AT_ranges
	.byte	35                              # DW_FORM_rnglistx
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	13                              # Abbreviation Code
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
	.byte	14                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
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
	.byte	15                              # Abbreviation Code
	.byte	29                              # DW_TAG_inlined_subroutine
	.byte	0                               # DW_CHILDREN_no
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	85                              # DW_AT_ranges
	.byte	35                              # DW_FORM_rnglistx
	.byte	88                              # DW_AT_call_file
	.byte	11                              # DW_FORM_data1
	.byte	89                              # DW_AT_call_line
	.byte	11                              # DW_FORM_data1
	.byte	87                              # DW_AT_call_column
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	16                              # Abbreviation Code
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
	.byte	1                               # Abbrev [1] 0xc:0xed DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.half	29                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.word	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end2-.Lfunc_begin0       # DW_AT_high_pc
	.word	.Laddr_table_base0              # DW_AT_addr_base
	.word	.Lrnglists_table_base0          # DW_AT_rnglists_base
	.word	.Lloclists_table_base0          # DW_AT_loclists_base
	.byte	2                               # Abbrev [2] 0x2b:0x8 DW_TAG_typedef
	.word	51                              # DW_AT_type
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	2                               # DW_AT_decl_line
	.byte	3                               # Abbrev [3] 0x33:0x4 DW_TAG_base_type
	.byte	3                               # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	3                               # Abbrev [3] 0x37:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	4                               # Abbrev [4] 0x3b:0x23 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	43                              # DW_AT_type
                                        # DW_AT_external
	.byte	5                               # Abbrev [5] 0x4a:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	43                              # DW_AT_type
	.byte	6                               # Abbrev [6] 0x53:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	91
	.byte	11                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	43                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x5e:0x13 DW_TAG_subprogram
	.byte	1                               # DW_AT_low_pc
	.word	.Lfunc_end1-.Lfunc_begin1       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.word	113                             # DW_AT_abstract_origin
	.byte	8                               # Abbrev [8] 0x6a:0x6 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.word	121                             # DW_AT_abstract_origin
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x71:0x11 DW_TAG_subprogram
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	43                              # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_inline
	.byte	10                              # Abbrev [10] 0x79:0x8 DW_TAG_formal_parameter
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
	.word	43                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	11                              # Abbrev [11] 0x82:0x68 DW_TAG_subprogram
	.byte	2                               # DW_AT_low_pc
	.word	.Lfunc_end2-.Lfunc_begin2       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	5                               # Abbrev [5] 0x8d:0x9 DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
	.word	234                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x96:0x9 DW_TAG_formal_parameter
	.byte	3                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
	.word	239                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x9f:0x9 DW_TAG_formal_parameter
	.byte	4                               # DW_AT_location
	.byte	11                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
	.word	239                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0xa8:0x9 DW_TAG_formal_parameter
	.byte	5                               # DW_AT_location
	.byte	12                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	14                              # DW_AT_decl_line
	.word	244                             # DW_AT_type
	.byte	12                              # Abbrev [12] 0xb1:0x38 DW_TAG_lexical_block
	.byte	0                               # DW_AT_ranges
	.byte	13                              # Abbrev [13] 0xb3:0x9 DW_TAG_variable
	.byte	6                               # DW_AT_location
	.byte	14                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	15                              # DW_AT_decl_line
	.word	244                             # DW_AT_type
	.byte	12                              # Abbrev [12] 0xbc:0x2c DW_TAG_lexical_block
	.byte	1                               # DW_AT_ranges
	.byte	14                              # Abbrev [14] 0xbe:0x8 DW_TAG_variable
	.byte	17                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	16                              # DW_AT_decl_line
	.word	55                              # DW_AT_type
	.byte	12                              # Abbrev [12] 0xc6:0x21 DW_TAG_lexical_block
	.byte	2                               # DW_AT_ranges
	.byte	13                              # Abbrev [13] 0xc8:0x9 DW_TAG_variable
	.byte	7                               # DW_AT_location
	.byte	15                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	17                              # DW_AT_decl_line
	.word	244                             # DW_AT_type
	.byte	12                              # Abbrev [12] 0xd1:0x15 DW_TAG_lexical_block
	.byte	2                               # DW_AT_ranges
	.byte	13                              # Abbrev [13] 0xd3:0x9 DW_TAG_variable
	.byte	8                               # DW_AT_location
	.byte	16                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	18                              # DW_AT_decl_line
	.word	244                             # DW_AT_type
	.byte	15                              # Abbrev [15] 0xdc:0x9 DW_TAG_inlined_subroutine
	.word	113                             # DW_AT_abstract_origin
	.byte	3                               # DW_AT_ranges
	.byte	0                               # DW_AT_call_file
	.byte	19                              # DW_AT_call_line
	.byte	16                              # DW_AT_call_column
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	16                              # Abbrev [16] 0xea:0x5 DW_TAG_pointer_type
	.word	55                              # DW_AT_type
	.byte	16                              # Abbrev [16] 0xef:0x5 DW_TAG_pointer_type
	.word	43                              # DW_AT_type
	.byte	3                               # Abbrev [3] 0xf4:0x4 DW_TAG_base_type
	.byte	13                              # DW_AT_name
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
	.word	4                               # Offset entry count
.Lrnglists_table_base0:
	.word	.Ldebug_ranges0-.Lrnglists_table_base0
	.word	.Ldebug_ranges1-.Lrnglists_table_base0
	.word	.Ldebug_ranges2-.Lrnglists_table_base0
	.word	.Ldebug_ranges3-.Lrnglists_table_base0
.Ldebug_ranges0:
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp4-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp19-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp20-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp30-.Lfunc_begin0          #   ending offset
	.byte	0                               # DW_RLE_end_of_list
.Ldebug_ranges1:
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp16-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp23-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp24-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp25-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp28-.Lfunc_begin0          #   ending offset
	.byte	0                               # DW_RLE_end_of_list
.Ldebug_ranges2:
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp12-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp15-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp23-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp24-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp25-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp27-.Lfunc_begin0          #   ending offset
	.byte	0                               # DW_RLE_end_of_list
.Ldebug_ranges3:
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp14-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp25-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp26-.Lfunc_begin0          #   ending offset
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
	.asciz	"vector_sum_abs_diff.c"         # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=130
.Linfo_string3:
	.asciz	"signed char"                   # string offset=177
.Linfo_string4:
	.asciz	"int8_t"                        # string offset=189
.Linfo_string5:
	.asciz	"int"                           # string offset=196
.Linfo_string6:
	.asciz	"myabs"                         # string offset=200
.Linfo_string7:
	.asciz	"c"                             # string offset=206
.Linfo_string8:
	.asciz	"sub"                           # string offset=208
.Linfo_string9:
	.asciz	"vector_sum_abs_diff"           # string offset=212
.Linfo_string10:
	.asciz	"a"                             # string offset=232
.Linfo_string11:
	.asciz	"b"                             # string offset=234
.Linfo_string12:
	.asciz	"N"                             # string offset=236
.Linfo_string13:
	.asciz	"unsigned int"                  # string offset=238
.Linfo_string14:
	.asciz	"i"                             # string offset=251
.Linfo_string15:
	.asciz	"j"                             # string offset=253
.Linfo_string16:
	.asciz	"idx"                           # string offset=255
.Linfo_string17:
	.asciz	"accum"                         # string offset=259
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
	.quad	.Lfunc_begin1
	.quad	.Lfunc_begin2
.Ldebug_addr_end0:
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
