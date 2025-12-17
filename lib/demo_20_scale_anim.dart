import 'package:demo002/extension/buildContext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';



class Demo20ScaleAnim extends StatefulWidget {

  @Preview(name: "Demo20ScaleAnim")
  const Demo20ScaleAnim({super.key});

  @override
  State<StatefulWidget> createState() => _Demo20ScaleAndTransformAnim();

}

class _Ids {
  var tvScale = ConstraintId("tvScale");
}

class _Demo20ScaleAndTransformAnim extends State<Demo20ScaleAnim> with SingleTickerProviderStateMixin {

  late final _Ids _ids;
  late final Animation _anim;
  late final AnimationController _animationCtrl;

  @override
  void initState() {
    super.initState();

    _ids = _Ids();

    _animationCtrl = AnimationController(vsync: this, duration: Duration(seconds: 3));

    final curvedAnim = CurvedAnimation(parent: _animationCtrl, curve: Curves.fastOutSlowIn);

    _anim = Tween(
      begin: 1.0,
      end: 2.5,
    ).animate(curvedAnim)..addListener(() {
      setState(() {});
    })..addStatusListener((status){
        if(status == AnimationStatus.completed) {
          _animationCtrl.reverse();
        } else if(status == AnimationStatus.dismissed) {
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
          _buildTvScale(context)
        ],
    );

    return Scaffold(body: body);
  }

  Widget _buildTvScale(BuildContext context){

    var widget = Transform.scale(
      scale: _anim.value,
      child: Text(
        context.l10n.animFlutter,
        style: TextStyle(fontSize: 30),
      ),
    ).applyConstraint(
        id: _ids.tvScale,
        width: wrapContent,
        height: wrapContent,
        top: parent.top,
        left: parent.left,
        right: parent.right,
        bottom: parent.bottom
    );

    return widget;


  }


}

// // ✅ 正確的 preview 函數位置
// @Preview(name: 'Scale Animation Demo')
// Widget scaleAnimationPreview() {
//   return MaterialApp(
//     home: Demo20ScaleAnim(),
//   );
// }