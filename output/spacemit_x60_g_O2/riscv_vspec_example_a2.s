	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_b1p0_v1p0_zic64b1p0_zicbom1p0_zicbop1p0_zicboz1p0_ziccamoa1p0_ziccif1p0_zicclsm1p0_ziccrse1p0_zicntr2p0_zicond1p0_zicsr2p0_zifencei2p0_zihintpause2p0_zihpm2p0_zmmul1p0_za64rs1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zbc1p0_zbkc1p0_zbs1p0_zkt1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvkt1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl64b1p0_ssccptr1p0_sscofpmf1p0_sscounterenw1p0_sstc1p0_sstvala1p0_sstvecd1p0_svade1p0_svbare1p0_svinval1p0_svnapot1p0_svpbmt1p0"
	.file	"riscv_vspec_example_a2.c"
	.text
	.globl	example_a2                      # -- Begin function example_a2
	.p2align	1
	.type	example_a2,@function
example_a2:                             # @example_a2
.Lfunc_begin0:
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "riscv_vspec_example_a2.c" md5 0x9b02bf33947894ea8d46575568f36cee
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: example_a2:a <- $x10
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:n <- $x13
	#DEBUG_VALUE: i <- 0
	.loc	0 6 3 prologue_end              # riscv_vspec_example_a2.c:6:3
	beqz	a3, .LBB0_13
.Ltmp0:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: example_a2:n <- $x13
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 6 23 is_stmt 0                # riscv_vspec_example_a2.c:6:23
	zext.w	a6, a3
.Ltmp1:
	.loc	0 6 3                           # riscv_vspec_example_a2.c:6:3
	csrr	a4, vlenb
	slli	t1, a4, 1
	li	a3, 64
.Ltmp2:
	maxu	a3, t1, a3
	bgeu	a6, a3, .LBB0_8
.Ltmp3:
# %bb.2:
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 0 3                           # riscv_vspec_example_a2.c:0:3
	li	a7, 0
.Ltmp4:
.LBB0_3:                                # %for.body.preheader19
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 6 3 is_stmt 1                 # riscv_vspec_example_a2.c:6:3
	add	a5, a0, a7
	add	a2, a2, a7
.Ltmp5:
	add	a1, a1, a7
.Ltmp6:
	add	a0, a0, a6
.Ltmp7:
	.loc	0 0 3 is_stmt 0                 # riscv_vspec_example_a2.c:0:3
	li	a3, 4
	j	.LBB0_6
.Ltmp8:
.LBB0_4:                                # %cond.true
                                        #   in Loop: Header=BB0_6 Depth=1
	.loc	0 7 25 is_stmt 1                # riscv_vspec_example_a2.c:7:25
	lbu	a4, 0(a2)
.LBB0_5:                                # %cond.end
                                        #   in Loop: Header=BB0_6 Depth=1
	.loc	0 7 10 is_stmt 0                # riscv_vspec_example_a2.c:7:10
	sb	a4, 0(a1)
.Ltmp9:
	#DEBUG_VALUE: i <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 6 23 is_stmt 1                # riscv_vspec_example_a2.c:6:23
	addi	a5, a5, 1
	addi	a2, a2, 1
	addi	a1, a1, 1
.Ltmp10:
	.loc	0 6 3 is_stmt 0                 # riscv_vspec_example_a2.c:6:3
	beq	a5, a0, .LBB0_13
.Ltmp11:
.LBB0_6:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: i <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_minus, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 7 13 is_stmt 1                # riscv_vspec_example_a2.c:7:13
	lbu	a4, 0(a5)
	.loc	0 7 12 is_stmt 0                # riscv_vspec_example_a2.c:7:12
	bgeu	a3, a4, .LBB0_4
.Ltmp12:
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=1
	.loc	0 0 12                          # riscv_vspec_example_a2.c:0:12
	li	a4, 1
	.loc	0 7 12                          # riscv_vspec_example_a2.c:7:12
	j	.LBB0_5
.Ltmp13:
.LBB0_8:                                # %vector.memcheck
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 6 3 is_stmt 1                 # riscv_vspec_example_a2.c:6:3
	sub	a3, a1, a0
	li	a7, 0
	bltu	a3, t1, .LBB0_3
.Ltmp14:
# %bb.9:                                # %vector.memcheck
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	sub	a3, a1, a2
	bltu	a3, t1, .LBB0_3
.Ltmp15:
# %bb.10:                               # %vector.ph
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	neg	a3, t1
	and	a7, a3, a6
	sub	a3, a7, t1
	divu	a3, a3, t1
	srli	a4, a4, 3
	slli	a3, a3, 4
	addi	a3, a3, 16
	mul	t0, a3, a4
	add	t0, t0, a1
	vsetvli	a3, zero, e8, m2, ta, ma
	vmv.v.i	v8, 1
	mv	a5, a0
	mv	a4, a2
	mv	a3, a1
.Ltmp16:
.LBB0_11:                               # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 7 13                          # riscv_vspec_example_a2.c:7:13
	vl2r.v	v10, (a5)
	.loc	0 7 18 is_stmt 0                # riscv_vspec_example_a2.c:7:18
	vsetvli	zero, zero, e8, m2, ta, mu
	vmsleu.vi	v0, v10, 4
	.loc	0 7 25                          # riscv_vspec_example_a2.c:7:25
	vmv2r.v	v10, v8
	vle8.v	v10, (a4), v0.t
	.loc	0 7 10                          # riscv_vspec_example_a2.c:7:10
	vs2r.v	v10, (a3)
.Ltmp17:
	.loc	0 6 28 is_stmt 1                # riscv_vspec_example_a2.c:6:28
	add	a3, a3, t1
	add	a4, a4, t1
	add	a5, a5, t1
	bne	a3, t0, .LBB0_11
.Ltmp18:
# %bb.12:                               # %middle.block
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: example_a2:c <- $x12
	#DEBUG_VALUE: example_a2:b <- $x11
	#DEBUG_VALUE: example_a2:a <- $x10
	.loc	0 6 3 is_stmt 0                 # riscv_vspec_example_a2.c:6:3
	bne	a7, a6, .LBB0_3
.Ltmp19:
.LBB0_13:                               # %for.cond.cleanup
	.loc	0 9 1 is_stmt 1                 # riscv_vspec_example_a2.c:9:1
	ret
.Ltmp20:
.Lfunc_end0:
	.size	example_a2, .Lfunc_end0-example_a2
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
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp19-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp19-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp5-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp19-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # DW_OP_reg13
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc4:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp8-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp19-.Lfunc_begin0          #   ending offset
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
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
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
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.word	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.half	5                               # DWARF version number
	.byte	1                               # DWARF Unit Type
	.byte	8                               # Address Size (in bytes)
	.word	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	1                               # Abbrev [1] 0xc:0x69 DW_TAG_compile_unit
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
	.byte	2                               # Abbrev [2] 0x27:0x40 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x32:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	103                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x3b:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	103                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x44:0x9 DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	103                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x4d:0x9 DW_TAG_formal_parameter
	.byte	3                               # DW_AT_location
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.word	112                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x56:0x10 DW_TAG_lexical_block
	.byte	0                               # DW_AT_low_pc
	.word	.Ltmp19-.Lfunc_begin0           # DW_AT_high_pc
	.byte	5                               # Abbrev [5] 0x5c:0x9 DW_TAG_variable
	.byte	4                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.word	112                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x67:0x5 DW_TAG_pointer_type
	.word	108                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x6c:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	8                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	7                               # Abbrev [7] 0x70:0x4 DW_TAG_base_type
	.byte	9                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
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
	.asciz	"riscv_vspec_example_a2.c"      # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=133
.Linfo_string3:
	.asciz	"example_a2"                    # string offset=180
.Linfo_string4:
	.asciz	"a"                             # string offset=191
.Linfo_string5:
	.asciz	"char"                          # string offset=193
.Linfo_string6:
	.asciz	"b"                             # string offset=198
.Linfo_string7:
	.asciz	"c"                             # string offset=200
.Linfo_string8:
	.asciz	"n"                             # string offset=202
.Linfo_string9:
	.asciz	"unsigned int"                  # string offset=204
.Linfo_string10:
	.asciz	"i"                             # string offset=217
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
