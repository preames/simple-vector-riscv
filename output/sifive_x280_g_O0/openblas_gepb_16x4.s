	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zfh1p0_zfhmin1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvfh1p0_zvfhmin1p0_zvl128b1p0_zvl256b1p0_zvl32b1p0_zvl512b1p0_zvl64b1p0"
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
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
	sd	a0, -24(s0)
	sd	a1, -32(s0)
	sd	a2, -40(s0)
	li	a0, 0
.Ltmp0:
	.loc	0 6 13 prologue_end             # openblas_gepb_16x4.c:6:13
	sw	a0, -44(s0)
	.loc	0 6 9 is_stmt 0                 # openblas_gepb_16x4.c:6:9
	j	.LBB0_1
.LBB0_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
.Ltmp1:
	.loc	0 6 21                          # openblas_gepb_16x4.c:6:21
	lw	a1, -44(s0)
	li	a0, 3
.Ltmp2:
	.loc	0 6 5                           # openblas_gepb_16x4.c:6:5
	blt	a0, a1, .LBB0_8
	j	.LBB0_2
.LBB0_2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	0 0 5                           # openblas_gepb_16x4.c:0:5
	li	a0, 0
.Ltmp3:
	.loc	0 7 17 is_stmt 1                # openblas_gepb_16x4.c:7:17
	sw	a0, -48(s0)
	.loc	0 7 13 is_stmt 0                # openblas_gepb_16x4.c:7:13
	j	.LBB0_3
.LBB0_3:                                # %for.cond1
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp4:
	.loc	0 7 25                          # openblas_gepb_16x4.c:7:25
	lw	a1, -48(s0)
	li	a0, 15
.Ltmp5:
	.loc	0 7 9                           # openblas_gepb_16x4.c:7:9
	blt	a0, a1, .LBB0_6
	j	.LBB0_4
.LBB0_4:                                # %for.body3
                                        #   in Loop: Header=BB0_3 Depth=2
.Ltmp6:
	.loc	0 8 34 is_stmt 1                # openblas_gepb_16x4.c:8:34
	ld	a0, -24(s0)
	.loc	0 8 36 is_stmt 0                # openblas_gepb_16x4.c:8:36
	lw	a2, -48(s0)
	.loc	0 8 34                          # openblas_gepb_16x4.c:8:34
	sh2add	a0, a2, a0
	flw	fa5, 0(a0)
	.loc	0 8 42                          # openblas_gepb_16x4.c:8:42
	ld	a1, -32(s0)
	.loc	0 8 44                          # openblas_gepb_16x4.c:8:44
	lw	a0, -44(s0)
	.loc	0 8 42                          # openblas_gepb_16x4.c:8:42
	sh2add	a1, a0, a1
	flw	fa4, 0(a1)
	.loc	0 8 13                          # openblas_gepb_16x4.c:8:13
	ld	a1, -40(s0)
	.loc	0 8 17                          # openblas_gepb_16x4.c:8:17
	slliw	a0, a0, 4
	.loc	0 8 26                          # openblas_gepb_16x4.c:8:26
	addw	a0, a0, a2
	.loc	0 8 13                          # openblas_gepb_16x4.c:8:13
	sh2add	a0, a0, a1
	.loc	0 8 31                          # openblas_gepb_16x4.c:8:31
	flw	fa3, 0(a0)
	fmadd.s	fa5, fa5, fa4, fa3
	fsw	fa5, 0(a0)
	.loc	0 9 9 is_stmt 1                 # openblas_gepb_16x4.c:9:9
	j	.LBB0_5
.Ltmp7:
.LBB0_5:                                # %for.inc
                                        #   in Loop: Header=BB0_3 Depth=2
	.loc	0 7 42                          # openblas_gepb_16x4.c:7:42
	lw	a0, -48(s0)
	addiw	a0, a0, 1
	sw	a0, -48(s0)
	.loc	0 7 9 is_stmt 0                 # openblas_gepb_16x4.c:7:9
	j	.LBB0_3
.Ltmp8:
.LBB0_6:                                # %for.end
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	0 10 5 is_stmt 1                # openblas_gepb_16x4.c:10:5
	j	.LBB0_7
.Ltmp9:
.LBB0_7:                                # %for.inc9
                                        #   in Loop: Header=BB0_1 Depth=1
	.loc	0 6 38                          # openblas_gepb_16x4.c:6:38
	lw	a0, -44(s0)
	addiw	a0, a0, 1
	sw	a0, -44(s0)
	.loc	0 6 5 is_stmt 0                 # openblas_gepb_16x4.c:6:5
	j	.LBB0_1
.Ltmp10:
.LBB0_8:                                # %for.end11
	.loc	0 11 1 epilogue_begin is_stmt 1 # openblas_gepb_16x4.c:11:1
	addi	sp, s0, -48
	.cfi_def_cfa sp, 48
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	.cfi_restore ra
	.cfi_restore s0
	addi	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
.Ltmp11:
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
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
	.byte	1                               # Abbrev [1] 0xc:0x8a DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.half	29                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.word	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.word	.Laddr_table_base0              # DW_AT_addr_base
	.byte	2                               # Abbrev [2] 0x23:0x51 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	88
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x2e:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	104
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	116                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x39:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	96
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	116                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x44:0xb DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	88
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.word	135                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x4f:0x24 DW_TAG_lexical_block
	.byte	1                               # DW_AT_low_pc
	.word	.Ltmp10-.Ltmp0                  # DW_AT_high_pc
	.byte	5                               # Abbrev [5] 0x55:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	84
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.word	145                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x60:0x12 DW_TAG_lexical_block
	.byte	2                               # DW_AT_low_pc
	.word	.Ltmp8-.Ltmp3                   # DW_AT_high_pc
	.byte	5                               # Abbrev [5] 0x66:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	80
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.word	145                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x74:0x5 DW_TAG_restrict_type
	.word	121                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x79:0x5 DW_TAG_pointer_type
	.word	126                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x7e:0x5 DW_TAG_const_type
	.word	131                             # DW_AT_type
	.byte	9                               # Abbrev [9] 0x83:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	6                               # Abbrev [6] 0x87:0x5 DW_TAG_restrict_type
	.word	140                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x8c:0x5 DW_TAG_pointer_type
	.word	131                             # DW_AT_type
	.byte	9                               # Abbrev [9] 0x91:0x4 DW_TAG_base_type
	.byte	9                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
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
	.quad	.Ltmp0
	.quad	.Ltmp3
.Ldebug_addr_end0:
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
