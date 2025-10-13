import 'package:demo002/old/demo_02_base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'demo_01_text.dart';
import 'demo_02_arrange_objects.dart';
import 'demo_03_btn_toast_snack_bar.dart';
import 'old/demo_01_constraint_layout.dart';
import 'old/demo_03_layout_widget.dart';
import 'old/demo_04_grid.dart';
import 'old/demo_05_list_view.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(812, 375),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Navigator 範例',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(context) {

    var btn1Id = ConstraintId('btn1');
    var btn2Id = ConstraintId('btn2');
    var btn3Id = ConstraintId('btn3');
    var btn4Id = ConstraintId('btn4');
    var btn5Id = ConstraintId('btn5');

    var btn6Id = ConstraintId('btn6');
    var btn7Id = ConstraintId('btn7');
    var btn8Id = ConstraintId('btn8');

    var body = SingleChildScrollView(
      child: ConstraintLayout(
        children: [
          // 按钮1 - 在左半区域居中
          _buildButton(
            context,
            'Flutter Constraintlayout Demo',
            FlutterConstraintLayout(),
          ).applyConstraint(
            id: btn1Id,
            width: wrapContent,
            height: wrapContent,
            top: parent.top.margin(10.h),
            left: parent.left,
            right: parent.right,
            horizontalBias: 0.25,
          ),

          _buildButton(
            context,
            "Demo02TextView",
            Demo02BaseView(),
          ).applyConstraint(
            id: btn2Id,
            width: wrapContent,
            height: wrapContent,
            top: btn1Id.bottom.margin(10.h),
            left: btn1Id.left,
            right: btn1Id.right,
          ),

          _buildButton(context, "Demo03LayoutWidget", Demo03LayoutWidget()).applyConstraint(
            id: btn3Id,
            width: wrapContent,
            height: wrapContent,
            top: btn2Id.bottom.margin(10.h),
            left: btn2Id.left,
            right: btn2Id.right,
          ),

          _buildButton(context, "Demo04Grid", Demo04Grid()).applyConstraint(
            id: btn4Id,
            width: wrapContent,
            height: wrapContent,
            top: btn3Id.bottom.margin(10.h),
            left: btn3Id.left,
            right: btn3Id.right,
          ),

          _buildButton(context, "Demo05ListView", Demo05ListView()).applyConstraint(
            id: btn5Id,
            width: wrapContent,
            height: wrapContent,
            top: btn4Id.bottom.margin(10.h),
            left: btn4Id.left,
            right: btn4Id.right,
          ),

          _buildButton(context, "Demo01Text", Demo01Text()).applyConstraint(
            id: btn6Id,
            width: wrapContent,
            height: wrapContent,
            top: parent.top.margin(10.h),
            left: parent.left,
            right: parent.right,
            horizontalBias: 0.75,
          ),

          _buildButton(context, 'Demo02ArrangeObjects', Demo02ArrangeObjects()).applyConstraint(
            id: btn7Id,
            width: wrapContent,
            height: wrapContent,
            top: btn6Id.bottom.margin(10.h),
            left: btn6Id.left,
            right: btn6Id.right,
          ),

          _buildButton(context,'Demo03BtnToastSnackBar',Demo03BtnToastSnackBar()).applyConstraint(
            id: btn8Id,
            width: wrapContent,
            height: wrapContent,
            top: btn7Id.bottom.margin(10.h),
            left: btn7Id.left,
            right: btn7Id.right,
          )

        ],
      ),
    );

    return Scaffold(body: body);
  }

  // 建立按鈕01
  Widget _buildButton(BuildContext context, String label, Widget page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      ),
      onPressed: () => _navigateTo(context, page),
      child: Text(label),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
