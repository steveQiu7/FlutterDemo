import 'package:demo002/units/log_unit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo06ListView extends StatefulWidget {
  const Demo06ListView({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Demo06ListView> {
  final _scrollController = ScrollController();
  List<int> _items = List.generate(100, (index) => index);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      LogUnit.d("reach the bottom");
      _loadMore();
    }
  }

  // 下拉刷新
  Future<void> _onRefresh() async {
    LogUnit.d("開始刷新");

    // 模擬網路請求延遲
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _items = List.generate(100, (index) => index);
    });

    LogUnit.d("刷新完成");
  }

  void _loadMore() {
    LogUnit.d("載入更多資料");

    setState(() {
      int currentLength = _items.length;
      _items.addAll(List.generate(10, (index) => currentLength + index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('下拉刷新示範'),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh, // 下拉刷新時的回調函數
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("item ${_items[index]}"),
              subtitle: Text("索引: $index"),
            );
          },
        ),
      ),
    );
  }
}
