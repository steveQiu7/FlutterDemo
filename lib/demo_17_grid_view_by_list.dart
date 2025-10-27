import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Demo17GridViewByList extends StatefulWidget {
  const Demo17GridViewByList({super.key});

  @override
  State<StatefulWidget> createState() => _Demo17GridViewByListStatus();
}

class _Ids {
  var gridView = ConstraintId("gridView");
}

class _Demo17GridViewByListStatus extends State<Demo17GridViewByList> {
  late final _Ids _ids;

  static const items = <String>[
    "第一項",
    "第二項",
    "第三項",
    "第四項",
    "第五項",
    "第六項",
    "第七項",
    "第八項",
    "第九項",
  ];

  @override
  void initState() {
    _ids = _Ids();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final gridView = GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(20.w),
      crossAxisSpacing: 20.w,
      mainAxisSpacing: 20.w,
      physics: BouncingScrollPhysics(),
      children: List.generate(items.length, (index) {
        final widget = Container(
          alignment: Alignment.center,
          color: Colors.black12,
          child: Text(items[index], style: TextStyle(fontSize: 20.sp)),
        );
        return widget;
      }),
    ).applyConstraint(
      id: _ids.gridView,
      width: matchConstraint,
      height: matchConstraint,
      centerVerticalTo: parent,
      centerHorizontalTo: parent
    );

    var body = ConstraintLayout(children: [
      gridView
    ]);

    return Scaffold(body: body);
  }
}
