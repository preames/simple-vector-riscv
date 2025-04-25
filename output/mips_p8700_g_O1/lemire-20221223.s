	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0_zcd1p0_zba1p0_zbb1p0_xmipscmov1p0_xmipslsp1p0"
	.file	"lemire-20221223.c"
	.file	0 "/home/preames/benchmarking/simple-vector-riscv" "lemire-20221223.c" md5 0x1589d70942404ece031ddb6f8039fa76
	.text
	.globl	encode_byte_table               # -- Begin function encode_byte_table
	.p2align	1
	.type	encode_byte_table,@function
encode_byte_table:                      # @encode_byte_table
.Lfunc_begin0:
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: encode_byte_table:source <- $x10
	#DEBUG_VALUE: encode_byte_table:len <- $x11
	#DEBUG_VALUE: encode_byte_table:target <- $x12
	#DEBUG_VALUE: i <- 0
	.loc	0 40 3 prologue_end             # lemire-20221223.c:40:3
	beqz	a1, .LBB0_3
.Ltmp0:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: encode_byte_table:target <- $x12
	#DEBUG_VALUE: encode_byte_table:len <- $x11
	#DEBUG_VALUE: encode_byte_table:source <- $x10
	sh1add	a1, a1, a2
.Ltmp1:
.Lpcrel_hi0:
	.loc	0 0 3 is_stmt 0                 # lemire-20221223.c:0:3
	auipc	a3, %pcrel_hi(.L__const.encode_byte_table.table)
	addi	a3, a3, %pcrel_lo(.Lpcrel_hi0)
.Ltmp2:
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: encode_byte_table:target <- $x12
	#DEBUG_VALUE: encode_byte_table:target <- $x12
	#DEBUG_VALUE: i <- undef
	.loc	0 41 27 is_stmt 1               # lemire-20221223.c:41:27
	lbu	a4, 0(a0)
	.loc	0 41 21 is_stmt 0               # lemire-20221223.c:41:21
	sh1add	a4, a4, a3
	lh	a4, 0(a4)
.Ltmp3:
	#DEBUG_VALUE: code <- $x14
	.loc	0 42 5 is_stmt 1                # lemire-20221223.c:42:5
	srli	a5, a4, 8
	sb	a4, 0(a2)
	sb	a5, 1(a2)
	.loc	0 43 12                         # lemire-20221223.c:43:12
	addi	a2, a2, 2
.Ltmp4:
	#DEBUG_VALUE: encode_byte_table:target <- $x12
	.loc	0 40 24                         # lemire-20221223.c:40:24
	addi	a0, a0, 1
.Ltmp5:
	.loc	0 40 3 is_stmt 0                # lemire-20221223.c:40:3
	bne	a2, a1, .LBB0_2
.Ltmp6:
.LBB0_3:                                # %for.cond.cleanup
	#DEBUG_VALUE: encode_byte_table:target <- $x12
	.loc	0 45 1 is_stmt 1                # lemire-20221223.c:45:1
	ret
.Ltmp7:
.Lfunc_end0:
	.size	encode_byte_table, .Lfunc_end0-encode_byte_table
	.cfi_endproc
                                        # -- End function
	.globl	encode_nibble_table             # -- Begin function encode_nibble_table
	.p2align	1
	.type	encode_nibble_table,@function
encode_nibble_table:                    # @encode_nibble_table
.Lfunc_begin1:
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: encode_nibble_table:source <- $x10
	#DEBUG_VALUE: encode_nibble_table:len <- $x11
	#DEBUG_VALUE: encode_nibble_table:target <- $x12
	#DEBUG_VALUE: i <- 0
	.loc	0 54 3 prologue_end             # lemire-20221223.c:54:3
	beqz	a1, .LBB1_3
.Ltmp8:
# %bb.1:                                # %for.body.preheader
	#DEBUG_VALUE: i <- 0
	#DEBUG_VALUE: encode_nibble_table:target <- $x12
	#DEBUG_VALUE: encode_nibble_table:len <- $x11
	#DEBUG_VALUE: encode_nibble_table:source <- $x10
	sh2add	a6, a1, a2
.Lpcrel_hi1:
	auipc	a3, %pcrel_hi(.L__const.encode_nibble_table.table)
	addi	a7, a3, %pcrel_lo(.Lpcrel_hi1)
.Ltmp9:
.LBB1_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: encode_nibble_table:target <- $x12
	#DEBUG_VALUE: encode_nibble_table:target <- $x12
	#DEBUG_VALUE: i <- undef
	.loc	0 55 17                         # lemire-20221223.c:55:17
	lbu	a4, 0(a0)
.Ltmp10:
	#DEBUG_VALUE: b <- undef
	.loc	0 56 22                         # lemire-20221223.c:56:22
	andi	a5, a4, 15
.Ltmp11:
	#DEBUG_VALUE: nib1 <- $x15
	#DEBUG_VALUE: nib2 <- undef
	.loc	0 73 24                         # lemire-20221223.c:73:24
	sh1add	a5, a5, a7
.Ltmp12:
	.loc	0 74 24                         # lemire-20221223.c:74:24
	srli	a4, a4, 3
	srliw	a4, a4, 1
	sh1add	a4, a4, a7
.Ltmp13:
	#DEBUG_VALUE: code2 <- undef
	.loc	0 73 24                         # lemire-20221223.c:73:24
	lhu	a5, 0(a5)
.Ltmp14:
	#DEBUG_VALUE: code1 <- undef
	.loc	0 75 32                         # lemire-20221223.c:75:32
	lh	a4, 0(a4)
.Ltmp15:
	#DEBUG_VALUE: temp <- undef
	.loc	0 76 7                          # lemire-20221223.c:76:7
	srli	a1, a5, 8
	srli	a3, a4, 8
	sb	a5, 0(a2)
	sb	a1, 1(a2)
	sb	a4, 2(a2)
	sb	a3, 3(a2)
	.loc	0 77 14                         # lemire-20221223.c:77:14
	addi	a2, a2, 4
.Ltmp16:
	#DEBUG_VALUE: encode_nibble_table:target <- $x12
	.loc	0 54 24                         # lemire-20221223.c:54:24
	addi	a0, a0, 1
.Ltmp17:
	.loc	0 54 3 is_stmt 0                # lemire-20221223.c:54:3
	bne	a2, a6, .LBB1_2
.Ltmp18:
.LBB1_3:                                # %for.cond.cleanup
	#DEBUG_VALUE: encode_nibble_table:target <- $x12
	.loc	0 80 1 is_stmt 1                # lemire-20221223.c:80:1
	ret
.Ltmp19:
.Lfunc_end1:
	.size	encode_nibble_table, .Lfunc_end1-encode_nibble_table
	.cfi_endproc
                                        # -- End function
	.type	.L__const.encode_byte_table.table,@object # @__const.encode_byte_table.table
	.section	.rodata,"a",@progbits
	.p2align	1, 0x0
.L__const.encode_byte_table.table:
	.half	12336                           # 0x3030
	.half	12592                           # 0x3130
	.half	12848                           # 0x3230
	.half	13104                           # 0x3330
	.half	13360                           # 0x3430
	.half	13616                           # 0x3530
	.half	13872                           # 0x3630
	.half	14128                           # 0x3730
	.half	14384                           # 0x3830
	.half	14640                           # 0x3930
	.half	24880                           # 0x6130
	.half	25136                           # 0x6230
	.half	25392                           # 0x6330
	.half	25648                           # 0x6430
	.half	25904                           # 0x6530
	.half	26160                           # 0x6630
	.half	12337                           # 0x3031
	.half	12593                           # 0x3131
	.half	12849                           # 0x3231
	.half	13105                           # 0x3331
	.half	13361                           # 0x3431
	.half	13617                           # 0x3531
	.half	13873                           # 0x3631
	.half	14129                           # 0x3731
	.half	14385                           # 0x3831
	.half	14641                           # 0x3931
	.half	24881                           # 0x6131
	.half	25137                           # 0x6231
	.half	25393                           # 0x6331
	.half	25649                           # 0x6431
	.half	25905                           # 0x6531
	.half	26161                           # 0x6631
	.half	12338                           # 0x3032
	.half	12594                           # 0x3132
	.half	12850                           # 0x3232
	.half	13106                           # 0x3332
	.half	13362                           # 0x3432
	.half	13618                           # 0x3532
	.half	13874                           # 0x3632
	.half	14130                           # 0x3732
	.half	14386                           # 0x3832
	.half	14642                           # 0x3932
	.half	24882                           # 0x6132
	.half	25138                           # 0x6232
	.half	25394                           # 0x6332
	.half	25650                           # 0x6432
	.half	25906                           # 0x6532
	.half	26162                           # 0x6632
	.half	12339                           # 0x3033
	.half	12595                           # 0x3133
	.half	12851                           # 0x3233
	.half	13107                           # 0x3333
	.half	13363                           # 0x3433
	.half	13619                           # 0x3533
	.half	13875                           # 0x3633
	.half	14131                           # 0x3733
	.half	14387                           # 0x3833
	.half	14643                           # 0x3933
	.half	24883                           # 0x6133
	.half	25139                           # 0x6233
	.half	25395                           # 0x6333
	.half	25651                           # 0x6433
	.half	25907                           # 0x6533
	.half	26163                           # 0x6633
	.half	12340                           # 0x3034
	.half	12596                           # 0x3134
	.half	12852                           # 0x3234
	.half	13108                           # 0x3334
	.half	13364                           # 0x3434
	.half	13620                           # 0x3534
	.half	13876                           # 0x3634
	.half	14132                           # 0x3734
	.half	14388                           # 0x3834
	.half	14644                           # 0x3934
	.half	24884                           # 0x6134
	.half	25140                           # 0x6234
	.half	25396                           # 0x6334
	.half	25652                           # 0x6434
	.half	25908                           # 0x6534
	.half	26164                           # 0x6634
	.half	12341                           # 0x3035
	.half	12597                           # 0x3135
	.half	12853                           # 0x3235
	.half	13109                           # 0x3335
	.half	13365                           # 0x3435
	.half	13621                           # 0x3535
	.half	13877                           # 0x3635
	.half	14133                           # 0x3735
	.half	14389                           # 0x3835
	.half	14645                           # 0x3935
	.half	24885                           # 0x6135
	.half	25141                           # 0x6235
	.half	25397                           # 0x6335
	.half	25653                           # 0x6435
	.half	25909                           # 0x6535
	.half	26165                           # 0x6635
	.half	12342                           # 0x3036
	.half	12598                           # 0x3136
	.half	12854                           # 0x3236
	.half	13110                           # 0x3336
	.half	13366                           # 0x3436
	.half	13622                           # 0x3536
	.half	13878                           # 0x3636
	.half	14134                           # 0x3736
	.half	14390                           # 0x3836
	.half	14646                           # 0x3936
	.half	24886                           # 0x6136
	.half	25142                           # 0x6236
	.half	25398                           # 0x6336
	.half	25654                           # 0x6436
	.half	25910                           # 0x6536
	.half	26166                           # 0x6636
	.half	12343                           # 0x3037
	.half	12599                           # 0x3137
	.half	12855                           # 0x3237
	.half	13111                           # 0x3337
	.half	13367                           # 0x3437
	.half	13623                           # 0x3537
	.half	13879                           # 0x3637
	.half	14135                           # 0x3737
	.half	14391                           # 0x3837
	.half	14647                           # 0x3937
	.half	24887                           # 0x6137
	.half	25143                           # 0x6237
	.half	25399                           # 0x6337
	.half	25655                           # 0x6437
	.half	25911                           # 0x6537
	.half	26167                           # 0x6637
	.half	12344                           # 0x3038
	.half	12600                           # 0x3138
	.half	12856                           # 0x3238
	.half	13112                           # 0x3338
	.half	13368                           # 0x3438
	.half	13624                           # 0x3538
	.half	13880                           # 0x3638
	.half	14136                           # 0x3738
	.half	14392                           # 0x3838
	.half	14648                           # 0x3938
	.half	24888                           # 0x6138
	.half	25144                           # 0x6238
	.half	25400                           # 0x6338
	.half	25656                           # 0x6438
	.half	25912                           # 0x6538
	.half	26168                           # 0x6638
	.half	12345                           # 0x3039
	.half	12601                           # 0x3139
	.half	12857                           # 0x3239
	.half	13113                           # 0x3339
	.half	13369                           # 0x3439
	.half	13625                           # 0x3539
	.half	13881                           # 0x3639
	.half	14137                           # 0x3739
	.half	14393                           # 0x3839
	.half	14649                           # 0x3939
	.half	24889                           # 0x6139
	.half	25145                           # 0x6239
	.half	25401                           # 0x6339
	.half	25657                           # 0x6439
	.half	25913                           # 0x6539
	.half	26169                           # 0x6639
	.half	12385                           # 0x3061
	.half	12641                           # 0x3161
	.half	12897                           # 0x3261
	.half	13153                           # 0x3361
	.half	13409                           # 0x3461
	.half	13665                           # 0x3561
	.half	13921                           # 0x3661
	.half	14177                           # 0x3761
	.half	14433                           # 0x3861
	.half	14689                           # 0x3961
	.half	24929                           # 0x6161
	.half	25185                           # 0x6261
	.half	25441                           # 0x6361
	.half	25697                           # 0x6461
	.half	25953                           # 0x6561
	.half	26209                           # 0x6661
	.half	12386                           # 0x3062
	.half	12642                           # 0x3162
	.half	12898                           # 0x3262
	.half	13154                           # 0x3362
	.half	13410                           # 0x3462
	.half	13666                           # 0x3562
	.half	13922                           # 0x3662
	.half	14178                           # 0x3762
	.half	14434                           # 0x3862
	.half	14690                           # 0x3962
	.half	24930                           # 0x6162
	.half	25186                           # 0x6262
	.half	25442                           # 0x6362
	.half	25698                           # 0x6462
	.half	25954                           # 0x6562
	.half	26210                           # 0x6662
	.half	12387                           # 0x3063
	.half	12643                           # 0x3163
	.half	12899                           # 0x3263
	.half	13155                           # 0x3363
	.half	13411                           # 0x3463
	.half	13667                           # 0x3563
	.half	13923                           # 0x3663
	.half	14179                           # 0x3763
	.half	14435                           # 0x3863
	.half	14691                           # 0x3963
	.half	24931                           # 0x6163
	.half	25187                           # 0x6263
	.half	25443                           # 0x6363
	.half	25699                           # 0x6463
	.half	25955                           # 0x6563
	.half	26211                           # 0x6663
	.half	12388                           # 0x3064
	.half	12644                           # 0x3164
	.half	12900                           # 0x3264
	.half	13156                           # 0x3364
	.half	13412                           # 0x3464
	.half	13668                           # 0x3564
	.half	13924                           # 0x3664
	.half	14180                           # 0x3764
	.half	14436                           # 0x3864
	.half	14692                           # 0x3964
	.half	24932                           # 0x6164
	.half	25188                           # 0x6264
	.half	25444                           # 0x6364
	.half	25700                           # 0x6464
	.half	25956                           # 0x6564
	.half	26212                           # 0x6664
	.half	12389                           # 0x3065
	.half	12645                           # 0x3165
	.half	12901                           # 0x3265
	.half	13157                           # 0x3365
	.half	13413                           # 0x3465
	.half	13669                           # 0x3565
	.half	13925                           # 0x3665
	.half	14181                           # 0x3765
	.half	14437                           # 0x3865
	.half	14693                           # 0x3965
	.half	24933                           # 0x6165
	.half	25189                           # 0x6265
	.half	25445                           # 0x6365
	.half	25701                           # 0x6465
	.half	25957                           # 0x6565
	.half	26213                           # 0x6665
	.half	12390                           # 0x3066
	.half	12646                           # 0x3166
	.half	12902                           # 0x3266
	.half	13158                           # 0x3366
	.half	13414                           # 0x3466
	.half	13670                           # 0x3566
	.half	13926                           # 0x3666
	.half	14182                           # 0x3766
	.half	14438                           # 0x3866
	.half	14694                           # 0x3966
	.half	24934                           # 0x6166
	.half	25190                           # 0x6266
	.half	25446                           # 0x6366
	.half	25702                           # 0x6466
	.half	25958                           # 0x6566
	.half	26214                           # 0x6666
	.size	.L__const.encode_byte_table.table, 512

	.type	.L__const.encode_nibble_table.table,@object # @__const.encode_nibble_table.table
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	1, 0x0
.L__const.encode_nibble_table.table:
	.half	102                             # 0x66
	.half	101                             # 0x65
	.half	100                             # 0x64
	.half	99                              # 0x63
	.half	98                              # 0x62
	.half	97                              # 0x61
	.half	57                              # 0x39
	.half	56                              # 0x38
	.half	55                              # 0x37
	.half	54                              # 0x36
	.half	53                              # 0x35
	.half	52                              # 0x34
	.half	51                              # 0x33
	.half	50                              # 0x32
	.half	49                              # 0x31
	.half	48                              # 0x30
	.size	.L__const.encode_nibble_table.table, 32

	.section	.debug_loclists,"",@progbits
	.word	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.half	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.word	8                               # Offset entry count
.Lloclists_table_base0:
	.word	.Ldebug_loc0-.Lloclists_table_base0
	.word	.Ldebug_loc1-.Lloclists_table_base0
	.word	.Ldebug_loc2-.Lloclists_table_base0
	.word	.Ldebug_loc3-.Lloclists_table_base0
	.word	.Ldebug_loc4-.Lloclists_table_base0
	.word	.Ldebug_loc5-.Lloclists_table_base0
	.word	.Ldebug_loc6-.Lloclists_table_base0
	.word	.Ldebug_loc7-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp1-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp3-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # DW_OP_reg14
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc4:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin1-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	90                              # DW_OP_reg10
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc5:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin1-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	91                              # DW_OP_reg11
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc6:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin1-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp9-.Lfunc_begin0           #   ending offset
	.byte	2                               # Loc expr size
	.byte	48                              # DW_OP_lit0
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc7:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp11-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp12-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	95                              # DW_OP_reg15
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
	.byte	8                               # Abbreviation Code
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
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
	.byte	10                              # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	11                              # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	12                              # Abbreviation Code
	.byte	1                               # DW_TAG_array_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	13                              # Abbreviation Code
	.byte	33                              # DW_TAG_subrange_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	55                              # DW_AT_count
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	14                              # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	15                              # Abbreviation Code
	.byte	33                              # DW_TAG_subrange_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	55                              # DW_AT_count
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
	.byte	1                               # Abbrev [1] 0xc:0x150 DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.half	29                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.word	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end1-.Lfunc_begin0       # DW_AT_high_pc
	.word	.Laddr_table_base0              # DW_AT_addr_base
	.word	.Lloclists_table_base0          # DW_AT_loclists_base
	.byte	2                               # Abbrev [2] 0x27:0x8 DW_TAG_typedef
	.word	47                              # DW_AT_type
	.byte	4                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.byte	3                               # Abbrev [3] 0x2f:0x4 DW_TAG_base_type
	.byte	3                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	4                               # Abbrev [4] 0x33:0x50 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	5                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	5                               # Abbrev [5] 0x3e:0x9 DW_TAG_formal_parameter
	.byte	0                               # DW_AT_location
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
	.word	258                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x47:0x9 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
	.word	280                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0x50:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	92
	.byte	13                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
	.word	292                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x5a:0x8 DW_TAG_variable
	.byte	19                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	10                              # DW_AT_decl_line
	.word	313                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x62:0x20 DW_TAG_lexical_block
	.byte	0                               # DW_AT_low_pc
	.word	.Ltmp6-.Lfunc_begin0            # DW_AT_high_pc
	.byte	9                               # Abbrev [9] 0x68:0x9 DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	15                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	40                              # DW_AT_decl_line
	.word	280                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x71:0x10 DW_TAG_lexical_block
	.byte	1                               # DW_AT_low_pc
	.word	.Ltmp4-.Ltmp2                   # DW_AT_high_pc
	.byte	9                               # Abbrev [9] 0x77:0x9 DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	16                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	41                              # DW_AT_decl_line
	.word	301                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	4                               # Abbrev [4] 0x83:0x7f DW_TAG_subprogram
	.byte	2                               # DW_AT_low_pc
	.word	.Lfunc_end1-.Lfunc_begin1       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	82
                                        # DW_AT_call_all_calls
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	48                              # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	5                               # Abbrev [5] 0x8e:0x9 DW_TAG_formal_parameter
	.byte	4                               # DW_AT_location
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	48                              # DW_AT_decl_line
	.word	258                             # DW_AT_type
	.byte	5                               # Abbrev [5] 0x97:0x9 DW_TAG_formal_parameter
	.byte	5                               # DW_AT_location
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	48                              # DW_AT_decl_line
	.word	280                             # DW_AT_type
	.byte	6                               # Abbrev [6] 0xa0:0xa DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	92
	.byte	13                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	48                              # DW_AT_decl_line
	.word	292                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xaa:0x8 DW_TAG_variable
	.byte	19                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	49                              # DW_AT_decl_line
	.word	335                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0xb2:0x4f DW_TAG_lexical_block
	.byte	2                               # DW_AT_low_pc
	.word	.Ltmp18-.Lfunc_begin1           # DW_AT_high_pc
	.byte	9                               # Abbrev [9] 0xb8:0x9 DW_TAG_variable
	.byte	6                               # DW_AT_location
	.byte	15                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	54                              # DW_AT_decl_line
	.word	280                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0xc1:0x3f DW_TAG_lexical_block
	.byte	3                               # DW_AT_low_pc
	.word	.Ltmp16-.Ltmp9                  # DW_AT_high_pc
	.byte	9                               # Abbrev [9] 0xc7:0x9 DW_TAG_variable
	.byte	7                               # DW_AT_location
	.byte	21                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	56                              # DW_AT_decl_line
	.word	268                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xd0:0x8 DW_TAG_variable
	.byte	22                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	55                              # DW_AT_decl_line
	.word	268                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xd8:0x8 DW_TAG_variable
	.byte	23                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	57                              # DW_AT_decl_line
	.word	268                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0xe0:0x1f DW_TAG_lexical_block
	.byte	4                               # DW_AT_low_pc
	.word	.Ltmp16-.Ltmp11                 # DW_AT_high_pc
	.byte	7                               # Abbrev [7] 0xe6:0x8 DW_TAG_variable
	.byte	24                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	73                              # DW_AT_decl_line
	.word	301                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xee:0x8 DW_TAG_variable
	.byte	25                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	74                              # DW_AT_decl_line
	.word	301                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xf6:0x8 DW_TAG_variable
	.byte	26                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	75                              # DW_AT_decl_line
	.word	39                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	10                              # Abbrev [10] 0x102:0x5 DW_TAG_pointer_type
	.word	263                             # DW_AT_type
	.byte	11                              # Abbrev [11] 0x107:0x5 DW_TAG_const_type
	.word	268                             # DW_AT_type
	.byte	2                               # Abbrev [2] 0x10c:0x8 DW_TAG_typedef
	.word	276                             # DW_AT_type
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	2                               # DW_AT_decl_line
	.byte	3                               # Abbrev [3] 0x114:0x4 DW_TAG_base_type
	.byte	8                               # DW_AT_name
	.byte	8                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	2                               # Abbrev [2] 0x118:0x8 DW_TAG_typedef
	.word	288                             # DW_AT_type
	.byte	12                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.byte	3                               # Abbrev [3] 0x120:0x4 DW_TAG_base_type
	.byte	11                              # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	10                              # Abbrev [10] 0x124:0x5 DW_TAG_pointer_type
	.word	297                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x129:0x4 DW_TAG_base_type
	.byte	14                              # DW_AT_name
	.byte	8                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	2                               # Abbrev [2] 0x12d:0x8 DW_TAG_typedef
	.word	309                             # DW_AT_type
	.byte	18                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	3                               # DW_AT_decl_line
	.byte	3                               # Abbrev [3] 0x135:0x4 DW_TAG_base_type
	.byte	17                              # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	2                               # DW_AT_byte_size
	.byte	12                              # Abbrev [12] 0x139:0xd DW_TAG_array_type
	.word	326                             # DW_AT_type
	.byte	13                              # Abbrev [13] 0x13e:0x7 DW_TAG_subrange_type
	.word	331                             # DW_AT_type
	.half	256                             # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	11                              # Abbrev [11] 0x146:0x5 DW_TAG_const_type
	.word	301                             # DW_AT_type
	.byte	14                              # Abbrev [14] 0x14b:0x4 DW_TAG_base_type
	.byte	20                              # DW_AT_name
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # DW_AT_encoding
	.byte	12                              # Abbrev [12] 0x14f:0xc DW_TAG_array_type
	.word	326                             # DW_AT_type
	.byte	15                              # Abbrev [15] 0x154:0x6 DW_TAG_subrange_type
	.word	331                             # DW_AT_type
	.byte	16                              # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.word	112                             # Length of String Offsets Set
	.half	5
	.half	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)" # string offset=0
.Linfo_string1:
	.asciz	"lemire-20221223.c"             # string offset=108
.Linfo_string2:
	.asciz	"/home/preames/benchmarking/simple-vector-riscv" # string offset=126
.Linfo_string3:
	.asciz	"unsigned int"                  # string offset=173
.Linfo_string4:
	.asciz	"uint32_t"                      # string offset=186
.Linfo_string5:
	.asciz	"encode_byte_table"             # string offset=195
.Linfo_string6:
	.asciz	"encode_nibble_table"           # string offset=213
.Linfo_string7:
	.asciz	"source"                        # string offset=233
.Linfo_string8:
	.asciz	"unsigned char"                 # string offset=240
.Linfo_string9:
	.asciz	"uint8_t"                       # string offset=254
.Linfo_string10:
	.asciz	"len"                           # string offset=262
.Linfo_string11:
	.asciz	"unsigned long"                 # string offset=266
.Linfo_string12:
	.asciz	"size_t"                        # string offset=280
.Linfo_string13:
	.asciz	"target"                        # string offset=287
.Linfo_string14:
	.asciz	"char"                          # string offset=294
.Linfo_string15:
	.asciz	"i"                             # string offset=299
.Linfo_string16:
	.asciz	"code"                          # string offset=301
.Linfo_string17:
	.asciz	"unsigned short"                # string offset=306
.Linfo_string18:
	.asciz	"uint16_t"                      # string offset=321
.Linfo_string19:
	.asciz	"table"                         # string offset=330
.Linfo_string20:
	.asciz	"__ARRAY_SIZE_TYPE__"           # string offset=336
.Linfo_string21:
	.asciz	"nib1"                          # string offset=356
.Linfo_string22:
	.asciz	"b"                             # string offset=361
.Linfo_string23:
	.asciz	"nib2"                          # string offset=363
.Linfo_string24:
	.asciz	"code1"                         # string offset=368
.Linfo_string25:
	.asciz	"code2"                         # string offset=374
.Linfo_string26:
	.asciz	"temp"                          # string offset=380
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
	.word	.Linfo_string18
	.word	.Linfo_string19
	.word	.Linfo_string20
	.word	.Linfo_string21
	.word	.Linfo_string22
	.word	.Linfo_string23
	.word	.Linfo_string24
	.word	.Linfo_string25
	.word	.Linfo_string26
	.section	.debug_addr,"",@progbits
	.word	.Ldebug_addr_end0-.Ldebug_addr_start0 # Length of contribution
.Ldebug_addr_start0:
	.half	5                               # DWARF version number
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
.Laddr_table_base0:
	.quad	.Lfunc_begin0
	.quad	.Ltmp2
	.quad	.Lfunc_begin1
	.quad	.Ltmp9
	.quad	.Ltmp11
.Ldebug_addr_end0:
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git 2f7e674a3a2862bccde1dfdb190c3f08f4fa3307)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
