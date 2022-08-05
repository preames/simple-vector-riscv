; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define dso_local void @vector_add_i32(ptr nocapture noundef %a, i32 noundef signext %a_len, i32 noundef signext %b) local_unnamed_addr #0 {
entry:
  %cmp.not4 = icmp eq i32 %a_len, 1
  br i1 %cmp.not4, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  %0 = sext i32 %a_len to i64
  %1 = add nsw i64 %0, -1
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %1, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i32, ptr %a, i64 %indvars.iv
  %2 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %add = add nsw i32 %2, %b
  store i32 %add, ptr %arrayidx, align 4, !tbaa !4
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %3 = and i64 %indvars.iv.next, 4294967295
  %cmp.not = icmp eq i64 %3, 0
  br i1 %cmp.not, label %for.cond.cleanup, label %for.body, !llvm.loop !8
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly
define dso_local signext i32 @vector_reduce_add_i32(ptr nocapture noundef readonly %a, i32 noundef signext %a_len) local_unnamed_addr #2 {
entry:
  %cmp4 = icmp sgt i32 %a_len, 0
  br i1 %cmp4, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %a_len to i64
  br label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  %sum.0.lcssa = phi i32 [ 0, %entry ], [ %add, %for.body ]
  ret i32 %sum.0.lcssa

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %sum.05 = phi i32 [ 0, %for.body.preheader ], [ %add, %for.body ]
  %arrayidx = getelementptr inbounds i32, ptr %a, i64 %indvars.iv
  %0 = load i32, ptr %arrayidx, align 4, !tbaa !4
  %add = add nsw i32 %0, %sum.05
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !llvm.loop !10
}

; Function Attrs: nofree nosync nounwind readnone
define dso_local signext i32 @main() local_unnamed_addr #3 {
entry:
  %a = alloca [2048 x i32], align 4
  call void @llvm.lifetime.start.p0(i64 8192, ptr nonnull %a) #5
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(8192) %a, i8 0, i64 8192, i1 false), !tbaa !4
  br label %for.body.i

for.body.i:                                       ; preds = %entry, %for.body.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 2047, %entry ]
  %arrayidx.i = getelementptr inbounds i32, ptr %a, i64 %indvars.iv.i
  %0 = load i32, ptr %arrayidx.i, align 4, !tbaa !4
  %add.i = add nsw i32 %0, 1
  store i32 %add.i, ptr %arrayidx.i, align 4, !tbaa !4
  %indvars.iv.next.i = add nsw i64 %indvars.iv.i, -1
  %1 = and i64 %indvars.iv.next.i, 4294967295
  %cmp.not.i = icmp eq i64 %1, 0
  br i1 %cmp.not.i, label %for.body.i12, label %for.body.i, !llvm.loop !8

for.body.i12:                                     ; preds = %for.body.i, %for.body.i12
  %indvars.iv.i8 = phi i64 [ %indvars.iv.next.i11, %for.body.i12 ], [ 0, %for.body.i ]
  %sum.05.i = phi i32 [ %add.i10, %for.body.i12 ], [ 0, %for.body.i ]
  %arrayidx.i9 = getelementptr inbounds i32, ptr %a, i64 %indvars.iv.i8
  %2 = load i32, ptr %arrayidx.i9, align 4, !tbaa !4
  %add.i10 = add nsw i32 %2, %sum.05.i
  %indvars.iv.next.i11 = add nuw nsw i64 %indvars.iv.i8, 1
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i11, 2048
  br i1 %exitcond.not.i, label %vector_reduce_add_i32.exit, label %for.body.i12, !llvm.loop !10

vector_reduce_add_i32.exit:                       ; preds = %for.body.i12
  %cmp2.not = icmp eq i32 %add.i10, 2048
  br i1 %cmp2.not, label %for.body.i18, label %cleanup

for.body.i18:                                     ; preds = %vector_reduce_add_i32.exit, %for.body.i18
  %indvars.iv.i13 = phi i64 [ %indvars.iv.next.i16, %for.body.i18 ], [ 2047, %vector_reduce_add_i32.exit ]
  %arrayidx.i14 = getelementptr inbounds i32, ptr %a, i64 %indvars.iv.i13
  %3 = load i32, ptr %arrayidx.i14, align 4, !tbaa !4
  %add.i15 = add nsw i32 %3, -1
  store i32 %add.i15, ptr %arrayidx.i14, align 4, !tbaa !4
  %indvars.iv.next.i16 = add nsw i64 %indvars.iv.i13, -1
  %4 = and i64 %indvars.iv.next.i16, 4294967295
  %cmp.not.i17 = icmp eq i64 %4, 0
  br i1 %cmp.not.i17, label %for.body.i26, label %for.body.i18, !llvm.loop !8

for.body.i26:                                     ; preds = %for.body.i18, %for.body.i26
  %indvars.iv.i20 = phi i64 [ %indvars.iv.next.i24, %for.body.i26 ], [ 0, %for.body.i18 ]
  %sum.05.i21 = phi i32 [ %add.i23, %for.body.i26 ], [ 0, %for.body.i18 ]
  %arrayidx.i22 = getelementptr inbounds i32, ptr %a, i64 %indvars.iv.i20
  %5 = load i32, ptr %arrayidx.i22, align 4, !tbaa !4
  %add.i23 = add nsw i32 %5, %sum.05.i21
  %indvars.iv.next.i24 = add nuw nsw i64 %indvars.iv.i20, 1
  %exitcond.not.i25 = icmp eq i64 %indvars.iv.next.i24, 2048
  br i1 %exitcond.not.i25, label %cleanup, label %for.body.i26, !llvm.loop !10

cleanup:                                          ; preds = %for.body.i26, %vector_reduce_add_i32.exit
  %retval.0 = phi i32 [ -1, %vector_reduce_add_i32.exit ], [ %add.i23, %for.body.i26 ]
  call void @llvm.lifetime.end.p0(i64 8192, ptr nonnull %a) #5
  ret i32 %retval.0
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { argmemonly nofree norecurse nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #1 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nofree norecurse nosync nounwind readonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #3 = { nofree nosync nounwind readnone "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+m,+relax,+v,+f,+m,+c,+d,+zba,+zbb,+zbc,+zbs,-save-restore" }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git 9452450ee564583afc43611f300d26d8c3edd95b)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
