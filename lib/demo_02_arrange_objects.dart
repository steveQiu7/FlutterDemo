import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Demo02ArrangeObjects extends StatelessWidget {
  const Demo02ArrangeObjects({super.key});

  @override
  Widget build(BuildContext context) {

    var center01 = ConstraintId("center01");
    var container01 = ConstraintId("container01");
    var row01 = ConstraintId("row01");

    var body = ConstraintLayout(
      children: [
        viewCenter().applyConstraint(
          id: center01,
          top: parent.top,
          left: parent.left,
        ),

        viewContainer().applyConstraint(
          width: wrapContent,
          height: wrapContent,
          id: container01,
          top: center01.bottom,
          centerHorizontalTo: parent,
        ),

        viewRow().applyConstraint(
          width: wrapContent,
          height: wrapContent
        )
      ],
    );

    return Scaffold(body: body);
  }

  Widget viewCenter() {
    var tv01 = Text(
      "Hi, Flutter.\n你真是太神奇了",
      style: TextStyle(
        fontSize: 15.sp,
        color: Colors.blue,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );

    return Center(heightFactor: 2, child: tv01);
  }

  Widget viewContainer() {
    var tv02 = Text(
      "Hi Flutter. \n你真的是太神奇了2",
      style: TextStyle(
        fontSize: 15.sp,
        color: Colors.yellow,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );

    return Container(
      margin: EdgeInsets.all(15.w),
      padding: EdgeInsets.fromLTRB(15.w, 15.h, 0, 0),
      transform: Matrix4.rotationZ(0.1),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: tv02,
    );
  }

  Widget viewRow() {
    var text1 = Text("物件1", style: TextStyle(fontSize: 10.sp));
    var text2 = Text("物件2", style: TextStyle(fontSize: 10.sp));
    var text3 = Text("物件3", style: TextStyle(fontSize: 10.sp));

    var row = Row(
      children: [
        text1,
        text2,
        text3,
      ],
    );

    return Container(
      child: row,
    );
  }
}
