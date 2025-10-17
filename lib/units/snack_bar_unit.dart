
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void showGeneralSnackBar(BuildContext context, String msg, void Function() onPressedSnackBar) {
  // 建立 SnackBar
  final snackBar = SnackBar(
    content: Text(msg),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
    action: SnackBarAction(
      label: "Toast 訊息",
      textColor: Colors.white,
      onPressed: () {
        onPressedSnackBar();
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}