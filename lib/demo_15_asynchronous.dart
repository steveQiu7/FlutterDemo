import 'dart:async';
import 'dart:io';

import 'package:demo002/units/log_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Demo15Asynchronous extends StatefulWidget {
  const Demo15Asynchronous({super.key});

  @override
  State<StatefulWidget> createState() => _Demo15AsynchronousStatus();
}

class _Ids {
  var btnGeneral = ConstraintId("btnGeneral");
  var btnFeature = ConstraintId("btnFeature");
  var btnFeatureDelay = ConstraintId("btnFeatureDelay");
  var btnFeatureAsync = ConstraintId('btnFeatureAsync');
}

class _Demo15AsynchronousStatus extends State<Demo15Asynchronous> {
  late final _Ids _ids;

  @override
  void initState() {
    _ids = _Ids();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var body = ConstraintLayout(
      children: [btnGeneral(), btnFeature(), btnFeatureDelay(),btnFeatureAsync()],
    );

    return Scaffold(body: body);
  }

  Widget btnGeneral() {
    var btn =
        ElevatedButton(
          onPressed: () {
            _printWithTimestamp('程式啟動');

            int x = doJob();
            _printWithTimestamp('doJob() 回傳值: $x');

            _printWithTimestamp('程式結束');
          },
          child: Text("一般Sleep Web不能用"),
        ).applyConstraint(
          id: _ids.btnGeneral,
          width: wrapContent,
          height: wrapContent,
          top: parent.top.margin(10.h),
          centerHorizontalTo: parent,
        );
    return btn;
  }

  Widget btnFeature() {
    var btn =
        ElevatedButton(
          onPressed: () {
            _printWithTimestamp('程式啟動');

            var futureResult = Future(doJob);
            futureResult.then(
              (value) => _printWithTimestamp('doJob() 回傳值: $value'),
            );

            _printWithTimestamp('程式結束');
          },
          child: Text("一般 Feature"),
        ).applyConstraint(
          id: _ids.btnFeature,
          width: wrapContent,
          height: wrapContent,
          top: _ids.btnGeneral.bottom.margin(10.h),
          centerHorizontalTo: parent,
        );

    return btn;
  }

  Widget btnFeatureDelay() {
    var btn =
        ElevatedButton(
          onPressed: () {
            _printWithTimestamp('程式啟動');

            var futureResult = Future.delayed(
              const Duration(seconds: 3),
              doJob,
            );
            futureResult.then(
              (value) => _printWithTimestamp('doJob() 回傳值: $value'),
            );

            _printWithTimestamp('程式結束');
          },
          child: Text("延遲 Future"),
        ).applyConstraint(
          id: _ids.btnFeatureDelay,
          width: wrapContent,
          height: wrapContent,
          top: _ids.btnFeature.bottom.margin(10.h),
          centerHorizontalTo: parent,
        );

    return btn;
  }

  Widget btnFeatureAsync() {
    var btn = ElevatedButton(onPressed: () {

      _printWithTimestamp('程式啟動');

      var futureResult = Future(doAsyncJob);
      futureResult.then(
        (value) => _printWithTimestamp('doAsyncJob() 回傳值: $value'),
      );

      _printWithTimestamp('程式結束');

    }, child: Text("Future AsyncJob")
    ).applyConstraint(
      id: _ids.btnFeatureAsync,
      width: wrapContent,
      height: wrapContent,
      top: _ids.btnFeatureDelay.bottom.margin(10.h),
      centerHorizontalTo: parent,
    );

    return btn;
  }

  _printWithTimestamp(String str) {
    var now = DateTime.now();
    LogUnit.w('${now.minute}:${now.second} $str');
  }

  int doJob() {
    sleep(const Duration(seconds: 3));
    _printWithTimestamp('doJob() 結束');
    return 0;
  }

  Future<int> doAsyncJob() async {
    await Future.delayed(const Duration(seconds: 3));
    _printWithTimestamp('doAsyncJob()) 結束');
    return 0;
  }
}
