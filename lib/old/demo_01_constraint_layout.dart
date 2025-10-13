import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlutterConstraintLayout extends StatelessWidget {
  const FlutterConstraintLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var box1 = ConstraintId('box1');
    var box2 = ConstraintId('box2');
    var box3 = ConstraintId('box3');

    var box4 = ConstraintId('box4');
    var box5 = ConstraintId('box5');
    var box6 = ConstraintId('box6');

    var appBody = ConstraintLayout(
      children: [
        Container(color: Colors.yellow).applyConstraint(
          id: box1,
          width: 200.w,
          height: matchConstraint,
          widthHeightRatio: 1,
          left: parent.left.margin(50.w),
          top: parent.top.margin(50.h),
        ),

        Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: Text(
            "centerTopLeftTo",
            style: TextStyle(color: Colors.black, fontSize: 8.sp),
          ),
        ).applyConstraint(
          id: box2,
          width: 75.w,
          height: matchConstraint,
          widthHeightRatio: 1,
          centerTopLeftTo: box1,
        ),

        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: Text(
            "CLICK AREA",
            style: TextStyle(color: Colors.black, fontSize: 10.sp),
          ),
        ).applyConstraint(
          id: box3,
          width: matchConstraint,
          widthPercent: 0.5,
          height: 100,
          top: box1.bottom.margin(30.h),
          left: box1.left,
          right: box1.right,
          clickPadding: EdgeInsets.all(20.w),
          margin: EdgeInsets.only(left: 10.w),
        ),

        Container(color: Colors.yellow).applyConstraint(
          id: box4,
          width: 200.w,
          height: matchConstraint,
          widthHeightRatio: 1,
          top: box1.top,
          left: box1.right.margin(100.w),
        ),

        Container(color: Colors.cyan).applyConstraint(
          id: box5,
          size: 100.w,
          pinnedInfo: PinnedInfo(
            box4,
            Anchor(0.2, AnchorType.percent, 0.2, AnchorType.percent),
            Anchor(1, AnchorType.percent, 1, AnchorType.percent),
            angle: 50,
          ),
        ),
      ],
    );


    return Scaffold(
      body: appBody,
    );
  }
}
