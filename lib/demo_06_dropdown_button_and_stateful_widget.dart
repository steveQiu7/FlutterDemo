import 'package:demo002/units/snack_bar_unit.dart';
import 'package:demo002/units/toast_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownButtonAndStatefulWidget extends StatefulWidget {
  const DropdownButtonAndStatefulWidget({super.key});

  @override
  State<StatefulWidget> createState() => _DropdownButtonAndStatefulWidget();
}

class _Ids {
  final pmb01 = ConstraintId("pmb01");
}

class _DropdownButtonAndStatefulWidget extends State<DropdownButtonAndStatefulWidget> {
  late final _Ids _ids;
  int? selectedValue;

  @override
  void initState() {
    super.initState();
    _ids = _Ids();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ConstraintLayout(children: [
      _buildDropdownButton()
    ]));
  }

  Widget _buildDropdownButton() {
    return DropdownButton(
      items: [
        DropdownMenuItem(
          value: 1,
          child: Text('第一項', style: TextStyle(fontSize: 20.sp)),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text('第二項', style: TextStyle(fontSize: 20.sp)),
        ),
        DropdownMenuItem(
          value: 3,
          child: Text('第三項', style: TextStyle(fontSize: 20.sp)),
        )
      ],
      onChanged: (dynamic value) {
        setState(() {
          selectedValue = value;
        });
      },
      hint: Text("請選擇", style: TextStyle(fontSize: 20.sp)),
      value: selectedValue,
      // 關鍵屬性：設定下拉選項的背景樣式
      dropdownColor: Colors.lightBlue[50], // 下拉選項背景顏色
      elevation: 8, // 陰影高度
      borderRadius: BorderRadius.circular(15.r), // 下拉選項圓角
      menuMaxHeight: 300.h, // 下拉選項最大高度
      style: TextStyle(color: Colors.black), // 選項文字顏色
      underline: SizedBox(),
      icon: SizedBox(),
      padding: EdgeInsets.fromLTRB(20.w, 5.w, 20.w, 5.w),
    ).applyConstraint(
      id: _ids.pmb01,
      width: wrapContent,
      height: wrapContent,
      top: parent.top.margin(10.h),
      centerHorizontalTo: parent,
    );
  }
}
