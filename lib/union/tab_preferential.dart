import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapp/bean/union_detail_entity.dart';
import 'package:flutterapp/bean/union_list_entity.dart';
import 'package:flutterapp/page_info/ticket_args.dart';
import 'package:flutterapp/union/ticket_detail.dart';
import 'package:flutterapp/utils/color_utils.dart';

class TabPreferential extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('精选'),
      ),
      body: MyPreferentialPage(),
    );
  }
}

class MyPreferentialPage extends StatefulWidget {
  MyPreferentialPage({Key key}) : super(key: key);

  @override
  _MyPreferentialPageState createState() => new _MyPreferentialPageState();
}

class _MyPreferentialPageState extends State<MyPreferentialPage> {
  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  var baseUrl = 'https://api.sunofbeach.net/shop/recommend/categories';

  List<UnionListData> mList = List();
  List<UnionDetailDataTbkUatmFavoritesItemGetResponseResultsUatmTbkItem>
      subList = List();

  _getCategory() async {
    var url = baseUrl;
    var httpClient = new HttpClient();
    List<UnionListData> tempList;
    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        Map<String, dynamic> map = jsonDecode(json);
        var entity = UnionListEntity().fromJson(map);
        tempList = entity.data;
        print("获取分类成功");
      } else {
        result = 'Http status ${response.statusCode}';
      }
    } catch (exception) {
      result = '--> Failed';
    }
    _getDetail(tempList[0].favoritesId);

    if (!mounted) return;
    setState(() {
      mList = tempList;
    });
  }

  _getDetail(var id) async {
    var url = 'https://api.sunofbeach.net/shop/recommend/$id';
    var httpClient = new HttpClient();
    List<UnionDetailDataTbkUatmFavoritesItemGetResponseResultsUatmTbkItem>
        tempList;
    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        print("response: $json");

        Map<String, dynamic> map = jsonDecode(json);
        var entity = UnionDetailEntity().fromJson(map);
        tempList =
            entity.data.tbkUatmFavoritesItemGetResponse.results.uatmTbkItem;
        print("获取分类成功");
      } else {
        result = 'Http status ${response.statusCode}';
      }
    } catch (exception) {
      result = '--> Failed';
    }

    if (!mounted) return;
    setState(() {
      subList = tempList;
      scrollController.animateTo(.0, duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: mList?.length ?? 0,
                itemBuilder: (context, index) {
                  var item = mList[index];
                  return GestureDetector(
                    onTap: () {
                      _getDetail(item.favoritesId);
                    },
                    child: ListTile(
                      title: Text(item.favoritesTitle),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListView.builder(
                controller: scrollController,
                shrinkWrap: true,
                itemCount: subList == null ? "" : subList.length,
                itemBuilder: (context, index) {
                  if (subList == null || subList.length == 0) {
                    return Text("");
                  }

                  var item = subList[index];
                  return GestureDetector(
                    onTap: () {
                      _itemClick(index);
                    },
                    child: Card(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                        children: <Widget>[
                          //一个2:1图片显示
                          Container(
                            child: ClipRRect(
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: Image.network(
                                  item.pictUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.all(5),
                          ),
                          //标题,子标题
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ListTile(
                              title: Text(
                                item.title,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: ColorsUtil.hexColor(0x000814)),
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(17, 0, 10, 10),
                                child: Text(
                                  item.volume.toString() + "人已经购买",
                                  style: TextStyle(
                                    color: ColorsUtil.hexColor(0x9C9C9C),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 0, 0, 10),
                                child: Text(
                                  "原价价:" + item.reservePrice.toString(),
//                                      (double.parse(item.reservePrice))
//                                          .toStringAsFixed(2)
//                                          .toString(),
                                  style: TextStyle(
                                      color: ColorsUtil.hexColor(0x666666),
                                      fontSize: 13,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor:
                                          ColorsUtil.hexColor(0x454646)),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(16,0, 0, 10),
                              child: Text(
                                "券后价:" + item.zkFinalPrice.toString(),
                                style: TextStyle(
                                    color: ColorsUtil.hexColor(0xFF8500),
                                    fontSize: 13),
                              ),
                            ),
                            alignment: Alignment.topLeft,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    ));


  }

  void _itemClick(int index) {
    var item = subList[index];

  }

}
