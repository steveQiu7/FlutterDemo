import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Demo03LayoutWidget extends StatelessWidget {


  const Demo03LayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var row01 = ConstraintId("row01");
    var column01 = ConstraintId("column01");
    var stack01 = ConstraintId("stack01");

    return Scaffold(
      body: ConstraintLayout(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min, // 加這行
            children: [
              Icon(Icons.start, size: 50),
              Icon(Icons.start, size: 50),
              Icon(Icons.start, size: 50),
            ],
          ).applyConstraint(
            id: row01,
            width: 200.w,
            height: wrapContent,
            left: parent.left,
            top: parent.top,
          ),

          Column(
            mainAxisSize: MainAxisSize.min, // 加這行
            children: [
              Icon(Icons.start, size: 50),
              Icon(Icons.start, size: 50),
              Icon(Icons.start, size: 50),
            ],
          ).applyConstraint(
            id: column01,
            width: wrapContent,
            height: wrapContent,
            top: row01.bottom.margin(5.h),
            left: row01.left,
          ),

          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  width: 150.w,
                  height: 150.w,
                  color: Colors.red
              ),
              Container(width: 75.w, height: 75.w, color: Colors.green),
              Text(
                "Flutter",
                style: TextStyle(color: Colors.white, fontSize: 24.sp),
              ),
            ],
          ).applyConstraint(
            id: stack01,
            width: wrapContent,
            height: wrapContent,
            top: row01.bottom.margin(10.h),
            left: column01.right.margin(10.w),
          ),


        ],
      ),
    );
  }
}
