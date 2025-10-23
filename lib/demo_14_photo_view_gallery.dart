import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class Demo14PhotoViewGaller extends StatefulWidget {
  const Demo14PhotoViewGaller({super.key});

  @override
  State<StatefulWidget> createState() => _Demo14PhotoViewGallerState();
}

class _Ids {
  final tvTitle = ConstraintId("tvTitle");
  final pvgContent = ConstraintId("pvgContent");
}

class _Demo14PhotoViewGallerState extends State<Demo14PhotoViewGaller> {
  late final _Ids _ids;

  final ValueNotifier<int> _imageIndex = ValueNotifier(0);
  static const _images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
  ];

  @override
  void initState() {
    _ids = _Ids();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var title =
        Text(
          "圖片 ${_imageIndex.value + 1}",
          style: TextStyle(fontSize: 20.sp),
        ).applyConstraint(
          id: _ids.tvTitle,
          width: wrapContent,
          height: wrapContent,
          top: parent.top.margin(10.h),
          centerHorizontalTo: parent,
        );

    var body = ConstraintLayout(children: [
      title,
      ValueListenableBuilder(valueListenable: _imageIndex, builder: _buildPhotoView)
    ]);

    return Scaffold(body: body);
  }

  Widget _buildPhotoView(BuildContext context, int imageIndex, Widget? child) {
    var photoViewGallery =
        PhotoViewGallery.builder(
          scrollPhysics: BouncingScrollPhysics(),
          builder: _buildItem,
          itemCount: _images.length,
          enableRotation: true,
          backgroundDecoration: BoxDecoration(color: Colors.white),
          pageController: PageController(initialPage: 0),
          onPageChanged: _onPageChanged,
          scrollDirection: Axis.horizontal,
        ).applyConstraint(
          id: _ids.pvgContent,
          width: matchConstraint,
          height: matchConstraint,
          top: _ids.tvTitle.bottom.margin(10.h),
          left: parent.left,
          right: parent.right,
          bottom: parent.bottom.margin(10.h),
        );

    return photoViewGallery;
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    return PhotoViewGalleryPageOptions(
      imageProvider: AssetImage(_images[index]),
      initialScale: PhotoViewComputedScale.covered,
      minScale: 0.3,
      maxScale: 3.0,
    );
  }

  void _onPageChanged(int index) {
    _imageIndex.value = index;
  }
}
