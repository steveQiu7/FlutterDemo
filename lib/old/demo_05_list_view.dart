
import 'package:demo002/units/log_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'demo_06_list_view_2.dart';

class Demo05ListView extends StatelessWidget {
  const Demo05ListView({super.key});

  @override
  Widget build(BuildContext context) {
    var list01 = ConstraintId("list01");
    var list02 = ConstraintId("list02");
    var list03 = ConstraintId("list03");

    return Scaffold(
      body: ConstraintLayout(
        children: [
          ListView.builder(
            itemCount: 100,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("item $index"),
                subtitle: Text("這個是第$index個專案的描述"),
              );
            },
          ).applyConstraint(
            id: list01,
            width: 200.w,
            height: wrapContent,
            top: parent.top,
            left: parent.left,
          ),

          ListView.separated(
            itemCount: 50,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("item $index"),
                onTap: () {
                  LogUnit.d("Tapped on item $index");
                },
              );
            },
          ).applyConstraint(
            id: list02,
            width: 200.w,
            height: wrapContent,
            top:parent.top,
            left: list01.right,
          ),

          Demo06ListView().applyConstraint(
            id: list03,
            width: 200.w,
            height: wrapContent,
            top: list02.top,
            left: list02.right,
          )

        ],

      ),
    );
  }
}
