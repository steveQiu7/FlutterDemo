import 'package:demo002/units/snack_bar_unit.dart';
import 'package:demo002/units/toast_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Demo04OtherBtn extends StatefulWidget {
  const Demo04OtherBtn({super.key});

  @override
  State<Demo04OtherBtn> createState() => _Demo04OtherBtnState();
}

class _Ids {
  final btn01 = ConstraintId("btn01");
  final btn02 = ConstraintId("btn02");
  final btn03 = ConstraintId("btn03");
  final btn04 = ConstraintId("btn04");
  final btn05 = ConstraintId("btn05");
  final btn06 = ConstraintId("btn06");
}

class _Demo04OtherBtnState extends State<Demo04OtherBtn> {
  late final _Ids _ids;

  @override
  void initState() {
    super.initState();
    _ids = _Ids();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConstraintLayout(
          children: [
            _buildElevatedButton("ElevatedButton"),
            _buildTextButton("TextButton"),
            _buildOutlinedButton("OutlineButton"),
            _buildIconButton(),
            _buildFloatingActionButton(),
            _buildElevatedButtonWithIcon("Elevated Button With Icon"),
          ],
        ),
    );
  }

  Widget _buildElevatedButton(String btnText) {
    return ElevatedButton(
      onPressed: () {
        showGeneralSnackBar(context, "你按下 ElevatedButton", () {
          showGeneralToast(context, "你按下 SnackBar 的按鈕");
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
        elevation: 8,
      ),
      child: Text(
        btnText,
        style: TextStyle(fontSize: 20.sp, color: Colors.redAccent),
      ),
    ).applyConstraint(
      id: _ids.btn01,
      width: wrapContent,
      height: wrapContent,
      top: parent.top.margin(10.h),
      centerHorizontalTo: parent,
    );
  }

  Widget _buildTextButton(String btnText) {
    return TextButton(
      onPressed: () {
        showGeneralSnackBar(context, "你按下 TextButton", () {
          showGeneralToast(context, "你按下 SnackBar 的按鈕");
        });
      },
      child: Text(
        btnText,
        style: TextStyle(fontSize: 20.sp, color: Colors.blue),
      ),
    ).applyConstraint(
      id: _ids.btn02,
      top: _ids.btn01.bottom.margin(10.h),
      centerHorizontalTo: parent,
    );
  }

  Widget _buildOutlinedButton(String btnText) {
    return OutlinedButton(
      onPressed: () {
        showGeneralSnackBar(context, "你按下 OutlinedButton", () {
          showGeneralToast(context, "你按下 SnackBar 的按鈕");
        });
      },
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        side: BorderSide(
          color: Colors.red,
          style: BorderStyle.solid,
          width: 0.8,
        ),
      ),
      child: Text(
        btnText,
        style: TextStyle(fontSize: 20.sp, color: Colors.black),
      ),
    ).applyConstraint(
      id: _ids.btn03,
      top: _ids.btn02.bottom.margin(10.h),
      centerHorizontalTo: parent,
    );
  }

  Widget _buildIconButton() {
    return IconButton(
      icon: Icon(Icons.phone_android),
      iconSize: 40.w,
      color: Colors.blue,
      onPressed: () {
        showGeneralSnackBar(context, "你按下 IconButton", () {
          showGeneralToast(context, "你按下 SnackBar 的按鈕");
        });
      },
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
    ).applyConstraint(
      id: _ids.btn04,
      top: _ids.btn03.bottom.margin(10.h),
      centerHorizontalTo: parent,
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      elevation: 8,
      onPressed: () {
        showGeneralSnackBar(context, "你按下 FloatingActionButton", () {
          showGeneralToast(context, "你按下 SnackBar 的按鈕");
        });
      },
      child: Icon(Icons.phone_android),
    ).applyConstraint(
      id: _ids.btn05,
      top: _ids.btn04.bottom.margin(10.h),
      centerHorizontalTo: parent,
    );
  }

  Widget _buildElevatedButtonWithIcon(String btnText) {
    return ElevatedButton.icon(
      label: Text(
        btnText,
        style: TextStyle(fontSize: 20, color: Colors.redAccent),
      ),

      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black12,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
        elevation: 0,
      ),
      icon: Icon(Icons.phone_android, color: Colors.redAccent),

      onPressed: () {
        showGeneralSnackBar(context, "你按下 ElevatedButton", () {
          showGeneralToast(context, "你按下 SnackBar 的按鈕");
        });
      },
    ).applyConstraint(
      id: _ids.btn06,
      top: _ids.btn05.bottom.margin(10.h),
      centerHorizontalTo: parent,
    );
  }
}
