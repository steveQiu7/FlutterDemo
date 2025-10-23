import 'dart:math' as math;

import 'package:demo002/units/log_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';

class Demo13PhotoView extends StatefulWidget {
  const Demo13PhotoView({super.key});

  @override
  State<StatefulWidget> createState() => _Demo13PhotoViewState();
}

class _Ids {
  final topControl = ConstraintId("topControl");
  final btnPreview = ConstraintId("btnPreview");
  final btnNext = ConstraintId("btnNext");
  final photoView = ConstraintId("photoView");
}

class _Demo13PhotoViewState extends State<Demo13PhotoView> {
  late final _Ids _ids;

  final ValueNotifier<int> _imageIndex = ValueNotifier(0);
  static const _images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
  ];

  @override
  void initState() {
    super.initState();
    _ids = _Ids();
  }

  @override
  Widget build(BuildContext context) {
    var body = ConstraintLayout(
      children: [
        _buildTopControl(),
        ValueListenableBuilder(
          valueListenable: _imageIndex,
          builder: _buildPhotoView,
        ),
      ],
    );

    return Scaffold(body: body);
  }

  Widget _buildTopControl() {
    var btnPreview = IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        _previewsImage();
      },
      icon: SvgPicture.asset(
        'assets/images/ic_project_next_play.svg',
        width: 40.w,
        height: 40.w,
        fit: BoxFit.fill,
      ),
    );

    var transFromBtnPreview = Transform.rotate(
      angle: math.pi,
      child: btnPreview,
    ).applyConstraint(id: _ids.btnPreview);

    var btnNext = IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        _nextImage();
      },
      icon: SvgPicture.asset(
        'assets/images/ic_project_next_play.svg',
        width: 40.w,
        height: 40.w,
        fit: BoxFit.fill,
      ),
    );

    var topControl =
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            transFromBtnPreview,
            SizedBox(width: 20.w),
            btnNext,
          ],
        ).applyConstraint(
          id: _ids.topControl,
          width: wrapContent,
          height: 50.w,
          top: parent.top.margin(10.h),
          centerHorizontalTo: parent,
        );

    return topControl;
  }

  Widget _buildPhotoView(BuildContext context, int imageIndex, Widget? child) {
    var photoView =
        PhotoView(
          imageProvider: AssetImage(_images[imageIndex]),
          minScale: PhotoViewComputedScale.contained * 0.6,
          maxScale: PhotoViewComputedScale.covered,
          enableRotation: true,
          backgroundDecoration: BoxDecoration(color: Colors.white),
        ).applyConstraint(
          id: _ids.photoView,
          width: matchConstraint,
          height: matchConstraint,
          top: _ids.topControl.bottom.margin(10.h),
          bottom: parent.bottom.margin(10.h),
          left: parent.left,
          right: parent.right,
        );

    return photoView;
  }

  _previewsImage(){
    _imageIndex.value = _imageIndex.value == 0 ? _images.length -1 : _imageIndex.value -1;
  }

  _nextImage(){
    _imageIndex.value = ++_imageIndex.value % _images.length;
  }
}
