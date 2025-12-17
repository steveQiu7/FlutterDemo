import 'dart:io';

import 'package:demo002/extension/buildContext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class Demo18ImagePickerForMultiplePhotos extends StatefulWidget {

  const Demo18ImagePickerForMultiplePhotos({super.key});

  @override
  State<StatefulWidget> createState() => _Demo18ImagePickerForMultiplePhotosStatus();
}

class _Ids {
  var btnCameraImage = ConstraintId("btnCameraImage");
  var btnGalleryImage = ConstraintId("btnGalleryImage");
  var tvNoPicture = ConstraintId("tvNoPicture");
  var gridView = ConstraintId("gridView");
}

class _Demo18ImagePickerForMultiplePhotosStatus extends State<Demo18ImagePickerForMultiplePhotos> {

  late final _Ids _ids;
  late final ValueNotifier<List<XFile>?> _imageFiles;
  late final ImagePicker _imagePicker;

  @override
  void initState() {
    _ids = _Ids();
    _imageFiles = ValueNotifier(null);
    _imagePicker = ImagePicker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var body = ConstraintLayout(
      children: [
        buildBtnCameraImage(context).applyConstraint(id: _ids.btnCameraImage,
            width: wrapContent,
            height: wrapContent,
            top: parent.top.margin(10.h),
            centerHorizontalTo: parent),
        buildBtnGalleryImage(context).applyConstraint(id: _ids.btnGalleryImage,
            width: wrapContent,
            height: wrapContent,
            top: _ids.btnCameraImage.bottom.margin(10.h),
            centerHorizontalTo: parent),
        ValueListenableBuilder<List<XFile>?>(builder: _imageBuilder, valueListenable: _imageFiles),
      ],
    );

    return Scaffold(body: body);
  }

  Widget buildBtnCameraImage(BuildContext context) {
    var btnCameraImage = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Text(
        context.l10n.imagePickerBtnCamera,
        style: TextStyle(fontSize: 20.sp, color: Colors.white),
      ),
      onPressed: () =>
      {
        _takePicture()
      },
    );
    return btnCameraImage;
  }

  Widget buildBtnGalleryImage(BuildContext context) {
    var btnGalleryImage = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      onPressed: () =>
      {
        _selectImages()
      },
      child: Text(
      context.l10n.imagePickerBtnGallery,
      style: TextStyle(fontSize: 20.sp, color: Colors.white),
    )
    ,);
    return
    btnGalleryImage;
  }

  Future<void> _takePicture() async {
    XFile? photo = await _imagePicker.pickImage(source: ImageSource.camera);
    List<XFile>? imgFiles = photo == null ? null : <XFile>[photo];
    _imageFiles.value = imgFiles;
  }

  Future<void> _selectImages() async {
    List<XFile>? imageFile = await _imagePicker.pickMultiImage();
    _imageFiles.value = imageFile;
  }

  Widget _imageBuilder(BuildContext context, List<XFile>? imageFiles, Widget? child) {
    final wid = imageFiles == null
        ? Text(
      context.l10n.imagePickerNoPicture,
      style: TextStyle(fontSize: 20.sp),
    ).applyConstraint(id: _ids.tvNoPicture,
        width: wrapContent,
        height: wrapContent,
        top: _ids.btnGalleryImage.bottom.margin(10.h),
        centerHorizontalTo: parent)
        : _gridViewBuilder(imageFiles);
    return wid;
  }

  Widget _gridViewBuilder(List<XFile> imageFiles) {
    final gradView =
    GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(20.w),
      crossAxisSpacing: 20.w,
      mainAxisSpacing: 20.w,
      physics: BouncingScrollPhysics(),
      children: List.generate(imageFiles.length, (index) {
        final item = Semantics(
          label: imageFiles[index].name,
          child: Image.file(File(imageFiles[index].path), fit: BoxFit.contain),
        );
        return item;
      }),
    ).applyConstraint(
      id: _ids.gridView,
      width: matchConstraint,
      height: matchConstraint,
      top: _ids.btnGalleryImage.bottom.margin(10.h),
      bottom: parent.bottom.margin(10.h),
      left: parent.left.margin(10.w),
      right: parent.right.margin(10.w),
    );

    return gradView;
  }
}
