import 'dart:io';

import 'package:demo002/extension/buildContext.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class Demo16ImagePicker extends StatefulWidget {
  const Demo16ImagePicker({super.key});

  @override
  State<StatefulWidget> createState() => _Demo16ImagePickerStatus();
}

class _Ids {
  var btnCameraImage = ConstraintId("btnCameraImage");
  var btnGalleryImage = ConstraintId("btnGalleryImage");
  var tvMessage = ConstraintId("tvMessage");
  var imgPicture = ConstraintId("imgPicture");
}

class _Demo16ImagePickerStatus extends State<Demo16ImagePicker> {
  late final _Ids _ids;
  late final ValueNotifier<XFile?> _imageFile;
  late final ImagePicker _imagePicker;

  @override
  void initState() {
    _ids = _Ids();
    _imageFile = ValueNotifier(null);
    _imagePicker = ImagePicker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var body = ConstraintLayout(
      children: [
        _buildBtnCameraImage(context),
        _buildBtnGalleryImage(),
        ValueListenableBuilder(
          valueListenable: _imageFile,
          builder: _imageBuilder,
        ),
      ],
    );

    return Scaffold(body: body);
  }

  Widget _buildBtnCameraImage(BuildContext context) {
    var btn =
        ElevatedButton(
          onPressed: () {
            _getImage(ImageSource.camera);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            context.l10n.imagePickerBtnCamera,
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
        ).applyConstraint(
          id: _ids.btnCameraImage,
          width: wrapContent,
          height: wrapContent,
          top: parent.top.margin(10.h),
          centerHorizontalTo: parent,
        );

    return btn;
  }

  Widget _buildBtnGalleryImage() {
    var btn =
        ElevatedButton(
          onPressed: () {
            _getImage(ImageSource.gallery);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            context.l10n.imagePickerBtnGallery,
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
        ).applyConstraint(
          id: _ids.btnGalleryImage,
          width: wrapContent,
          height: wrapContent,
          top: _ids.btnCameraImage.bottom.margin(10.h),
          centerHorizontalTo: parent,
        );

    return btn;
  }

  // 非同步函式
  Future<void> _getImage(ImageSource source) async {
    XFile? imgFile = await _imagePicker.pickImage(source: source);
    _imageFile.value = imgFile;
  }

  Widget _imageBuilder(BuildContext context, XFile? imageFile, Widget? child) {

    if (imageFile == null) {
      return Text(
        "沒有照片",
        style: TextStyle(fontSize: 20.sp, color: Colors.white),
      ).applyConstraint(
        id: _ids.tvMessage,
        width: wrapContent,
        height: wrapContent,
        top: _ids.btnGalleryImage.bottom.margin(10.h),
        centerHorizontalTo: parent,
      );
    }

    Widget imageWidget;

    if(kIsWeb){
      imageWidget = Image.network(
        imageFile.path,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return CircularProgressIndicator();
        },
        errorBuilder: (context, error, stackTrace) {
          return Text("圖片載入失敗", style: TextStyle(color: Colors.red));
        },
      );
    }else{
      // Mobile/Desktop 平台
      imageWidget = Image.file(
        File(imageFile.path),
        fit: BoxFit.contain,
      );
    }

    return imageWidget.applyConstraint( // 移除重複的 applyConstraint
      id: _ids.imgPicture,
      width: 200.w,
      height: 200.h,
      top: _ids.btnGalleryImage.bottom.margin(10.h),
      centerHorizontalTo: parent,
    );
  }
}
