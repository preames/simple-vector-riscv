; ModuleID = 'lemire-20221223.c'
source_filename = "lemire-20221223.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

@__const.encode_byte_table.table = private unnamed_addr constant [256 x i16] [i16 12336, i16 12592, i16 12848, i16 13104, i16 13360, i16 13616, i16 13872, i16 14128, i16 14384, i16 14640, i16 24880, i16 25136, i16 25392, i16 25648, i16 25904, i16 26160, i16 12337, i16 12593, i16 12849, i16 13105, i16 13361, i16 13617, i16 13873, i16 14129, i16 14385, i16 14641, i16 24881, i16 25137, i16 25393, i16 25649, i16 25905, i16 26161, i16 12338, i16 12594, i16 12850, i16 13106, i16 13362, i16 13618, i16 13874, i16 14130, i16 14386, i16 14642, i16 24882, i16 25138, i16 25394, i16 25650, i16 25906, i16 26162, i16 12339, i16 12595, i16 12851, i16 13107, i16 13363, i16 13619, i16 13875, i16 14131, i16 14387, i16 14643, i16 24883, i16 25139, i16 25395, i16 25651, i16 25907, i16 26163, i16 12340, i16 12596, i16 12852, i16 13108, i16 13364, i16 13620, i16 13876, i16 14132, i16 14388, i16 14644, i16 24884, i16 25140, i16 25396, i16 25652, i16 25908, i16 26164, i16 12341, i16 12597, i16 12853, i16 13109, i16 13365, i16 13621, i16 13877, i16 14133, i16 14389, i16 14645, i16 24885, i16 25141, i16 25397, i16 25653, i16 25909, i16 26165, i16 12342, i16 12598, i16 12854, i16 13110, i16 13366, i16 13622, i16 13878, i16 14134, i16 14390, i16 14646, i16 24886, i16 25142, i16 25398, i16 25654, i16 25910, i16 26166, i16 12343, i16 12599, i16 12855, i16 13111, i16 13367, i16 13623, i16 13879, i16 14135, i16 14391, i16 14647, i16 24887, i16 25143, i16 25399, i16 25655, i16 25911, i16 26167, i16 12344, i16 12600, i16 12856, i16 13112, i16 13368, i16 13624, i16 13880, i16 14136, i16 14392, i16 14648, i16 24888, i16 25144, i16 25400, i16 25656, i16 25912, i16 26168, i16 12345, i16 12601, i16 12857, i16 13113, i16 13369, i16 13625, i16 13881, i16 14137, i16 14393, i16 14649, i16 24889, i16 25145, i16 25401, i16 25657, i16 25913, i16 26169, i16 12385, i16 12641, i16 12897, i16 13153, i16 13409, i16 13665, i16 13921, i16 14177, i16 14433, i16 14689, i16 24929, i16 25185, i16 25441, i16 25697, i16 25953, i16 26209, i16 12386, i16 12642, i16 12898, i16 13154, i16 13410, i16 13666, i16 13922, i16 14178, i16 14434, i16 14690, i16 24930, i16 25186, i16 25442, i16 25698, i16 25954, i16 26210, i16 12387, i16 12643, i16 12899, i16 13155, i16 13411, i16 13667, i16 13923, i16 14179, i16 14435, i16 14691, i16 24931, i16 25187, i16 25443, i16 25699, i16 25955, i16 26211, i16 12388, i16 12644, i16 12900, i16 13156, i16 13412, i16 13668, i16 13924, i16 14180, i16 14436, i16 14692, i16 24932, i16 25188, i16 25444, i16 25700, i16 25956, i16 26212, i16 12389, i16 12645, i16 12901, i16 13157, i16 13413, i16 13669, i16 13925, i16 14181, i16 14437, i16 14693, i16 24933, i16 25189, i16 25445, i16 25701, i16 25957, i16 26213, i16 12390, i16 12646, i16 12902, i16 13158, i16 13414, i16 13670, i16 13926, i16 14182, i16 14438, i16 14694, i16 24934, i16 25190, i16 25446, i16 25702, i16 25958, i16 26214], align 2
@__const.encode_nibble_table.table = private unnamed_addr constant [16 x i16] [i16 102, i16 101, i16 100, i16 99, i16 98, i16 97, i16 57, i16 56, i16 55, i16 54, i16 53, i16 52, i16 51, i16 50, i16 49, i16 48], align 2

; Function Attrs: nofree norecurse nosync nounwind memory(write, argmem: readwrite, inaccessiblemem: none) vscale_range(8,1024)
define dso_local void @encode_byte_table(ptr nocapture noundef readonly %source, i64 noundef %len, ptr nocapture noundef writeonly %target) local_unnamed_addr #0 {
entry:
  %cmp5.not = icmp eq i64 %len, 0
  br i1 %cmp5.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %0 = tail call i64 @llvm.vscale.i64()
  %1 = shl nuw nsw i64 %0, 2
  %2 = tail call i64 @llvm.umax.i64(i64 %1, i64 32)
  %min.iters.check = icmp ugt i64 %2, %len
  br i1 %min.iters.check, label %for.body.preheader10, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader
  %3 = shl i64 %len, 1
  %uglygep = getelementptr i8, ptr %target, i64 %3
  %uglygep8 = getelementptr i8, ptr %source, i64 %len
  %bound0 = icmp ugt ptr %uglygep8, %target
  %bound1 = icmp ugt ptr %uglygep, %source
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body.preheader10, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %4 = tail call i64 @llvm.vscale.i64()
  %5 = shl nuw nsw i64 %4, 2
  %n.mod.vf = urem i64 %len, %5
  %n.vec = sub nuw i64 %len, %n.mod.vf
  %6 = shl i64 %n.vec, 1
  %ind.end = getelementptr i8, ptr %target, i64 %6
  %7 = tail call i64 @llvm.vscale.i64()
  %8 = shl nuw nsw i64 %7, 2
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %9 = shl i64 %index, 1
  %next.gep = getelementptr i8, ptr %target, i64 %9
  %10 = getelementptr inbounds i8, ptr %source, i64 %index
  %wide.load = load <vscale x 4 x i8>, ptr %10, align 1, !tbaa !4, !alias.scope !7
  %11 = zext <vscale x 4 x i8> %wide.load to <vscale x 4 x i64>
  %12 = getelementptr inbounds [256 x i16], ptr @__const.encode_byte_table.table, i64 0, <vscale x 4 x i64> %11
  %wide.masked.gather = tail call <vscale x 4 x i16> @llvm.masked.gather.nxv4i16.nxv4p0(<vscale x 4 x ptr> %12, i32 2, <vscale x 4 x i1> shufflevector (<vscale x 4 x i1> insertelement (<vscale x 4 x i1> poison, i1 true, i32 0), <vscale x 4 x i1> poison, <vscale x 4 x i32> zeroinitializer), <vscale x 4 x i16> poison), !tbaa !10
  store <vscale x 4 x i16> %wide.masked.gather, ptr %next.gep, align 1, !alias.scope !12, !noalias !7
  %index.next = add nuw i64 %index, %8
  %13 = icmp eq i64 %index.next, %n.vec
  br i1 %13, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader10

for.body.preheader10:                             ; preds = %vector.memcheck, %for.body.preheader, %middle.block
  %target.addr.07.ph = phi ptr [ %target, %vector.memcheck ], [ %target, %for.body.preheader ], [ %ind.end, %middle.block ]
  %i.06.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader10, %for.body
  %target.addr.07 = phi ptr [ %add.ptr, %for.body ], [ %target.addr.07.ph, %for.body.preheader10 ]
  %i.06 = phi i64 [ %inc, %for.body ], [ %i.06.ph, %for.body.preheader10 ]
  %arrayidx = getelementptr inbounds i8, ptr %source, i64 %i.06
  %14 = load i8, ptr %arrayidx, align 1, !tbaa !4
  %idxprom = zext i8 %14 to i64
  %arrayidx1 = getelementptr inbounds [256 x i16], ptr @__const.encode_byte_table.table, i64 0, i64 %idxprom
  %15 = load i16, ptr %arrayidx1, align 2, !tbaa !10
  store i16 %15, ptr %target.addr.07, align 1
  %add.ptr = getelementptr inbounds i8, ptr %target.addr.07, i64 2
  %inc = add nuw i64 %i.06, 1
  %exitcond.not = icmp eq i64 %inc, %len
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !17
}

; Function Attrs: nofree norecurse nosync nounwind memory(write, argmem: readwrite, inaccessiblemem: none) vscale_range(8,1024)
define dso_local void @encode_nibble_table(ptr nocapture noundef readonly %source, i64 noundef %len, ptr nocapture noundef writeonly %target) local_unnamed_addr #0 {
entry:
  %cmp13.not = icmp eq i64 %len, 0
  br i1 %cmp13.not, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %0 = tail call i64 @llvm.vscale.i64()
  %1 = shl nuw nsw i64 %0, 1
  %2 = tail call i64 @llvm.umax.i64(i64 %1, i64 16)
  %min.iters.check = icmp ugt i64 %2, %len
  br i1 %min.iters.check, label %for.body.preheader19, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.preheader
  %3 = shl i64 %len, 2
  %uglygep = getelementptr i8, ptr %target, i64 %3
  %uglygep16 = getelementptr i8, ptr %source, i64 %len
  %bound0 = icmp ugt ptr %uglygep16, %target
  %bound1 = icmp ugt ptr %uglygep, %source
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body.preheader19, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %4 = tail call i64 @llvm.vscale.i64()
  %5 = shl nuw nsw i64 %4, 1
  %n.mod.vf = urem i64 %len, %5
  %n.vec = sub nuw i64 %len, %n.mod.vf
  %6 = shl i64 %n.vec, 2
  %ind.end = getelementptr i8, ptr %target, i64 %6
  %7 = tail call i64 @llvm.vscale.i64()
  %8 = shl nuw nsw i64 %7, 1
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %9 = shl i64 %index, 2
  %next.gep = getelementptr i8, ptr %target, i64 %9
  %10 = getelementptr inbounds i8, ptr %source, i64 %index
  %wide.load = load <vscale x 2 x i8>, ptr %10, align 1, !tbaa !4, !alias.scope !18
  %11 = and <vscale x 2 x i8> %wide.load, shufflevector (<vscale x 2 x i8> insertelement (<vscale x 2 x i8> poison, i8 15, i32 0), <vscale x 2 x i8> poison, <vscale x 2 x i32> zeroinitializer)
  %12 = lshr <vscale x 2 x i8> %wide.load, shufflevector (<vscale x 2 x i8> insertelement (<vscale x 2 x i8> poison, i8 4, i32 0), <vscale x 2 x i8> poison, <vscale x 2 x i32> zeroinitializer)
  %13 = zext <vscale x 2 x i8> %11 to <vscale x 2 x i64>
  %14 = getelementptr inbounds [16 x i16], ptr @__const.encode_nibble_table.table, i64 0, <vscale x 2 x i64> %13
  %wide.masked.gather = tail call <vscale x 2 x i16> @llvm.masked.gather.nxv2i16.nxv2p0(<vscale x 2 x ptr> %14, i32 2, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i16> poison), !tbaa !10
  %15 = zext <vscale x 2 x i8> %12 to <vscale x 2 x i64>
  %16 = getelementptr inbounds [16 x i16], ptr @__const.encode_nibble_table.table, i64 0, <vscale x 2 x i64> %15
  %wide.masked.gather18 = tail call <vscale x 2 x i16> @llvm.masked.gather.nxv2i16.nxv2p0(<vscale x 2 x ptr> %16, i32 2, <vscale x 2 x i1> shufflevector (<vscale x 2 x i1> insertelement (<vscale x 2 x i1> poison, i1 true, i32 0), <vscale x 2 x i1> poison, <vscale x 2 x i32> zeroinitializer), <vscale x 2 x i16> poison), !tbaa !10
  %17 = zext <vscale x 2 x i16> %wide.masked.gather to <vscale x 2 x i32>
  %18 = zext <vscale x 2 x i16> %wide.masked.gather18 to <vscale x 2 x i32>
  %19 = shl nuw <vscale x 2 x i32> %18, shufflevector (<vscale x 2 x i32> insertelement (<vscale x 2 x i32> poison, i32 16, i32 0), <vscale x 2 x i32> poison, <vscale x 2 x i32> zeroinitializer)
  %20 = or <vscale x 2 x i32> %19, %17
  store <vscale x 2 x i32> %20, ptr %next.gep, align 1, !alias.scope !21, !noalias !18
  %index.next = add nuw i64 %index, %8
  %21 = icmp eq i64 %index.next, %n.vec
  br i1 %21, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond.cleanup, label %for.body.preheader19

for.body.preheader19:                             ; preds = %vector.memcheck, %for.body.preheader, %middle.block
  %target.addr.015.ph = phi ptr [ %target, %vector.memcheck ], [ %target, %for.body.preheader ], [ %ind.end, %middle.block ]
  %i.014.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %middle.block, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader19, %for.body
  %target.addr.015 = phi ptr [ %add.ptr, %for.body ], [ %target.addr.015.ph, %for.body.preheader19 ]
  %i.014 = phi i64 [ %inc, %for.body ], [ %i.014.ph, %for.body.preheader19 ]
  %arrayidx = getelementptr inbounds i8, ptr %source, i64 %i.014
  %22 = load i8, ptr %arrayidx, align 1, !tbaa !4
  %and = and i8 %22, 15
  %23 = lshr i8 %22, 4
  %idxprom = zext i8 %and to i64
  %arrayidx4 = getelementptr inbounds [16 x i16], ptr @__const.encode_nibble_table.table, i64 0, i64 %idxprom
  %24 = load i16, ptr %arrayidx4, align 2, !tbaa !10
  %idxprom5 = zext i8 %23 to i64
  %arrayidx6 = getelementptr inbounds [16 x i16], ptr @__const.encode_nibble_table.table, i64 0, i64 %idxprom5
  %25 = load i16, ptr %arrayidx6, align 2, !tbaa !10
  %conv7 = zext i16 %24 to i32
  %conv8 = zext i16 %25 to i32
  %shl = shl nuw i32 %conv8, 16
  %or = or i32 %shl, %conv7
  store i32 %or, ptr %target.addr.015, align 1
  %add.ptr = getelementptr inbounds i8, ptr %target.addr.015, i64 4
  %inc = add nuw i64 %i.014, 1
  %exitcond.not = icmp eq i64 %inc, %len
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !24
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.vscale.i64() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umax.i64(i64, i64) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(read)
declare <vscale x 4 x i16> @llvm.masked.gather.nxv4i16.nxv4p0(<vscale x 4 x ptr>, i32 immarg, <vscale x 4 x i1>, <vscale x 4 x i16>) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(read)
declare <vscale x 2 x i16> @llvm.masked.gather.nxv2i16.nxv2p0(<vscale x 2 x ptr>, i32 immarg, <vscale x 2 x i1>, <vscale x 2 x i16>) #3

attributes #0 = { nofree norecurse nosync nounwind memory(write, argmem: readwrite, inaccessiblemem: none) vscale_range(8,1024) "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl128b,+zvl256b,+zvl32b,+zvl512b,+zvl64b,-save-restore" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 49caf7012170422afa84868598063818f9344228)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8}
!8 = distinct !{!8, !9}
!9 = distinct !{!9, !"LVerDomain"}
!10 = !{!11, !11, i64 0}
!11 = !{!"short", !5, i64 0}
!12 = !{!13}
!13 = distinct !{!13, !9}
!14 = distinct !{!14, !15, !16}
!15 = !{!"llvm.loop.mustprogress"}
!16 = !{!"llvm.loop.isvectorized", i32 1}
!17 = distinct !{!17, !15, !16}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !15, !16}
!24 = distinct !{!24, !15, !16}
