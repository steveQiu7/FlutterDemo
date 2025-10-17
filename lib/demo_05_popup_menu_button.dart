import 'package:demo002/units/snack_bar_unit.dart';
import 'package:demo002/units/toast_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Demo05PopupMenuButton extends StatelessWidget {
  const Demo05PopupMenuButton({super.key});

  static final _ids = _Ids();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstraintLayout(children: [_buildPopupMenuButton(context)]),
    );
  }

  Widget _buildPopupMenuButton(context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            value: 1,
            child: SizedBox(
              width: 200.w, // 設定固定寬度
              child: Center(
                child: Text("第一項", style: TextStyle(fontSize: 20.sp)),
              ),
            ),
          ),
          PopupMenuDivider(),
          PopupMenuItem(
            value: 2,
            child: SizedBox(
              width: 200.w, // 設定固定寬度
              child: Center(
                child: Text("第二項", style: TextStyle(fontSize: 20.sp)),
              ),
            ),
          ),
          PopupMenuDivider(),
          PopupMenuItem(
            value: 3,
            child: Text("第三項", style: TextStyle(fontSize: 20.sp)),
          ),
        ];
      },
      color: Colors.white70,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      offset: Offset(100.w, 30.h),
      onSelected: (value) {
        showGeneralSnackBar(context, value.toString(), () {
          showGeneralToast(context, "你按下 SnackBar 的按鈕");
        });
      },
      onCanceled: () {
        showGeneralSnackBar(context, "取消選擇", () {
          showGeneralToast(context, "你按下 SnackBar 的按鈕");
        });
      },
    ).applyConstraint(
      id: _ids.pmb01,
      width: wrapContent,
      height: wrapContent,
      top: parent.top.margin(10.h),
      centerHorizontalTo: parent,
    );
  }
}

class _Ids {
  final pmb01 = ConstraintId("pmb01");
}
