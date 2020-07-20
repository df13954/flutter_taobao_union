import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/bean/union_search_entity.dart';

import '../page_info/ticket_args.dart';
import '../utils/color_utils.dart';
import 'ticket_detail.dart';

class TabSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySearchPage(title: '搜索宝贝'),
    );
  }
}

class MySearchPage extends StatefulWidget {
  MySearchPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MySearchPageState createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  List<UnionSearchDataTbkDgMaterialOptionalResponseResultListMapData> mapData =
      List();

  @override
  void initState() {
    super.initState();
    _getSearchResult();
  }

  void _incrementCounter() {
    _getSearchResult();
  }

  _getSearchResult() async {
    //获得输入框的文本
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
    } catch (exception) {
      print("request error");
    }

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
                var item = mapData[index];
                return GestureDetector(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Image.network(mapData[index].pictUrl),
                          title: Text(mapData[index].title),
                        ),
                        Row(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(14, 0, 0, 0),
                                child: Text(
                                    mapData[index].volume.toString() + "人付款"),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                              child:
                                  Text("优惠：" + mapData[index].couponAmount.toString()+"元",
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
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 5, 0, 10),
                              child: Text(
                                "¥" +
                                    (double.parse(item.zkFinalPrice) -
                                        double.parse(item.couponAmount))
                                        .toStringAsFixed(2)
                                        .toString(),
                                style: TextStyle(
                                    color: ColorsUtil.hexColor(0xFF8500),
                                    fontSize: 15),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(2, 5, 0, 10),
                              child: Text(
                                "原价价:" +
                                    (double.parse(item.zkFinalPrice))
                                        .toStringAsFixed(2)
                                        .toString(),
                                style: TextStyle(
                                    color: ColorsUtil.hexColor(0x666666),
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor:
                                    ColorsUtil.hexColor(0x454646)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    _itemClick(index);
                  },
                );
              },
              itemCount: mapData?.length ?? 0,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.search),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _itemClick(var index) {
    var item = mapData[index];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TicketDetail(),
        settings: RouteSettings(
          arguments: TicketArgs(
            item.title,
            item.couponShareUrl == null ? item.url : item.couponShareUrl,
            "" + item.pictUrl,
          ),
        ),
      ),
    );
  }
}
