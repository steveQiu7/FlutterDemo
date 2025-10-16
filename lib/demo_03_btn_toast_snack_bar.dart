import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Demo03BtnToastSnackBar extends StatelessWidget {
  const Demo03BtnToastSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body(context));
  }

  Widget body(BuildContext context) {
    var btn01 = ConstraintId("btn01");
    var btn02 = ConstraintId("btn02");

    return ConstraintLayout(
      children: [
        ElevatedButton(
          onPressed: () {
            showToast(
              "我是 Toast 訊息",
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
          },
          style: ElevatedButton.styleFrom(elevation: 10.w),
          child: Text("顯示 Toast 訊息"),
        ).applyConstraint(
          id: btn01,
          width: wrapContent,
          height: wrapContent,
          top: parent.top.margin(10.h),
          centerHorizontalTo: parent,
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(elevation: 8.w),
          onPressed: () {
            // 建立 SnackBar
            final snackBar = SnackBar(
              content: Text("你按下按鈕"),
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              action: SnackBarAction(
                label: 'Toast 訊息',
                textColor: Colors.white,
                onPressed: () {
                  showToast(
                    "你按下 SnackBar 的按鈕",
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

                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text("顯示 SnackBar"),
        ).applyConstraint(
          id: btn02,
          width: wrapContent,
          height: wrapContent,
          top: btn01.bottom.margin(10.h),
          centerHorizontalTo: parent,
        ),
      ],
    );
  }
}
