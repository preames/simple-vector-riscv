	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbs1p0_zve32x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"sparsevec_reduce_add_i32.c"
	.text
	.globl	sparsevec_reduce_add_i32        # -- Begin function sparsevec_reduce_add_i32
	.p2align	1
	.type	sparsevec_reduce_add_i32,@function
sparsevec_reduce_add_i32:               # @sparsevec_reduce_add_i32
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "sparsevec_reduce_add_i32.c" md5 0x7e6d46ce21e8a6ae86fbd02dbbf034b0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: sparsevec_reduce_add_i32:len <- $x10
	#DEBUG_VALUE: sparsevec_reduce_add_i32:a <- $x11
	#DEBUG_VALUE: sparsevec_reduce_add_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_reduce_add_i32:res <- 0
	#DEBUG_VALUE: i <- 0
	.loc	0 6 3 prologue_end              # sparsevec_reduce_add_i32.c:6:3
	beqz	a0, .LBB0_9
.Ltmp0:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_reduce_add_i32:res <- 0
	#DEBUG_VALUE: sparsevec_reduce_add_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_reduce_add_i32:a <- $x11
	#DEBUG_VALUE: sparsevec_reduce_add_i32:len <- $x10
	addi	sp, sp, -96
	.cfi_def_cfa_offset 96
	sd	s0, 88(sp)                      # 8-byte Folded Spill
	sd	s1, 80(sp)                      # 8-byte Folded Spill
	sd	s2, 72(sp)                      # 8-byte Folded Spill
	sd	s3, 64(sp)                      # 8-byte Folded Spill
	sd	s4, 56(sp)                      # 8-byte Folded Spill
	sd	s5, 48(sp)                      # 8-byte Folded Spill
	sd	s6, 40(sp)                      # 8-byte Folded Spill
	sd	s7, 32(sp)                      # 8-byte Folded Spill
	sd	s8, 24(sp)                      # 8-byte Folded Spill
	sd	s9, 16(sp)                      # 8-byte Folded Spill
	sd	s10, 8(sp)                      # 8-byte Folded Spill
	sd	s11, 0(sp)                      # 8-byte Folded Spill
	.cfi_offset s0, -8
	.cfi_offset s1, -16
	.cfi_offset s2, -24
	.cfi_offset s3, -32
	.cfi_offset s4, -40
	.cfi_offset s5, -48
	.cfi_offset s6, -56
	.cfi_offset s7, -64
	.cfi_offset s8, -72
	.cfi_offset s9, -80
	.cfi_offset s10, -88
	.cfi_offset s11, -96
	li	a4, 16
.Ltmp1:
	.loc	0 6 26 is_stmt 0                # sparsevec_reduce_add_i32.c:6:26
	zext.w	a6, a0
.Ltmp2:
	.loc	0 6 3                           # sparsevec_reduce_add_i32.c:6:3
	bgeu	a0, a4, .LBB0_3
.Ltmp3:
# %bb.2:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_reduce_add_i32:res <- 0
	#DEBUG_VALUE: sparsevec_reduce_add_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_reduce_add_i32:a <- $x11
	#DEBUG_VALUE: sparsevec_reduce_add_i32:len <- $x10
	.loc	0 0 3                           # sparsevec_reduce_add_i32.c:0:3
	li	a7, 0
	li	a0, 0
.Ltmp4:
	.loc	0 6 3                           # sparsevec_reduce_add_i32.c:6:3
	j	.LBB0_6
.Ltmp5:
.LBB0_3:                                # %vector.ph
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_reduce_add_i32:res <- 0
	#DEBUG_VALUE: sparsevec_reduce_add_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_reduce_add_i32:a <- $x11
	#DEBUG_VALUE: sparsevec_reduce_add_i32:len <- $x10
	andi	a7, a6, -16
	addi	a0, a7, -16
.Ltmp6:
	sh1add	a0, a0, a2
	vsetivli	zero, 8, e32, m2, ta, ma
	vmv.v.i	v8, 0
	addi	t0, a0, 32
	mv	a3, a2
	vmv.v.i	v10, 0
.Ltmp7:
.LBB0_4:                                # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_reduce_add_i32:res <- 0
	#DEBUG_VALUE: sparsevec_reduce_add_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_reduce_add_i32:a <- $x11
	.loc	0 7 14 is_stmt 1                # sparsevec_reduce_add_i32.c:7:14
	vle16.v	v12, (a3)
	addi	a5, a3, 16
	vle16.v	v13, (a5)
	.loc	0 7 12 is_stmt 0                # sparsevec_reduce_add_i32.c:7:12
	vsetivli	zero, 2, e16, mf2, ta, ma
	vmv.x.s	a5, v12
	vslidedown.vi	v14, v12, 1
	vslidedown.vi	v15, v12, 2
	vsetivli	zero, 4, e16, m1, ta, ma
	vslidedown.vi	v12, v12, 4
	vmv.x.s	t1, v14
	vmv.x.s	t2, v15
	vsetivli	zero, 2, e16, mf2, ta, ma
	vslidedown.vi	v14, v15, 1
	vmv.x.s	t6, v12
	vslidedown.vi	v15, v12, 1
	vslidedown.vi	v12, v12, 2
	vmv.x.s	t5, v13
	vmv.x.s	t3, v14
	vslidedown.vi	v14, v13, 1
	vmv.x.s	t4, v15
	vslidedown.vi	v15, v13, 2
	vsetivli	zero, 4, e16, m1, ta, ma
	vslidedown.vi	v13, v13, 4
	sh2add	a5, a5, a1
	vmv.x.s	s3, v12
	vsetivli	zero, 2, e16, mf2, ta, ma
	vslidedown.vi	v12, v12, 1
	vmv.x.s	s2, v14
	vmv.x.s	s4, v15
	vslidedown.vi	v14, v15, 1
	vmv.x.s	s1, v13
	vslidedown.vi	v15, v13, 1
	vslidedown.vi	v13, v13, 2
	sh2add	s6, t6, a1
	sh2add	a0, t2, a1
	sh2add	s0, t1, a1
	sh2add	t1, t5, a1
	lw	t2, 0(a5)
	vmv.x.s	s5, v12
	vmv.x.s	t5, v14
	vmv.x.s	t6, v15
	vmv.x.s	s9, v13
	vslidedown.vi	v12, v13, 1
	sh2add	s3, s3, a1
	sh2add	t4, t4, a1
	sh2add	s10, t3, a1
	sh2add	t3, s1, a1
	sh2add	s4, s4, a1
	sh2add	s11, s2, a1
	lw	s8, 0(s0)
	lw	s7, 0(a0)
	lw	s2, 0(s6)
	lw	t1, 0(t1)
	vmv.x.s	s0, v12
	sh2add	a5, s5, a1
	sh2add	a4, s9, a1
	sh2add	s1, t6, a1
	sh2add	a0, t5, a1
	lw	t5, 0(s10)
	lw	t4, 0(t4)
	lw	t6, 0(s3)
	lw	s3, 0(s11)
	lw	s4, 0(s4)
	lw	t3, 0(t3)
	sh2add	s0, s0, a1
	lw	a5, 0(a5)
	lw	a0, 0(a0)
	lw	s1, 0(s1)
	lw	a4, 0(a4)
	vsetivli	zero, 8, e32, m2, ta, ma
	vmv.v.x	v12, t2
	lw	s0, 0(s0)
	vslide1down.vx	v12, v12, s8
	vmv.v.x	v14, t1
	vslide1down.vx	v12, v12, s7
	vslide1down.vx	v14, v14, s3
	vslide1down.vx	v12, v12, t5
	vslide1down.vx	v14, v14, s4
	vslide1down.vx	v12, v12, s2
	vslide1down.vx	v14, v14, a0
	vslide1down.vx	v12, v12, t4
	vslide1down.vx	v14, v14, t3
	vslide1down.vx	v12, v12, t6
	vslide1down.vx	v14, v14, s1
	vslide1down.vx	v12, v12, a5
	vslide1down.vx	v14, v14, a4
	vslide1down.vx	v14, v14, s0
	.loc	0 7 9                           # sparsevec_reduce_add_i32.c:7:9
	vadd.vv	v8, v12, v8
	.loc	0 6 34 is_stmt 1                # sparsevec_reduce_add_i32.c:6:34
	addi	a3, a3, 32
	.loc	0 7 9                           # sparsevec_reduce_add_i32.c:7:9
	vadd.vv	v10, v14, v10
	.loc	0 6 34                          # sparsevec_reduce_add_i32.c:6:34
	bne	a3, t0, .LBB0_4
.Ltmp8:
# %bb.5:                                # %middle.block
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_reduce_add_i32:res <- 0
	#DEBUG_VALUE: sparsevec_reduce_add_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_reduce_add_i32:a <- $x11
	.loc	0 6 3 is_stmt 0                 # sparsevec_reduce_add_i32.c:6:3
	vadd.vv	v8, v10, v8
	vmv.s.x	v10, zero
	vredsum.vs	v8, v8, v10
	vmv.x.s	a0, v8
	beq	a7, a6, .LBB0_8
.Ltmp9:
.LBB0_6:                                # %for.body.preheader12
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: sparsevec_reduce_add_i32:res <- 0
	#DEBUG_VALUE: sparsevec_reduce_add_i32:aidx <- $x12
	#DEBUG_VALUE: sparsevec_reduce_add_i32:a <- $x11
	sh1add	a4, a7, a2
	sh1add	a2, a6, a2
.Ltmp10:
.LBB0_7:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: sparsevec_reduce_add_i32:a <- $x11
	#DEBUG_VALUE: sparsevec_reduce_add_i32:res <- $x10
	#DEBUG_VALUE: i <- [DW_OP_LLVM_arg 0, DW_OP_consts 2, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 2, DW_OP_div, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 7 14 is_stmt 1                # sparsevec_reduce_add_i32.c:7:14
	lh	a3, 0(a4)
	.loc	0 7 12 is_stmt 0                # sparsevec_reduce_add_i32.c:7:12
	sh2add	a3, a3, a1
	lw	a3, 0(a3)
	.loc	0 6 26 is_stmt 1                # sparsevec_reduce_add_i32.c:6:26
	addi	a4, a4, 2
	.loc	0 7 9                           # sparsevec_reduce_add_i32.c:7:9
	addw	a0, a0, a3
.Ltmp11:
	#DEBUG_VALUE: sparsevec_reduce_add_i32:res <- $x10
	#DEBUG_VALUE: i <- [DW_OP_LLVM_arg 0, DW_OP_consts 2, DW_OP_LLVM_arg 0, DW_OP_mul, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 2, DW_OP_div, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 6 3                           # sparsevec_reduce_add_i32.c:6:3
	bne	a4, a2, .LBB0_7
.Ltmp12:
.LBB0_8:
	#DEBUG_VALUE: sparsevec_reduce_add_i32:a <- $x11
	.loc	0 0 3 is_stmt 0                 # sparsevec_reduce_add_i32.c:0:3
	ld	s0, 88(sp)                      # 8-byte Folded Reload
	ld	s1, 80(sp)                      # 8-byte Folded Reload
	ld	s2, 72(sp)                      # 8-byte Folded Reload
	ld	s3, 64(sp)                      # 8-byte Folded Reload
	ld	s4, 56(sp)                      # 8-byte Folded Reload
	ld	s5, 48(sp)                      # 8-byte Folded Reload
	ld	s6, 40(sp)                      # 8-byte Folded Reload
	ld	s7, 32(sp)                      # 8-byte Folded Reload
	ld	s8, 24(sp)                      # 8-byte Folded Reload
	ld	s9, 16(sp)                      # 8-byte Folded Reload
	ld	s10, 8(sp)                      # 8-byte Folded Reload
	ld	s11, 0(sp)                      # 8-byte Folded Reload
	.cfi_restore s0
	.cfi_restore s1
	.cfi_restore s2
	.cfi_restore s3
	.cfi_restore s4
	.cfi_restore s5
	.cfi_restore s6
	.cfi_restore s7
	.cfi_restore s8
	.cfi_restore s9
	.cfi_restore s10
	.cfi_restore s11
	addi	sp, sp, 96
	.cfi_def_cfa_offset 0
.Ltmp13:
.LBB0_9:                                # %for.cond.cleanup
	#DEBUG_VALUE: sparsevec_reduce_add_i32:a <- $x11
	.loc	0 8 3 is_stmt 1                 # sparsevec_reduce_add_i32.c:8:3
	ret
.Ltmp14:
.Lfunc_end0:
	.size	sparsevec_reduce_add_i32, .Lfunc_end0-sparsevec_reduce_add_i32
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
	.uleb128 .Ltmp4-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp5-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	0                               # 0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp10-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp12-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
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
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
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
	.byte	1                               # Abbrev [1] 0xc:0x77 DW_TAG_compile_unit
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
	.byte	2                               # Abbrev [2] 0x27:0x45 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	108                             # DW_AT_type
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x36:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	5                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	112                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x3f:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	91
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	116                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x49:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	121                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x52:0x9 DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	108                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x5b:0x10 DW_TAG_lexical_block
	.byte	0                               # DW_AT_low_pc
	.word	.Ltmp12-.Lfunc_begin0           # DW_AT_high_pc
	.byte	5                               # Abbrev [5] 0x61:0x9 DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	11                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.word	112                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	7                               # Abbrev [7] 0x6c:0x4 DW_TAG_base_type
	.byte	4                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x70:0x4 DW_TAG_base_type
	.byte	6                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0x74:0x5 DW_TAG_pointer_type
	.word	108                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x79:0x5 DW_TAG_pointer_type
	.word	126                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x7e:0x4 DW_TAG_base_type
	.byte	9                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	2                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.word	52                              # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"sparsevec_reduce_add_i32.c"    # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=135
.Linfo_string3:
	.asciz	"sparsevec_reduce_add_i32"      # string offset=182
.Linfo_string4:
	.asciz	"int"                           # string offset=207
.Linfo_string5:
	.asciz	"len"                           # string offset=211
.Linfo_string6:
	.asciz	"unsigned int"                  # string offset=215
.Linfo_string7:
	.asciz	"a"                             # string offset=228
.Linfo_string8:
	.asciz	"aidx"                          # string offset=230
.Linfo_string9:
	.asciz	"short"                         # string offset=235
.Linfo_string10:
	.asciz	"res"                           # string offset=241
.Linfo_string11:
	.asciz	"i"                             # string offset=245
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
