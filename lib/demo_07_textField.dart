import 'package:demo002/extension/buildContext.dart';
import 'package:demo002/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Demo07TextField extends StatefulWidget {
  const Demo07TextField({super.key});

  @override
  State<StatefulWidget> createState() => _Demo07TextFieldState();
}

class _Ids{
  final tfName = ConstraintId("tfName");
}

class _Demo07TextFieldState extends State<Demo07TextField> {

  late final _Ids _ids;

  final teNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _ids = _Ids();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ConstraintLayout(children: [_buildTfName(context,teNameController)]),
    );
  }

  Widget _buildTfName(BuildContext context, TextEditingController nameController) {
    return TextField(
      controller: nameController,
      style: TextStyle(fontSize: 20.sp),
      decoration: InputDecoration(
        labelText:context.l10n.entryName,
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

  // Widget _buildEBtnConfirm(){
  //   return ElevatedButton(
  //     child: Text("確定"),
  //   ).applyConstraint(
  //
  //   )
  // }

}
