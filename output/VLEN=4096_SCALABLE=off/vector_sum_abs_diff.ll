; ModuleID = 'vector_sum_abs_diff.c'
source_filename = "vector_sum_abs_diff.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64-unknown-unknown"

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn vscale_range(64,1024)
define dso_local signext i8 @sub(i8 noundef signext %a, i8 noundef signext %b) local_unnamed_addr #0 {
entry:
  %sub = sub i8 %a, %b
  ret i8 %sub
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone willreturn vscale_range(64,1024)
define dso_local signext i8 @myabs(i8 noundef signext %c) local_unnamed_addr #0 {
entry:
  %0 = tail call i8 @llvm.abs.i8(i8 %c, i1 false)
  ret i8 %0
}

; Function Attrs: argmemonly nofree nosync nounwind vscale_range(64,1024)
define dso_local void @vector_sum_abs_diff(ptr nocapture noundef writeonly %c, ptr nocapture noundef readonly %a, ptr nocapture noundef readonly %b, i32 noundef signext %N) local_unnamed_addr #1 {
entry:
  %cmp26.not = icmp ult i32 %N, 8
  br i1 %cmp26.not, label %for.cond.cleanup, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %entry
  %div23 = lshr i32 %N, 3
  %wide.trip.count = zext i32 %div23 to i64
  %min.iters.check = icmp ult i32 %N, 1024
  br i1 %min.iters.check, label %for.cond1.preheader.preheader50, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond1.preheader.preheader
  %0 = shl nuw nsw i64 %wide.trip.count, 2
  %uglygep = getelementptr i8, ptr %c, i64 %0
  %1 = shl nuw nsw i64 %wide.trip.count, 3
  %uglygep30 = getelementptr i8, ptr %a, i64 %1
  %uglygep31 = getelementptr i8, ptr %b, i64 %1
  %bound0 = icmp ugt ptr %uglygep30, %c
  %bound1 = icmp ugt ptr %uglygep, %a
  %found.conflict = and i1 %bound0, %bound1
  %bound032 = icmp ugt ptr %uglygep31, %c
  %bound133 = icmp ugt ptr %uglygep, %b
  %found.conflict34 = and i1 %bound032, %bound133
  %conflict.rdx = or i1 %found.conflict, %found.conflict34
  br i1 %conflict.rdx, label %for.cond1.preheader.preheader50, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %wide.trip.count, 536870784
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <128 x i64> [ <i64 0, i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7, i64 8, i64 9, i64 10, i64 11, i64 12, i64 13, i64 14, i64 15, i64 16, i64 17, i64 18, i64 19, i64 20, i64 21, i64 22, i64 23, i64 24, i64 25, i64 26, i64 27, i64 28, i64 29, i64 30, i64 31, i64 32, i64 33, i64 34, i64 35, i64 36, i64 37, i64 38, i64 39, i64 40, i64 41, i64 42, i64 43, i64 44, i64 45, i64 46, i64 47, i64 48, i64 49, i64 50, i64 51, i64 52, i64 53, i64 54, i64 55, i64 56, i64 57, i64 58, i64 59, i64 60, i64 61, i64 62, i64 63, i64 64, i64 65, i64 66, i64 67, i64 68, i64 69, i64 70, i64 71, i64 72, i64 73, i64 74, i64 75, i64 76, i64 77, i64 78, i64 79, i64 80, i64 81, i64 82, i64 83, i64 84, i64 85, i64 86, i64 87, i64 88, i64 89, i64 90, i64 91, i64 92, i64 93, i64 94, i64 95, i64 96, i64 97, i64 98, i64 99, i64 100, i64 101, i64 102, i64 103, i64 104, i64 105, i64 106, i64 107, i64 108, i64 109, i64 110, i64 111, i64 112, i64 113, i64 114, i64 115, i64 116, i64 117, i64 118, i64 119, i64 120, i64 121, i64 122, i64 123, i64 124, i64 125, i64 126, i64 127>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %2 = shl <128 x i64> %vec.ind, <i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3>
  %3 = getelementptr inbounds i8, ptr %a, <128 x i64> %2
  %wide.masked.gather = tail call <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr> %3, i32 1, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i8> poison), !tbaa !4, !alias.scope !7
  %4 = getelementptr inbounds i8, ptr %b, <128 x i64> %2
  %wide.masked.gather35 = tail call <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr> %4, i32 1, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i8> poison), !tbaa !4, !alias.scope !10
  %5 = sub <128 x i8> %wide.masked.gather, %wide.masked.gather35
  %6 = tail call <128 x i8> @llvm.abs.v128i8(<128 x i8> %5, i1 false)
  %7 = sext <128 x i8> %6 to <128 x i32>
  %8 = or <128 x i64> %2, <i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1>
  %9 = getelementptr inbounds i8, ptr %a, <128 x i64> %8
  %wide.masked.gather36 = tail call <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr> %9, i32 1, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i8> poison), !tbaa !4, !alias.scope !7
  %10 = getelementptr inbounds i8, ptr %b, <128 x i64> %8
  %wide.masked.gather37 = tail call <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr> %10, i32 1, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i8> poison), !tbaa !4, !alias.scope !10
  %11 = sub <128 x i8> %wide.masked.gather36, %wide.masked.gather37
  %12 = tail call <128 x i8> @llvm.abs.v128i8(<128 x i8> %11, i1 false)
  %13 = sext <128 x i8> %12 to <128 x i32>
  %14 = add nsw <128 x i32> %7, %13
  %15 = or <128 x i64> %2, <i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2>
  %16 = getelementptr inbounds i8, ptr %a, <128 x i64> %15
  %wide.masked.gather38 = tail call <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr> %16, i32 1, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i8> poison), !tbaa !4, !alias.scope !7
  %17 = getelementptr inbounds i8, ptr %b, <128 x i64> %15
  %wide.masked.gather39 = tail call <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr> %17, i32 1, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i8> poison), !tbaa !4, !alias.scope !10
  %18 = sub <128 x i8> %wide.masked.gather38, %wide.masked.gather39
  %19 = tail call <128 x i8> @llvm.abs.v128i8(<128 x i8> %18, i1 false)
  %20 = sext <128 x i8> %19 to <128 x i32>
  %21 = add nsw <128 x i32> %14, %20
  %22 = or <128 x i64> %2, <i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3>
  %23 = getelementptr inbounds i8, ptr %a, <128 x i64> %22
  %wide.masked.gather40 = tail call <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr> %23, i32 1, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i8> poison), !tbaa !4, !alias.scope !7
  %24 = getelementptr inbounds i8, ptr %b, <128 x i64> %22
  %wide.masked.gather41 = tail call <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr> %24, i32 1, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i8> poison), !tbaa !4, !alias.scope !10
  %25 = sub <128 x i8> %wide.masked.gather40, %wide.masked.gather41
  %26 = tail call <128 x i8> @llvm.abs.v128i8(<128 x i8> %25, i1 false)
  %27 = sext <128 x i8> %26 to <128 x i32>
  %28 = add nsw <128 x i32> %21, %27
  %29 = or <128 x i64> %2, <i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4>
  %30 = getelementptr inbounds i8, ptr %a, <128 x i64> %29
  %wide.masked.gather42 = tail call <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr> %30, i32 1, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i8> poison), !tbaa !4, !alias.scope !7
  %31 = getelementptr inbounds i8, ptr %b, <128 x i64> %29
  %wide.masked.gather43 = tail call <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr> %31, i32 1, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i8> poison), !tbaa !4, !alias.scope !10
  %32 = sub <128 x i8> %wide.masked.gather42, %wide.masked.gather43
  %33 = tail call <128 x i8> @llvm.abs.v128i8(<128 x i8> %32, i1 false)
  %34 = sext <128 x i8> %33 to <128 x i32>
  %35 = add nsw <128 x i32> %28, %34
  %36 = or <128 x i64> %2, <i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5>
  %37 = getelementptr inbounds i8, ptr %a, <128 x i64> %36
  %wide.masked.gather44 = tail call <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr> %37, i32 1, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i8> poison), !tbaa !4, !alias.scope !7
  %38 = getelementptr inbounds i8, ptr %b, <128 x i64> %36
  %wide.masked.gather45 = tail call <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr> %38, i32 1, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i8> poison), !tbaa !4, !alias.scope !10
  %39 = sub <128 x i8> %wide.masked.gather44, %wide.masked.gather45
  %40 = tail call <128 x i8> @llvm.abs.v128i8(<128 x i8> %39, i1 false)
  %41 = sext <128 x i8> %40 to <128 x i32>
  %42 = add nsw <128 x i32> %35, %41
  %43 = or <128 x i64> %2, <i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6>
  %44 = getelementptr inbounds i8, ptr %a, <128 x i64> %43
  %wide.masked.gather46 = tail call <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr> %44, i32 1, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i8> poison), !tbaa !4, !alias.scope !7
  %45 = getelementptr inbounds i8, ptr %b, <128 x i64> %43
  %wide.masked.gather47 = tail call <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr> %45, i32 1, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i8> poison), !tbaa !4, !alias.scope !10
  %46 = sub <128 x i8> %wide.masked.gather46, %wide.masked.gather47
  %47 = tail call <128 x i8> @llvm.abs.v128i8(<128 x i8> %46, i1 false)
  %48 = sext <128 x i8> %47 to <128 x i32>
  %49 = add nsw <128 x i32> %42, %48
  %50 = or <128 x i64> %2, <i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7>
  %51 = getelementptr inbounds i8, ptr %a, <128 x i64> %50
  %wide.masked.gather48 = tail call <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr> %51, i32 1, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i8> poison), !tbaa !4, !alias.scope !7
  %52 = getelementptr inbounds i8, ptr %b, <128 x i64> %50
  %wide.masked.gather49 = tail call <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr> %52, i32 1, <128 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <128 x i8> poison), !tbaa !4, !alias.scope !10
  %53 = sub <128 x i8> %wide.masked.gather48, %wide.masked.gather49
  %54 = tail call <128 x i8> @llvm.abs.v128i8(<128 x i8> %53, i1 false)
  %55 = sext <128 x i8> %54 to <128 x i32>
  %56 = add nsw <128 x i32> %49, %55
  %57 = getelementptr inbounds i32, ptr %c, i64 %index
  store <128 x i32> %56, ptr %57, align 4, !tbaa !12, !alias.scope !14, !noalias !16
  %index.next = add nuw i64 %index, 128
  %vec.ind.next = add <128 x i64> %vec.ind, <i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128, i64 128>
  %58 = icmp eq i64 %index.next, %n.vec
  br i1 %58, label %middle.block, label %vector.body, !llvm.loop !17

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for.cond.cleanup, label %for.cond1.preheader.preheader50

for.cond1.preheader.preheader50:                  ; preds = %vector.memcheck, %for.cond1.preheader.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.cond1.preheader.preheader ], [ %n.vec, %middle.block ]
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader50, %for.cond1.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond1.preheader ], [ %indvars.iv.ph, %for.cond1.preheader.preheader50 ]
  %59 = shl i64 %indvars.iv, 3
  %arrayidx = getelementptr inbounds i8, ptr %a, i64 %59
  %arrayidx6 = getelementptr inbounds i8, ptr %b, i64 %59
  %60 = load <8 x i8>, ptr %arrayidx, align 1, !tbaa !4
  %61 = load <8 x i8>, ptr %arrayidx6, align 1, !tbaa !4
  %62 = sub <8 x i8> %60, %61
  %63 = tail call <8 x i8> @llvm.abs.v8i8(<8 x i8> %62, i1 false)
  %64 = sext <8 x i8> %63 to <8 x i32>
  %65 = tail call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %64)
  %arrayidx12 = getelementptr inbounds i32, ptr %c, i64 %indvars.iv
  store i32 %65, ptr %arrayidx12, align 4, !tbaa !12
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.cond1.preheader, !llvm.loop !20

for.cond.cleanup:                                 ; preds = %for.cond1.preheader, %middle.block, %entry
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.abs.i8(i8, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind readonly willreturn
declare <128 x i8> @llvm.masked.gather.v128i8.v128p0(<128 x ptr>, i32 immarg, <128 x i1>, <128 x i8>) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <128 x i8> @llvm.abs.v128i8(<128 x i8>, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare <8 x i8> @llvm.abs.v8i8(<8 x i8>, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v8i32(<8 x i32>) #4

attributes #0 = { mustprogress nofree norecurse nosync nounwind readnone willreturn vscale_range(64,1024) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl1024b,+zvl128b,+zvl2048b,+zvl256b,+zvl32b,+zvl4096b,+zvl512b,+zvl64b,-save-restore" }
attributes #1 = { argmemonly nofree nosync nounwind vscale_range(64,1024) "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+v,+zba,+zbb,+zbc,+zbs,+zve32f,+zve32x,+zve64d,+zve64f,+zve64x,+zvl1024b,+zvl128b,+zvl2048b,+zvl256b,+zvl32b,+zvl4096b,+zvl512b,+zvl64b,-save-restore" }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readonly willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 6d859266803e2a9060c4e8770f92cc2c7bd05a3b)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8}
!8 = distinct !{!8, !9}
!9 = distinct !{!9, !"LVerDomain"}
!10 = !{!11}
!11 = distinct !{!11, !9}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !5, i64 0}
!14 = !{!15}
!15 = distinct !{!15, !9}
!16 = !{!8, !11}
!17 = distinct !{!17, !18, !19}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!"llvm.loop.isvectorized", i32 1}
!20 = distinct !{!20, !18, !19}
