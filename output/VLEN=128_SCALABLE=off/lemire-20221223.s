	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicsr2p0_zifencei2p0_zba1p0_zbb1p0_zbc1p0_zbs1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"lemire-20221223.c"
	.globl	encode_byte_table
	.p2align	1
	.type	encode_byte_table,@function
encode_byte_table:
	beqz	a1, .LBB0_6
	li	a3, 16
	bltu	a1, a3, .LBB0_3
	sh1add	a3, a1, a2
	add	a4, a0, a1
	sltu	a4, a2, a4
	sltu	a3, a0, a3
	and	a3, a3, a4
	beqz	a3, .LBB0_7
.LBB0_3:
	li	a6, 0
	mv	a3, a2
.LBB0_4:
	sub	a1, a1, a6
	add	a0, a0, a6
	lui	a2, %hi(.L__const.encode_byte_table.table)
	addi	a2, a2, %lo(.L__const.encode_byte_table.table)
.LBB0_5:
	lbu	a4, 0(a0)
	sh1add	a4, a4, a2
	lh	a4, 0(a4)
	sb	a4, 0(a3)
	srli	a4, a4, 8
	sb	a4, 1(a3)
	addi	a3, a3, 2
	addi	a1, a1, -1
	addi	a0, a0, 1
	bnez	a1, .LBB0_5
.LBB0_6:
	ret
.LBB0_7:
	andi	a6, a1, -16
	sh1add	a3, a6, a2
	lui	a4, %hi(.L__const.encode_byte_table.table)
	addi	t0, a4, %lo(.L__const.encode_byte_table.table)
	li	a7, 32
	mv	a4, a6
	mv	a5, a0
.LBB0_8:
	vsetivli	zero, 16, e64, m8, ta, ma
	vle8.v	v8, (a5)
	vzext.vf8	v16, v8
	vadd.vv	v8, v16, v16
	vsetvli	zero, zero, e16, m2, ta, ma
	vluxei64.v	v16, (t0), v8
	vsetvli	zero, a7, e8, m2, ta, ma
	vse8.v	v16, (a2)
	addi	a5, a5, 16
	addi	a4, a4, -16
	addi	a2, a2, 32
	bnez	a4, .LBB0_8
	bne	a6, a1, .LBB0_4
	j	.LBB0_6
.Lfunc_end0:
	.size	encode_byte_table, .Lfunc_end0-encode_byte_table

	.globl	encode_nibble_table
	.p2align	1
	.type	encode_nibble_table,@function
encode_nibble_table:
	beqz	a1, .LBB1_6
	li	a3, 8
	bltu	a1, a3, .LBB1_3
	sh2add	a3, a1, a2
	add	a4, a0, a1
	sltu	a4, a2, a4
	sltu	a3, a0, a3
	and	a3, a3, a4
	beqz	a3, .LBB1_7
.LBB1_3:
	li	a6, 0
	mv	a3, a2
.LBB1_4:
	sub	a1, a1, a6
	add	a0, a0, a6
	lui	a2, %hi(.L__const.encode_nibble_table.table)
	addi	a2, a2, %lo(.L__const.encode_nibble_table.table)
.LBB1_5:
	lbu	a4, 0(a0)
	andi	a5, a4, 15
	sh1add	a5, a5, a2
	lhu	a5, 0(a5)
	srli	a4, a4, 3
	srliw	a4, a4, 1
	sh1add	a4, a4, a2
	lh	a4, 0(a4)
	sb	a5, 0(a3)
	sb	a4, 2(a3)
	srli	a5, a5, 8
	sb	a5, 1(a3)
	srli	a4, a4, 8
	sb	a4, 3(a3)
	addi	a3, a3, 4
	addi	a1, a1, -1
	addi	a0, a0, 1
	bnez	a1, .LBB1_5
.LBB1_6:
	ret
.LBB1_7:
	andi	a6, a1, -8
	sh2add	a3, a6, a2
	lui	a4, %hi(.L__const.encode_nibble_table.table)
	addi	t0, a4, %lo(.L__const.encode_nibble_table.table)
	li	a7, 32
	mv	a4, a6
	mv	a5, a0
.LBB1_8:
	vsetivli	zero, 8, e8, mf2, ta, ma
	vle8.v	v8, (a5)
	vand.vi	v9, v8, 15
	vsrl.vi	v8, v8, 4
	vsetvli	zero, zero, e64, m4, ta, ma
	vzext.vf8	v12, v9
	vadd.vv	v12, v12, v12
	vsetvli	zero, zero, e16, m1, ta, ma
	vluxei64.v	v9, (t0), v12
	vsetvli	zero, zero, e64, m4, ta, ma
	vzext.vf8	v12, v8
	vadd.vv	v12, v12, v12
	vsetvli	zero, zero, e16, m1, ta, ma
	vluxei64.v	v8, (t0), v12
	vsetvli	zero, zero, e32, m2, ta, ma
	vzext.vf2	v10, v9
	vzext.vf2	v12, v8
	vsll.vi	v8, v12, 16
	vor.vv	v8, v8, v10
	vsetvli	zero, a7, e8, m2, ta, ma
	vse8.v	v8, (a2)
	addi	a5, a5, 8
	addi	a4, a4, -8
	addi	a2, a2, 32
	bnez	a4, .LBB1_8
	bne	a6, a1, .LBB1_4
	j	.LBB1_6
.Lfunc_end1:
	.size	encode_nibble_table, .Lfunc_end1-encode_nibble_table

	.type	.L__const.encode_byte_table.table,@object
	.section	.rodata,"a",@progbits
	.p2align	1, 0x0
.L__const.encode_byte_table.table:
	.half	12336
	.half	12592
	.half	12848
	.half	13104
	.half	13360
	.half	13616
	.half	13872
	.half	14128
	.half	14384
	.half	14640
	.half	24880
	.half	25136
	.half	25392
	.half	25648
	.half	25904
	.half	26160
	.half	12337
	.half	12593
	.half	12849
	.half	13105
	.half	13361
	.half	13617
	.half	13873
	.half	14129
	.half	14385
	.half	14641
	.half	24881
	.half	25137
	.half	25393
	.half	25649
	.half	25905
	.half	26161
	.half	12338
	.half	12594
	.half	12850
	.half	13106
	.half	13362
	.half	13618
	.half	13874
	.half	14130
	.half	14386
	.half	14642
	.half	24882
	.half	25138
	.half	25394
	.half	25650
	.half	25906
	.half	26162
	.half	12339
	.half	12595
	.half	12851
	.half	13107
	.half	13363
	.half	13619
	.half	13875
	.half	14131
	.half	14387
	.half	14643
	.half	24883
	.half	25139
	.half	25395
	.half	25651
	.half	25907
	.half	26163
	.half	12340
	.half	12596
	.half	12852
	.half	13108
	.half	13364
	.half	13620
	.half	13876
	.half	14132
	.half	14388
	.half	14644
	.half	24884
	.half	25140
	.half	25396
	.half	25652
	.half	25908
	.half	26164
	.half	12341
	.half	12597
	.half	12853
	.half	13109
	.half	13365
	.half	13621
	.half	13877
	.half	14133
	.half	14389
	.half	14645
	.half	24885
	.half	25141
	.half	25397
	.half	25653
	.half	25909
	.half	26165
	.half	12342
	.half	12598
	.half	12854
	.half	13110
	.half	13366
	.half	13622
	.half	13878
	.half	14134
	.half	14390
	.half	14646
	.half	24886
	.half	25142
	.half	25398
	.half	25654
	.half	25910
	.half	26166
	.half	12343
	.half	12599
	.half	12855
	.half	13111
	.half	13367
	.half	13623
	.half	13879
	.half	14135
	.half	14391
	.half	14647
	.half	24887
	.half	25143
	.half	25399
	.half	25655
	.half	25911
	.half	26167
	.half	12344
	.half	12600
	.half	12856
	.half	13112
	.half	13368
	.half	13624
	.half	13880
	.half	14136
	.half	14392
	.half	14648
	.half	24888
	.half	25144
	.half	25400
	.half	25656
	.half	25912
	.half	26168
	.half	12345
	.half	12601
	.half	12857
	.half	13113
	.half	13369
	.half	13625
	.half	13881
	.half	14137
	.half	14393
	.half	14649
	.half	24889
	.half	25145
	.half	25401
	.half	25657
	.half	25913
	.half	26169
	.half	12385
	.half	12641
	.half	12897
	.half	13153
	.half	13409
	.half	13665
	.half	13921
	.half	14177
	.half	14433
	.half	14689
	.half	24929
	.half	25185
	.half	25441
	.half	25697
	.half	25953
	.half	26209
	.half	12386
	.half	12642
	.half	12898
	.half	13154
	.half	13410
	.half	13666
	.half	13922
	.half	14178
	.half	14434
	.half	14690
	.half	24930
	.half	25186
	.half	25442
	.half	25698
	.half	25954
	.half	26210
	.half	12387
	.half	12643
	.half	12899
	.half	13155
	.half	13411
	.half	13667
	.half	13923
	.half	14179
	.half	14435
	.half	14691
	.half	24931
	.half	25187
	.half	25443
	.half	25699
	.half	25955
	.half	26211
	.half	12388
	.half	12644
	.half	12900
	.half	13156
	.half	13412
	.half	13668
	.half	13924
	.half	14180
	.half	14436
	.half	14692
	.half	24932
	.half	25188
	.half	25444
	.half	25700
	.half	25956
	.half	26212
	.half	12389
	.half	12645
	.half	12901
	.half	13157
	.half	13413
	.half	13669
	.half	13925
	.half	14181
	.half	14437
	.half	14693
	.half	24933
	.half	25189
	.half	25445
	.half	25701
	.half	25957
	.half	26213
	.half	12390
	.half	12646
	.half	12902
	.half	13158
	.half	13414
	.half	13670
	.half	13926
	.half	14182
	.half	14438
	.half	14694
	.half	24934
	.half	25190
	.half	25446
	.half	25702
	.half	25958
	.half	26214
	.size	.L__const.encode_byte_table.table, 512

	.type	.L__const.encode_nibble_table.table,@object
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	1, 0x0
.L__const.encode_nibble_table.table:
	.half	102
	.half	101
	.half	100
	.half	99
	.half	98
	.half	97
	.half	57
	.half	56
	.half	55
	.half	54
	.half	53
	.half	52
	.half	51
	.half	50
	.half	49
	.half	48
	.size	.L__const.encode_nibble_table.table, 32

	.ident	"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 8c3a8d17c8a154894895c48a304a04df9ece4328)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
