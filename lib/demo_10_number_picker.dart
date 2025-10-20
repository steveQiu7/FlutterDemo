import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';

class _Ids {
  final tvGender = ConstraintId("tvGender");
  final rbGender = ConstraintId("rbGender");
  final tvAge = ConstraintId("tvAge");
}

class Demo10NumberPicker extends StatelessWidget {
  Demo10NumberPicker({super.key});

  final _ids = _Ids();

  // 性別
  static const _male = '男生', _female = '女生';
  final ValueNotifier<String> _gender = ValueNotifier('');
  final ValueNotifier<int> _selectedGender = ValueNotifier(0);

  // 年齡
  final ValueNotifier<int> _age = ValueNotifier(0);
  static const _minAge = 0, _maxAge = 100;

  // 顯示結果
  final ValueNotifier<String> _showResult = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();

    var body = ConstraintLayout(
      children: [
        // _buildNameField(nameController),
        _buildGenderTitle(),
        ValueListenableBuilder(valueListenable: _selectedGender, builder: _buildRadioButtonBuilder),
        _buildAgeTitle()

      ],
    );

    return Scaffold(body: body);
  }

  // Widget _buildNameField(TextEditingController nameController){
  //   var filed = TextField(
  //     controller: nameController,
  //     style: TextStyle(fontSize: 20.sp),
  //     decoration: InputDecoration(
  //       labelText: '輸入姓名',
  //       labelStyle: TextStyle(fontSize: 20.sp)
  //     ),
  //   );
  //   return filed;
  // }

  // Widget _buildBtnConfirm(){
  //
  // }

  Widget _buildGenderTitle() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
      child: Text('性別', style: TextStyle(fontSize: 20.sp)),
    ).applyConstraint(
      id: _ids.tvGender,
      width: wrapContent,
      height: wrapContent,
      top: parent.top.margin(10.h),
      centerHorizontalTo: parent,
    );
  }

  Widget _buildRadioButtonBuilder(BuildContext context, int selectedItem, Widget? child){

    var genders = const <String> [_male, _female];

    var radioItems = <RadioListTile<int>>[];

    for (var i = 0; i < genders.length; i++) {
      radioItems.add(
        RadioListTile<int>(
          value: i,
          title: Text(genders[i], style: TextStyle(fontSize: 20.sp)),
          contentPadding: EdgeInsets.zero,
        ),
      );
    }
    return RadioGroup<int>(
      groupValue: _selectedGender.value,
      onChanged: (int? value) {
        if (value != null) {
          _selectedGender.value = value;
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: radioItems,
      ),
    ).applyConstraint(
      id: _ids.rbGender,
      width: 200.w,
      height: wrapContent,
      top: _ids.tvGender.bottom.margin(10.h),
      centerHorizontalTo: parent,
    );
  }

  Widget _buildAgeTitle() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
      child: Text('年齡', style: TextStyle(fontSize: 20.sp)),
    ).applyConstraint(
      id: _ids.tvAge,
      width: wrapContent,
      height: wrapContent,
      top: _ids.rbGender.bottom.margin(10.h),
      centerHorizontalTo: parent,
    );
  }

  Widget _buildAgePicker(BuildContext context, int selectedAge, Widget? child) {
     final wid = NumberPicker(
       value:  selectedAge,
       minValue: _minAge,
       maxValue: _maxAge,
       onChanged: (value) {
         _age.value = value;
       }

     );
     return wid;
  }
}
