import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Demo01Text extends StatelessWidget {
  const Demo01Text({super.key});

  @override
  Widget build(BuildContext context) {

    var tv01 = ConstraintId("tv01");

    // 建立 appBar 物件
    var appBar = AppBar(
      title: Text('第一個 Flutter App'),
      backgroundColor: Color(0xFFFF0000),
    );

    var appBody = ConstraintLayout(
      children: [

          Text(
            "Hi, Flutter.\n你真是太神奇了",
            style: TextStyle(
              fontSize: 30.sp,
              color: Colors.blue,
              decoration:TextDecoration.underline,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ).applyConstraint(
            id: tv01,
            width: wrapContent,
            height: wrapContent,
            top: parent.top,
            bottom: parent.bottom,
            left: parent.left,
            right: parent.right,
          )
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: appBody,
    );
  }
}
