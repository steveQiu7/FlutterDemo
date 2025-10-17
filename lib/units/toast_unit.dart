import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void showGeneralToast(BuildContext context, String msgToast) {
  showToast(
    msgToast,
    context: context,
    position: StyledToastPosition.center,
    backgroundColor: Colors.blue,
    textStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
    borderRadius: BorderRadius.circular(8.w),
    duration: Duration(seconds: 2),

    // 淡入淡出設定
    animation: StyledToastAnimation.fade,
    reverseAnimation: StyledToastAnimation.fade,
    animDuration: Duration(milliseconds: 400),
    curve: Curves.easeInOut,
    reverseCurve: Curves.easeInOut,
  );
}
