import 'dart:math';

import 'package:flutter/widget_previews.dart';
import 'package:demo002/extension/buildContext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Demo19RotationAnimation extends StatefulWidget {

  const Demo19RotationAnimation({super.key});

  @override
  State<StatefulWidget> createState() => _Demo19RotationAnimation();
}

class _Ids {
  var tvTransFrom = ConstraintId("tvTransFrom");
}

class _Demo19RotationAnimation extends State<Demo19RotationAnimation> with SingleTickerProviderStateMixin {

  late final _Ids _ids;
  late final Animation _anim;
  late final AnimationController _animationCtrl;

  @override
  void initState() {
    super.initState();

    _ids = _Ids();
    _animationCtrl = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _anim = Tween(begin: 0.0, end: 2 * pi).animate(_animationCtrl)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationCtrl.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationCtrl.forward();
        }
      });

    _animationCtrl.forward();
  }

  @override
  void dispose() {
    _animationCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var body = ConstraintLayout(
      children: [_buildTvTransFrom(context).applyConstraint(id: _ids.tvTransFrom, top: parent.top, left: parent.left, right: parent.right, bottom: parent.bottom)],
    );

    return Scaffold(body: body);
  }

  Widget _buildTvTransFrom(BuildContext context) {
    var tv = Transform.rotate(
      angle: _anim.value,
      alignment: FractionalOffset.center,
      child: Text(context.l10n.animFlutter, style: TextStyle(fontSize: 30.sp)),
    );

    return tv;
  }
}
