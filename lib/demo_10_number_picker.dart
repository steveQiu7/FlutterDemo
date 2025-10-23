import 'package:demo002/extension/buildContext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';

class _Ids {
  final tvGender = ConstraintId("tvGender");
  final rbGender = ConstraintId("rbGender");
  final tvAge = ConstraintId("tvAge");
  final npAge = ConstraintId("npAge");
  final btnConfirm = ConstraintId("btnConfirm");
  final tvShowResult = ConstraintId("tvShowResult");
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
        _buildGenderTitle(),
        _buildAgeTitle(),
        _buildConfirmBtn(context),
        ValueListenableBuilder(
          valueListenable: _selectedGender,
          builder: _buildRadioButtonBuilder,
        ),
        ValueListenableBuilder(valueListenable: _age, builder: _buildAgePicker),
        ValueListenableBuilder(valueListenable: _showResult, builder: _buildTvShowResult)
      ],
    );

    return Scaffold(body: body);
  }

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

  Widget _buildRadioButtonBuilder(
    BuildContext context,
    int selectedItem,
    Widget? child,
  ) {
    var genders = const <String>[_male, _female];

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
      child: Column(mainAxisSize: MainAxisSize.min, children: radioItems),
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
    final wid =
        NumberPicker(
          value: selectedAge,
          minValue: _minAge,
          maxValue: _maxAge,
          onChanged: (value) {
            _age.value = value;
          },
          axis: Axis.vertical,
        ).applyConstraint(
          id: _ids.npAge,
          width: wrapContent,
          height: wrapContent,
          top: _ids.tvAge.bottom.margin(10.h),
          centerHorizontalTo: parent,
        );
    return wid;
  }

  Widget _buildConfirmBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showSuggestion();
      },
      child: Text(context.l10n.commonConfirm),
    ).applyConstraint(
      id: _ids.btnConfirm,
      width: wrapContent,
      height: wrapContent,
      top: _ids.npAge.bottom.margin(10.h),
      centerHorizontalTo: parent,
    );
  }

  Widget _buildTvShowResult(BuildContext context, String text, Widget?child) {
    var tvResult = Text(text,style: TextStyle(fontSize: 20.sp)).applyConstraint(
      id: _ids.tvShowResult,
      width: wrapContent,
      height: wrapContent,
      top: _ids.btnConfirm.bottom.margin(10.h),
      centerHorizontalTo: parent
    );
    return tvResult;
  }


  _showSuggestion() {
    if (_gender.value == _male) {
      if (_age.value <= 27) {
        _showResult.value = "不急";
      } else if (_age.value > 27 && _age.value <= 32) {
        _showResult.value = "開始找對象";
      } else {
        _showResult.value = "趕快結婚";
      }
    } else {
      if (_age.value <= 25) {
        _showResult.value = "不急";
      } else if (_age.value > 25 && _age.value <= 30) {
        _showResult.value = "開始找對象";
      } else {
        _showResult.value = "趕快結婚";
      }
    }
  }
}
