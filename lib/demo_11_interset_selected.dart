import 'package:demo002/extension/buildContext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _Ids {
  final checkBoxes = ConstraintId("checkBoxes");
  final btnConfirm = ConstraintId("btnConfirm");
  final tvResult = ConstraintId("tvResult");
}

class Demo11IntersetSelected extends StatelessWidget {
  Demo11IntersetSelected({super.key});

  final _ids = _Ids();

  static const _hobbies = <String>[
    '游泳',
    '唱歌',
    '聽音樂',
    '騎單車',
    '旅遊',
    '美食',
    '運動',
    '籃球',
    '跳舞',
    '棒球',
    '閱讀',
    '寫作',
  ];

  final ValueNotifier<List<bool>> _hobbiesSelected = ValueNotifier(
    List<bool>.generate(_hobbies.length, (int index) => false),
  );

  final ValueNotifier<String> _text = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    var body = SingleChildScrollView(
      child: ConstraintLayout(
        children: [
          ValueListenableBuilder(
            valueListenable: _hobbiesSelected,
            builder: _hobbySelectionBuilder,
          ),
          _buildBtnConfirm(context),
          ValueListenableBuilder(valueListenable: _text, builder:_buildTvResult)
        ],
      ),
    );

    return Scaffold(body: body);
  }

  Widget _hobbySelectionBuilder(
    BuildContext context,
    List<bool> hobbiesSelected,
    Widget? child,
  ) {
    List<CheckboxListTile> checkBoxes = [];

    for (var i = 0; i < _hobbies.length; i++) {
      checkBoxes.add(
        CheckboxListTile(
          title: Text(_hobbies[i], style: TextStyle(fontSize: 20.sp)),
          value: _hobbiesSelected.value[i],
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (newValue) {
            // 更新資料
            _hobbiesSelected.value[i] = newValue as bool;

            // 要給一個新的 List 給
            _hobbiesSelected.value = List.from(_hobbiesSelected.value);
          },
        ),
      );
    }

    final wid =
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: checkBoxes,
        ).applyConstraint(
          id: _ids.checkBoxes,
          width: 200.w,
          height: wrapContent,
          top: parent.top.margin(10.h),
          centerHorizontalTo: parent,
        );

    return wid;
  }

  Widget _buildBtnConfirm(BuildContext context) {
    var btn =
        ElevatedButton(
          onPressed: () {
            _showHobbies();
          },
          child: Text(context.l10n.commonConfirm),
        ).applyConstraint(
          id: _ids.btnConfirm,
          width: wrapContent,
          height: wrapContent,
          top: _ids.checkBoxes.bottom.margin(10.h),
          centerHorizontalTo: parent,
        );

    return btn;
  }

  Widget _buildTvResult(BuildContext context, String text, Widget? child) {
    final wid = Text(text, style: TextStyle(fontSize: 20.sp)).applyConstraint(
      id: _ids.tvResult,
      width: wrapContent,
      height: wrapContent,
      top: _ids.btnConfirm.bottom.margin(10.h),
      centerHorizontalTo: parent,
    );

    return wid;
  }

  _showHobbies() {
    String selectedHobbies = '';
    for (var i = 0; i < _hobbies.length; i++) {
      if (_hobbiesSelected.value[i]) selectedHobbies += "${_hobbies[i]},";
    }
    _text.value = selectedHobbies;
  }
}
