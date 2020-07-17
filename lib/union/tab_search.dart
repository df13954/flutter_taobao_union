import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/bean/union_search_entity.dart';

class Pages extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '搜索宝贝'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<UnionSearchDataTbkDgMaterialOptionalResponseResultListMapData> mapData =
  List();

  @override
  void initState() {
    super.initState();
    _getIPAddress();
  }

  void _incrementCounter() {
    _getIPAddress();
  }

  _getIPAddress() async {
    var content = etController.text;
    if (null == content) {
      return;
    }
    var url = 'https://api.sunofbeach.net/shop/search?keyword=$content&page=1';
    var httpClient = new HttpClient();

    List<UnionSearchDataTbkDgMaterialOptionalResponseResultListMapData> result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        Map<String, dynamic> jsonMap = jsonDecode(json);
        UnionSearchEntity data = UnionSearchEntity().fromJson(jsonMap);
        result = data.data.tbkDgMaterialOptionalResponse.resultList.mapData;
      } else {}
    } catch (exception) {}

    if (!mounted) return;

    setState(() {
      mapData = result;
    });
  }

  var etController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(12, 15, 12, 10),
            width: double.infinity,

            child: TextField(
              style: TextStyle(fontSize: 26),
              controller: etController,
              decoration: InputDecoration(hintText: "search"),
            ),
          ),
          Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Image.network(mapData[index].pictUrl),
                          title: Text(mapData[index].title),
                          subtitle: Text(mapData[index].itemDescription),
                        ),
                        Row(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(14, 0, 0, 0),
                                child: Text(
                                    "付款：" + mapData[index].volume.toString()),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                              child: Text(
                                  "佣金率：" + mapData[index].commissionRate,
                                  style: TextStyle(
                                    color: Colors.red,
                                  )),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(14, 5, 0, 0),
                              child: Text(mapData[index].provcity),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(14, 5, 0, 0),
                              child: Text(mapData[index].levelOneCategoryName),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(15, 5, 0, 14),
                              child: Text("店铺：" + mapData[index].shopTitle),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: mapData == null ? 0 : mapData.length,
              ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.
        add
        )
        ,
      )
      , // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
