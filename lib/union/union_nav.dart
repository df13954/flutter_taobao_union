// 动态的Widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/union/tab_search.dart';

import 'airplay.dart';
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
  int _currentIndex = 0;

  List<Widget> lists = List();

  // 重写方法 把四个文件添加到lists里面
  @override
  void initState() {
    lists..add(Home())..add(Recommend())..add(TabSearch())..add(TabPreferential());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 根据用户点击的索引显示不同的内容
      body: lists[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            // 设置图标,颜色和文字
            icon: Icon(
              Icons.home,
              color: _Color,
            ),
            title: Text(
              '分类',
              style: TextStyle(color: _Color),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.child_friendly,
              color: _Color,
            ),
            title: Text(
              '特惠',
              style: TextStyle(color: _Color),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _Color,
            ),
            title: Text(
              '搜索',
              style: TextStyle(color: _Color),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_shopping_cart,
              color: _Color,
            ),
            title: Text(
              '精选',
              style: TextStyle(color: _Color),
            ),
          ),
        ],

        // 点击哪个高亮
        currentIndex: _currentIndex,

        // 用户点击哪个把索引赋值给 _currentIndex
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
