// 动态的Widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/union/tab_search.dart';

import 'tab_preferential.dart';
import 'tab_recommend.dart';
import 'home.dart';

class BottonWidget extends StatefulWidget {
  BottonWidget({Key key}) : super(key: key);

  _BottonWidgetState createState() => _BottonWidgetState();
}

class _BottonWidgetState extends State<BottonWidget> {
  // 设置定义颜色变量
  final _Color = Colors.lightBlue;

  // 设置初始化的索引
  int _currentIndex;
  List<Widget> _pages= List();

  List<BottomNavigationBarItem> getItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.home,color: _Color), title: Text("分类",
          style: TextStyle(color: _Color))),
      BottomNavigationBarItem(icon: Icon(Icons.child_friendly,color: _Color), title: Text("特惠",
          style: TextStyle(color: _Color))),
      BottomNavigationBarItem(icon: Icon(Icons.search,color: _Color), title: Text("搜索",
          style: TextStyle(color: _Color))),
      BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart,color: _Color), title: Text("精选",
          style: TextStyle(color: _Color))),
    ];
  }

  // 重写方法 把四个文件添加到lists里面
  @override
  void initState() {
    super.initState();
    _pages..add(Home())..add(Recommend())..add(TabSearch())..add(TabPreferential());
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: getItems(),
        onTap: onTabTapped,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
