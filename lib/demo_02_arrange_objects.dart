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
    var column01 = ConstraintId("column01");
    var row02 = ConstraintId("row02");
    var column02 = ConstraintId("column02");
    var row03 = ConstraintId("row03");
    var column03 = ConstraintId("column03");

    var stack01 = ConstraintId("stack01");
    var stack02 = ConstraintId("stack02");

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
          width: 200.w,
          height: wrapContent,
          top: container01.bottom.margin(10.h),
          id: row01,
          left: parent.left,
        ),

        viewColumn().applyConstraint(
          width: wrapContent,
          height: 60.h,
          top: row01.bottom.margin(10.h),
          id: column01,
          left: parent.left,
        ),

        viewRow2().applyConstraint(
          width: 200.w,
          height: wrapContent,
          top: column01.bottom.margin(10.h),
          id: row02,
          left: parent.left,
        ),

        viewColumn2().applyConstraint(
          width: wrapContent,
          height: 60.h,
          top: row02.bottom.margin(10.h),
          id: column02,
          left: parent.left,
        ),

        viewRow3().applyConstraint(
          id: row03,
          width: 200.w,
          height: 15.h,
          top: row02.top,
          left: row02.right.margin(20.w),
        ),

        viewColumn3().applyConstraint(
          width: 48.w,
          id: column03,
          height: 60.h,
          top: row03.bottom.margin(10.h),
          left: row03.left,
        ),

        viewStack().applyConstraint(
          id: stack01,
          width: 200.w,
          height: 200.w,
          top: column03.bottom,
          left: column03.left,
          right: column03.right,
        ),

        viewStack2().applyConstraint(
          id: stack02,
          width: 200.w,
          height: 200.w,
          top: stack01.top,
          left: stack01.right.margin(20.w),
        ),
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
    var row = Row(
      children: [
        Text("物件1", style: TextStyle(fontSize: 10.sp)),
        Text("物件2", style: TextStyle(fontSize: 10.sp)),
        Text("物件3", style: TextStyle(fontSize: 10.sp)),
      ],
    );
    return Container(child: row);
  }

  Widget viewColumn() {
    var column = Column(
      children: [
        Text("物件1", style: TextStyle(fontSize: 10.sp)),
        Text("物件2", style: TextStyle(fontSize: 10.sp)),
        Text("物件3", style: TextStyle(fontSize: 10.sp)),
      ],
    );
    return Container(child: column);
  }

  Widget viewRow2() {
    var text01 = Container(
      margin: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 4.h),
      child: Text("物件1", style: TextStyle(fontSize: 10.sp)),
    );

    var text02 = Container(
      margin: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 4.h),
      child: Text("物件2", style: TextStyle(fontSize: 10.sp)),
    );

    var text03 = Container(
      margin: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 4.h),
      child: Text("物件3", style: TextStyle(fontSize: 10.sp)),
    );

    var row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [text01, text02, text03],
    );
    return Container(child: row);
  }

  Widget viewColumn2() {
    var text01 = Container(
      margin: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 4.h),
      child: Text("物件1", style: TextStyle(fontSize: 10.sp)),
    );

    var text02 = Container(
      margin: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 4.h),
      child: Text("物件2", style: TextStyle(fontSize: 10.sp)),
    );

    var text03 = Container(
      margin: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 4.h),
      child: Text("物件3", style: TextStyle(fontSize: 10.sp)),
    );

    var column = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [text01, text02, text03],
    );

    return Container(child: column);
  }

  Widget viewRow3() {
    var text01 = Expanded(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 4.h),
        child: Text("物件2", style: TextStyle(fontSize: 10.sp)),
      ),
    );

    var text02 = Container(
      margin: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 4.h),
      child: Text("物件2", style: TextStyle(fontSize: 10.sp)),
    );

    var text03 = Container(
      margin: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 4.h),
      child: Text("物件3", style: TextStyle(fontSize: 10.sp)),
    );

    var row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [text01, text02, text03],
    );
    return Container(child: row);
  }

  Widget viewColumn3() {
    var text01 = Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 4.h),
        child: Text("物件1", style: TextStyle(fontSize: 10.sp)),
      ),
    );

    var text02 = Expanded(
      flex: 2,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 4.h),
        child: Text("物件2", style: TextStyle(fontSize: 10.sp)),
      ),
    );

    var text03 = Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 4.h),
        child: Text("物件3", style: TextStyle(fontSize: 10.sp)),
      ),
    );

    var column = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [text01, text02, text03],
    );

    return Container(child: column);
  }

  Widget viewStack() {
    var text = Text(
      "Hi Flutter",
      style: TextStyle(
        color: Colors.blue,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    );

    var img = Image.asset(
      'assets/images/red_circle.png',
      width: 200.w,
      height: 200.w,
      fit: BoxFit.contain,
    );

    return Stack(alignment: Alignment.center, children: [img, text]);
  }

  Widget viewStack2() {
    var text = Text(
      "Hi Flutter",
      style: TextStyle(
        color: Colors.blue,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    );

    var img = Image.asset(
      'assets/images/red_circle.png',
      width: 200.w,
      height: 200.w,
      fit: BoxFit.contain,
    );

    return Stack(
        alignment: Alignment.center,
        children: [
          img,
          Positioned(top: 15.h, child: text)
        ]);
  }
}
