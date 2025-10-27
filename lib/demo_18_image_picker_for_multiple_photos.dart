


import 'package:flutter/material.dart';

class Demo18ImagePickerForMultiplePhotos extends StatefulWidget{

  const Demo18ImagePickerForMultiplePhotos({super.key});

  @override
  State<StatefulWidget> createState() => _Demo18ImagePickerForMultiplePhotosStatus();
}

class _Ids{
  var btnCameraImage = ConstraintId("btnCameraImage");
  var btnGalleryImage = ConstraintId("btnGalleryImage");

}

class _Demo18ImagePickerForMultiplePhotosStatus extends State<Demo18ImagePickerForMultiplePhotos>{

  late final _Ids _ids;

  @override
  void initState() {
    _ids = _Ids();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold();
  }

}