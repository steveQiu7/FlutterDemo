import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Demo04Grid extends StatelessWidget {
  const Demo04Grid({super.key});

  @override
  Widget build(BuildContext context) {
    var grid01 = ConstraintId("grid01");
    var grid02 = ConstraintId("grid02");
    var grid03 = ConstraintId("grid03");

    return Scaffold(
      body: ConstraintLayout(
        children: [
          GridView.count(
            crossAxisCount: 3,
            children: List.generate(9, (index) {
              return Container(
                color: Colors.blue[(index + 1) * 100],
                child: Center(
                  child: Text("item $index", style: TextStyle(fontSize: 12.sp)),
                ),
              );
            }),
          ).applyConstraint(
            id: grid01,
            width: 180.w,
            height: wrapContent,
            top: parent.top,
            left: parent.left,
          ),

          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.green[100 * (index % 9)],
                child: Center(
                  child: Text("item $index", style: TextStyle(fontSize: 12.sp)),
                ),
              );
            },
            itemCount: 30,
          ).applyConstraint(
            id: grid02,
            width: 180.w,
            height: wrapContent,
            top: parent.top,
            left: grid01.right.margin(10.w),
          ),

          GridView.custom(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
            childrenDelegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                color: Colors.red[100 * (index % 9)],
                child: Center(
                  child: Text("item $index", style: TextStyle(fontSize: 12.sp)),
                ),
              );
            }, childCount: 20),
          ).applyConstraint(
            id: grid03,
            width: 180.w,
            height: wrapContent,
            top: parent.top,
            left: grid02.right.margin(10.w),
          ),


        ],
      ),
    );
  }
}
