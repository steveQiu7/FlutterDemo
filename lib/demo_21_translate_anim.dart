

import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';

class Demo21TranslateAnim extends StatefulWidget{

  const Demo21TranslateAnim({super.key});

  @override
  State<StatefulWidget> createState() => _Demo21TranslateAnim();

}

class _Ids{
  var tvTranslate = ConstraintId("tvTranslate");
}

class _Demo21TranslateAnim extends State<Demo21TranslateAnim> with SingleTickerProviderStateMixin{

  late final _Ids _ids;
  late final Animation _anim;
  late final AnimationController _animationCtrl;

  @override
  void initState() {
    super.initState();

    _ids = _Ids();
    _animationCtrl = AnimationController(vsync: this,duration: Duration(seconds: 3));

    final curvedAnim = CurvedAnimation(parent: _animationCtrl, curve: Curves.fastOutSlowIn);

    _anim = Tween(
      begin: -250.0,
      end: 250.0
    ).animate(curvedAnim)..addListener((){
      setState(() {});
    })..addStatusListener((status){

      if(status == AnimationStatus.completed) {
        _animationCtrl.reverse();
      } else {
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
      children: [
        _buildTvTranslate(context).applyConstraint(
          id: _ids.tvTranslate,
          width: wrapContent,
          height: wrapContent,
          top: parent.top,
          left: parent.left,
          right: parent.right,
          bottom: parent.bottom
        )
      ],
    );

    return Scaffold(body: body);
  }

  Widget _buildTvTranslate(BuildContext context) {

    var widget = Transform.translate(
      offset: Offset(_anim.value, 0),
      child: Text(
        'Flutter 動畫',
        style: TextStyle(fontSize: 30),
      ),
    );

    return widget;
  }

}

