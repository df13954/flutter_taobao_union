import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/bean/union_on_sell_entity.dart';
import 'package:flutterapp/page_info/ticket_args.dart';
import 'package:flutterapp/union/ticket_detail.dart';
import 'package:flutterapp/utils/color_utils.dart';
import 'package:toast/toast.dart';

class Recommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('特惠推荐'),
      ),
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _getUnionCategory();
  }

  var baseUrl = 'https://api.sunofbeach.net/shop/onSell/1';

  List<UnionOnSellDataTbkDgOptimusMaterialResponseResultListMapData> mList =
      List();

  _getUnionCategory() async {
    var url = baseUrl;
    var httpClient = new HttpClient();
    List<UnionOnSellDataTbkDgOptimusMaterialResponseResultListMapData> tempList;
    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        Map<String, dynamic> map = jsonDecode(json);
        var entity = UnionOnSellEntity().fromJson(map);

        tempList = entity.data.tbkDgOptimusMaterialResponse.resultList.mapData;
      } else {
        result = 'Http status ${response.statusCode}';
      }
    } catch (exception) {
      result = '--> Failed';
    }
    if (!mounted) return;
    setState(() {
      mList = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GridView.builder(
          itemCount: mList?.length ?? 0,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            if (mList == null) {
              return Text("");
            }
            var item = mList[index];
            var imageUrl = item == null ? "" : "https:" + item.pictUrl;
            var itemTitle = item == null ? "" : item.title;
            return GestureDetector(
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Image.network(imageUrl),
                      Container(
                        margin: EdgeInsets.fromLTRB(2, 10, 15, 2),
                        child: Text(
                          itemTitle,
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsUtil.hexColor(0x000814)),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(2, 5, 0, 10),
                            child: Text(
                              "¥" +
                                  (double.parse(item.zkFinalPrice) -
                                          item.couponAmount)
                                      .toStringAsFixed(2)
                                      .toString(),
                              style: TextStyle(
                                  color: ColorsUtil.hexColor(0xFF8500),
                                  fontSize: 15),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 5, 0, 10),
                            child: Text(
                              "原价价:" +
                                  (double.parse(item.zkFinalPrice))
                                      .toStringAsFixed(2)
                                      .toString(),
                              style: TextStyle(
                                  color: ColorsUtil.hexColor(0x666666),
                                  fontSize: 13,
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
              ),
              onTap: () {
                setState(() {
                  itemClick(index);
                });
              },
            );
          }),
    );
  }

  void itemClick(int index) {
    var item = mList[index];
    //Toast.show("click $msg", context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TicketDetail(),
        settings: RouteSettings(
          arguments: TicketArgs(
            item.title,
            item.couponClickUrl == null
                ? item.clickUrl
                : item.couponClickUrl,
            "https:" + item.pictUrl,
          ),
        ),
      ),
    );
  }
}
