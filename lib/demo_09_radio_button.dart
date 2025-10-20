import 'package:demo002/extension/buildContext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Demo09RadioButton extends StatefulWidget {
  const Demo09RadioButton({super.key});

  @override
  State<StatefulWidget> createState() => _Demo09RadioButtonState();
}

class _Ids {
  final radioButton = ConstraintId("radioButton");
  final btnConfirm = ConstraintId("btnConfirm");
  final tvShowContent = ConstraintId("tvShowContent");
}

var cities = ['倫敦', '東京', '舊金山'];

class _Demo09RadioButtonState extends State<Demo09RadioButton> {
  late final _Ids _ids;

  late final ValueNotifier<String> _cityName;
  late final ValueNotifier<int> _selectedCity;

  @override
  void initState() {
    super.initState();
    _ids = _Ids();
    _cityName = ValueNotifier('');
    _selectedCity = ValueNotifier(0);
  }

  @override
  Widget build(BuildContext context) {
    var widget = Scaffold(
      body: ConstraintLayout(children: [
        _buildRadioButton(),
        _buildBtnConfirm(context),
        _buildTvShowContent()

      ]),
    );
    return widget;
  }

  Widget _buildRadioButton() {
    var radioItems = <RadioListTile<int>>[];

    for (var i = 0; i < cities.length; i++) {
      radioItems.add(
        RadioListTile<int>(
          value: i,
          title: Text(cities[i], style: TextStyle(fontSize: 20.sp)),
          contentPadding: EdgeInsets.zero,
        ),
      );
    }

    final wid = ValueListenableBuilder<int>(
      valueListenable: _selectedCity,
      builder: (context, selectedValue, child) {
        return RadioGroup<int>(
          groupValue: selectedValue,
          onChanged: (int? value) {
            if (value != null) {
              _selectedCity.value = value;
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: radioItems,
          ),
        );
      },
    ).applyConstraint(
      id: _ids.radioButton,
      width: 200.w,
      height: wrapContent,
      top: parent.top.margin(10.h),
      centerHorizontalTo: parent,
    );

    return wid;
  }

  Widget _buildBtnConfirm(BuildContext context) {
    final btn = ElevatedButton(
      onPressed: () {
        _cityName.value =
        _selectedCity.value < 0 ? "" : cities[_selectedCity.value];
      },
      child: Text(context.l10n.commonConfirm),
    ).applyConstraint(
      id: _ids.btnConfirm,
      width: matchConstraint,
      height: wrapContent,
      top: _ids.radioButton.bottom.margin(10.h),
        left: _ids.radioButton.left,
        right: _ids.radioButton.right
    );

    return btn;
  }

  Widget _buildTvShowContent() {

    final text = ValueListenableBuilder(
        valueListenable: _cityName,
        builder: (context, value, child) {
          return Text(_cityName.value, style: TextStyle(fontSize: 20.sp))
              .applyConstraint(
            id: _ids.tvShowContent,
            width: wrapContent,
            height: wrapContent,
            top: _ids.btnConfirm.bottom.margin(10.h),
            centerHorizontalTo: parent,
          );
        }
    );

    return text;
  }

}
