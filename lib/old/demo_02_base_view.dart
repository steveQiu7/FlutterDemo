import 'package:demo002/units/log_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/gestures.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Demo02BaseView extends StatelessWidget {
  const Demo02BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    var box1 = ConstraintId('box1');
    var box2 = ConstraintId('box2');
    var box3 = ConstraintId('box3');
    var box4 = ConstraintId('box4');
    var box5 = ConstraintId('box5');
    var img1 = ConstraintId('img1');
    var img2 = ConstraintId('img2');
    var img3 = ConstraintId('img3');
    var btn1 = ConstraintId('btn1');
    var btn2 = ConstraintId('btn2');
    var btn3 = ConstraintId('btn3');

    var gd1 = ConstraintId("gd1");

    var appBody = ConstraintLayout(
      children: [
        Text(
          "Hello World",
          style: TextStyle(fontSize: 10.sp),
        ).applyConstraint(
          id: box1,
          width: wrapContent,
          height: wrapContent,
          top: parent.top.margin(16.h),
          left: parent.left.margin(16.w),
        ),

        Text(
          "Hello world!! I'm Jack. " * 40,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 10.sp),
        ).applyConstraint(
          id: box2,
          width: matchConstraint,
          height: wrapContent,
          top: box1.bottom,
          left: box1.left,
          right: parent.right.margin(16.w),
        ),

        Text(
          "Hello world!! I'm Jack. ",
          textScaleFactor: 1.5,
        ).applyConstraint(
          id: box3,
          width: wrapContent,
          height: wrapContent,
          top: box2.bottom,
          left: box2.left,
        ),

        Text(
          "Hello world",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 10.sp,
            height: 2,
            fontFamily: "Courier",
            background: Paint()..color = Colors.yellow,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.dashed,
          ),
        ).applyConstraint(
          id: box4,
          width: wrapContent,
          height: wrapContent,
          top: box3.bottom,
          left: box3.left,
        ),

        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "Home: "),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    LogUnit.i('連結被點擊');
                  },
              ),
            ],
          ),
        ).applyConstraint(
          id: box5,
          width: wrapContent,
          height: wrapContent,
          top: box4.bottom,
          left: box4.left,
        ),

        Image.network(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
          fit: BoxFit.fill,
        ).applyConstraint(
          id: img1,
          top: box5.bottom,
          left: box5.left,
          size: 200.w,
        ),

        Image.asset(
          'assets/images/test001.png',
          fit: BoxFit.fill,
        ).applyConstraint(
          id: img2,
          left: img1.right.margin(10.w),
          top: img1.top,
          size: 200.w,
        ),

        CachedNetworkImage(
          imageUrl:
          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
        ).applyConstraint(
          id: img3,
          left: img2.right.margin(10.w),
          top: img2.top,
          size: 200.w,
        ),

        ElevatedButton(
          child: Text("Elevated Button"),
          onPressed: () {
            LogUnit.i('Elevated Button 被點擊');
          },
        ).applyConstraint(
          width: wrapContent,
          height: wrapContent,
          id: btn1,
          top: img1.bottom.margin(10.h),
          left: img1.left,
        ),

        TextButton(
          child: Text("取消"),
          onPressed: (){
            LogUnit.d("TextButton 被點擊");
          },
        ).applyConstraint(
          width: wrapContent,
          height: wrapContent,
          id: btn2,
          top: btn1.top,
          left: btn1.right.margin(20.w),
        ),

        OutlinedButton(
          child: Text("Outlined Button"),
          onPressed: () {
            LogUnit.i('Outlined Button 被點擊');
          },
        ).applyConstraint(
            width: wrapContent,
            height: wrapContent,
            id: btn3,
            top: btn2.top,
            left: btn2.right.margin(20.w)
        ),

        GestureDetector(
          onTap: (){
            LogUnit.i("GestureDetector 被點擊");
          },
          onDoubleTap: (){
            LogUnit.i("GestureDetector 被雙擊了");
          },
          onLongPress: (){
            LogUnit.i("GestureDetector 被長按了");
          },
          onVerticalDragDown: (details){
            LogUnit.i("GestureDetector 被垂直拖動了");
          },

          onHorizontalDragDown: (details){
            LogUnit.i("GestureDetector 被水平拖動了");
          },

          child: Text("你好"),

        ).applyConstraint(
          width: wrapContent,
          height: wrapContent,
          id: gd1,
          top: btn3.top,
          left: btn3.right.margin(20.w),
        )
      ],
    );

    return Scaffold(
      body: appBody
    );
  }
}
