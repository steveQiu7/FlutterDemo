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
              "這是訊息",
              context: context,
              position: StyledToastPosition.center,
              backgroundColor: Colors.blue,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
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

          child: Text("open toast"),
        ).applyConstraint(
          id: btn01,
          width: wrapContent,
          height: wrapContent,
          top: parent.top.margin(10.h),
          centerHorizontalTo: parent,
        ),
      ],
    );
  }
}
