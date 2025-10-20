import 'package:demo002/extension/buildContext.dart';
import 'package:demo002/l10n/app_localizations.dart';
import 'package:demo002/units/snack_bar_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Demo07TextField extends StatefulWidget {
  const Demo07TextField({super.key});

  @override
  State<StatefulWidget> createState() => _Demo07TextFieldState();
}

class _Ids {
  final tfName = ConstraintId("tfName");
  final btnConfirm = ConstraintId("btnConfirm");
  final tvShowContent = ConstraintId("tvShowContent");
}

class _Demo07TextFieldState extends State<Demo07TextField> {

  late final _Ids _ids;
  late final TextEditingController _teNameController;
  late final ValueNotifier<String> _inputNameNotifier; // 使用 ValueNotifier


  @override
  void initState() {
    super.initState();
    _ids = _Ids();
    _inputNameNotifier = ValueNotifier('');
    _teNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: ConstraintLayout(
        children: [
          _buildTfName(context, _teNameController),
          _buildEBtnConfirm(_teNameController),
          _buildShowText()
        ],
      ),
    );
  }

  Widget _buildTfName(
    BuildContext context,
    TextEditingController nameController,
  ) {
    return TextField(
      controller: nameController,
      style: TextStyle(fontSize: 20.sp),
      decoration: InputDecoration(
        labelText: context.l10n.entryName,
        labelStyle: TextStyle(fontSize: 20.sp),
      ),
    ).applyConstraint(
      id: _ids.tfName,
      width: wrapContent,
      height: wrapContent,
      top: parent.top.margin(10.h),
      centerHorizontalTo: parent,
    );
  }

  Widget _buildEBtnConfirm(TextEditingController nameController) {
    return ElevatedButton(
      onPressed: () {

          _inputNameNotifier.value = nameController.text;
      },
      child: Text("確定", style: TextStyle(fontSize: 18.sp)),
    ).applyConstraint(
      id: _ids.btnConfirm,
      width: wrapContent,
      height: wrapContent,
      top: _ids.tfName.bottom.margin(10.h),
      centerHorizontalTo: parent,
    );
  }

  Widget _buildShowText() {
    return ValueListenableBuilder<String>(
      valueListenable: _inputNameNotifier,
      builder: (context, value, child) {
        return Text(value, style: const TextStyle(fontSize: 20)).applyConstraint(
          id: _ids.tvShowContent,
          width: wrapContent,
          height: wrapContent,
          top: _ids.btnConfirm.bottom.margin(10.h),
          centerHorizontalTo: parent,
        );
      },
    );


    // return Text(_inputName, style: const TextStyle(fontSize: 20)).applyConstraint(
    //   id: _ids.tvShowContent,
    //   width: wrapContent,
    //   height: wrapContent,
    //   top: _ids.btnConfirm.bottom.margin(10.h),
    //   centerHorizontalTo: parent,
    // );
  }
}
