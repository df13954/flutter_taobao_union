import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/res/res_json.dart';

class ListDemo extends StatelessWidget {
  List<Widget> getListData() {
    List<Widget> list = new List();
    for (var i = 0; i < 200; i++) {
      list.add(Text("item: $i"));
    }
    return list;
  }

  List<Widget> getData() {
    return [
      Container(
        width: 100,
        child: Text('container list'),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
        ),
      ),
      Text('index 0'),
      Text('index 0'),
      Text('index 0'),
      Text('index 0'),
      Text('index 0'),
      ListTile(
        title: Text('list tile'),
        subtitle: Text('sub title'),
      )
    ];
  }

  List list = new List();

  ListDemo() {
    list = getJson();
  }

  List<Widget> getJson() {
    var list = listDataJson.map((value) {
      return ListTile(
        title: Text("item " + value["title"]),
      );
    });
    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hh',
      home: Scaffold(
        appBar: AppBar(
          title: Text('list demo'),
        ),
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return list[index];
            }),
      ),
    );
  }
}
