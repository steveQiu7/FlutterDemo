
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class _Ids {
  final img = ConstraintId("img");
  final btnPreview = ConstraintId("btnPreview");
  final btnNext = ConstraintId("btnNext");
}

class Demo12ImgSelector extends StatelessWidget {
  Demo12ImgSelector({super.key});

  final _ids = _Ids();

  final ValueNotifier<int> _imageIndex = ValueNotifier(0);
  static const _image = <String>[
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
  ];

  @override
  Widget build(BuildContext context) {
    var body = ConstraintLayout(
      children: [
        ValueListenableBuilder(
          valueListenable: _imageIndex,
          builder: _buildImgSelector,
        ),
        _buildBtnPreview(),
        _buildBtnNext(),
      ],
    );

    return Scaffold(body: body);
  }

  Widget _buildImgSelector(BuildContext context,
      int imageIndex,
      Widget? child,) {
    var image = Image.asset(_image[imageIndex], fit: BoxFit.fill)
        .applyConstraint(
      id: _ids.img,
      width: 300.w,
      height: 300.w,
      top: parent.top,
      bottom: parent.bottom,
      centerHorizontalTo: parent,
    );
    return image;
  }

  Widget _buildBtnPreview() {
    var btn = IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        _previousImage();
      },
      icon: SvgPicture.asset(
        'assets/images/ic_project_next_play.svg',
        width: 50.w,
        height: 50.w,
        fit: BoxFit.fill,
      ),
    );

    var transFromBtn = Transform.rotate(angle: math.pi, child: btn)
        .applyConstraint(
      id: _ids.btnPreview,
      width: 75.w,
      height: 75.w,
      top: _ids.img.bottom.margin(10.h),
      left: _ids.img.left,
    );

    return transFromBtn;
  }

  Widget _buildBtnNext() {
    var btn =
    IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        _nextImage();
      },
      icon: SvgPicture.asset(
        'assets/images/ic_project_next_play.svg',
        width: 50.w,
        height: 50.w,
        fit: BoxFit.fill,
      ),
    ).applyConstraint(
      id: _ids.btnNext,
      width: 75.w,
      height: 75.w,
      top: _ids.img.bottom.margin(10.h),
      right: _ids.img.right,
    );
    return btn;
  }

  _previousImage() {
    _imageIndex.value = _imageIndex.value == 0 ? _image.length - 1 : _imageIndex.value - 1;
  }

  _nextImage() {
    _imageIndex.value = ++_imageIndex.value % _image.length;
  }
}
