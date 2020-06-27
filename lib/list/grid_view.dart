



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GrideViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'gird view',
      home: Scaffold(
        appBar: AppBar(
          title: Text('gird view'),
        ),
        body: GridView.count(
          crossAxisCount: 3,
        childAspectRatio: 1.7,
        children: <Widget>[
          Image.network('https://itying.com/images/flutter/1.png',
          fit: BoxFit.cover,),
          Image.network('https://itying.com/images/flutter/2.png'),
          Image.network('https://itying.com/images/flutter/3.png'),
          Image.network('https://itying.com/images/flutter/4.png'),
          Image.network('https://itying.com/images/flutter/5.png'),
          Image.network('https://itying.com/images/flutter/6.png'),
        ],),
      ),
    );
  }

}