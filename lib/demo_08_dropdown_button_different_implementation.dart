import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var trans = ['火車', '高鐵', '巴士'];

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({super.key});

  @override
  State<StatefulWidget> createState() => _DropdownWidgetState();
}

class _Ids {
  final dropdownButton01 = ConstraintId("dropdownButton01");
  final btnConfirm = ConstraintId("btnConfirm");
  final tvShowContent = ConstraintId("tvShowContent");
}

class _DropdownWidgetState extends State<DropdownWidget> {
  late final _Ids _ids;
  int? selectedValue; //儲存使用者挑選的編號

  late final ValueNotifier<String> _itemName;
  late final ValueNotifier<int> _selectedItem;

  @override
  void initState() {
    super.initState();
    _ids = _Ids();
    _itemName = ValueNotifier('');
    _selectedItem = ValueNotifier(-1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstraintLayout(
        children: [_buildDropdownButton(), _buildBtnConfirm(),_buildTvShowContent()],
      ),
    );
  }

  Widget _buildDropdownButton() {
    return ValueListenableBuilder<int>(
      valueListenable: _selectedItem,
      builder: (context, value, child) {
       return DropdownButton(
          items: [
            DropdownMenuItem(
              value: 0,
              child: Text(trans[0], style: TextStyle(fontSize: 20.sp)),
            ),
            DropdownMenuItem(
              value: 1,
              child: Text(trans[1], style: TextStyle(fontSize: 20.sp)),
            ),
            DropdownMenuItem(
              value: 2,
              child: Text(trans[2], style: TextStyle(fontSize: 20.sp)),
            ),
          ],
          onChanged: (dynamic value) {
            _selectedItem.value = value as int;
          },
          hint: Text("請選擇交通工具", style: TextStyle(fontSize: 20.sp)),
          value: _selectedItem.value < 0 ? null : _selectedItem.value,
        ).applyConstraint(
          id: _ids.dropdownButton01,
          width: wrapContent,
          height: wrapContent,
          top: parent.top.margin(10.h),
          centerHorizontalTo: parent,
        );
      },
    );
  }

  Widget _buildBtnConfirm() {
    return ElevatedButton(
      onPressed: () {
        _itemName.value = _selectedItem.value < 0
            ? ''
            : trans[_selectedItem.value];
      },
      child: Text("確定", style: TextStyle(fontSize: 18.sp)),
    ).applyConstraint(
      id: _ids.btnConfirm,
      width: wrapContent,
      height: wrapContent,
      top: _ids.dropdownButton01.bottom.margin(10.h),
      centerHorizontalTo: parent,
    );
  }

  Widget _buildTvShowContent() {
    return ValueListenableBuilder<String>(
      valueListenable: _itemName,
      builder: (context, value, child) {
        return Text(_itemName.value, style: TextStyle(fontSize: 20.sp)).applyConstraint(
          id: _ids.tvShowContent,
          width: wrapContent,
          height: wrapContent,
          top: _ids.btnConfirm.bottom.margin(10.h),
          centerHorizontalTo: parent,
        );
      }
    );
  }
}
