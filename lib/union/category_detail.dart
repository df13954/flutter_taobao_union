import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/bean/union_category_detail_entity.dart';
import 'package:flutterapp/page_info/ScreenArguments.dart';
import 'package:flutterapp/page_info/ticket_args.dart';
import 'package:flutterapp/union/ticket_detail.dart';
import 'package:flutterapp/utils/color_utils.dart';
import 'package:toast/toast.dart';

/// 分类之后的,详情页面
class CategoryDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    print("arg ->> " + args.id);
    return new Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: new MyCategoryDetail(
        arg: args,
      ),
    );
  }
}

class MyCategoryDetail extends StatefulWidget {
  MyCategoryDetail({Key key, this.arg}) : super(key: key);
  ScreenArguments arg;

  @override
  _MyDetailState createState() => new _MyDetailState(this.arg);
}

class _MyDetailState extends State<MyCategoryDetail> {
  ScreenArguments arguments;


  _MyDetailState(ScreenArguments arg) {
    this.arguments = arg;
    print("state arg: " + arg.id);
    baseUrl = 'https://api.sunofbeach.net/shop/discovery/' + arg.id + "/1";
    _getUnionCategory();
  }

  var baseUrl;

  List<UnionCategoryDetailData> category = List();

  _getUnionCategory() async {
    var url = baseUrl;
    print("http ->> " + url);

    var httpClient = new HttpClient();
    List<UnionCategoryDetailData> tempList;
    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        Map<String, dynamic> map = jsonDecode(json);
        var entity = UnionCategoryDetailEntity().fromJson(map);
        tempList = entity.data;
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    if (!mounted) return;

    setState(() {
      category = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: category?.length??0,
          itemBuilder: (context, index) {
            var itemData = category[index];
            return GestureDetector(
              child: Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  children: <Widget>[
                    //一个2:1图片显示
                    AspectRatio(
                      aspectRatio: 2 / 1,
                      child: Image.network(
                        "https:" + category[index].pictUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    //标题,子标题
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: ListTile(
                        title: Text(
                          category[index].title,
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorsUtil.hexColor(0x000814)),
                        ),
                        subtitle: Text(
                          category[index].itemDescription,
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsUtil.hexColor(0x666666)),
                        ),
                      ),
                    ),
                    //优惠的额度
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(17, 0, 10, 0),
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              itemData.couponAmount.toString() == null
                                  ? ""
                                  : itemData.couponAmount.toString() + "元优惠",
                              style: TextStyle(
                                color: ColorsUtil.hexColor(0xffffff),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          color: ColorsUtil.hexColor(0xFD4A43),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(17, 5, 10, 10),
                          child: Text(
                            itemData.volume.toString() + "人已经购买",
                            style: TextStyle(
                              color: ColorsUtil.hexColor(0x9C9C9C),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(2, 5, 0, 10),
                          child: Text(
                            "券后价:" +
                                (double.parse(itemData.zkFinalPrice) -
                                        itemData.couponAmount)
                                    .toStringAsFixed(2)
                                    .toString(),
                            style: TextStyle(
                                color: ColorsUtil.hexColor(0xFF8500),
                                fontSize: 13),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 5, 0, 10),
                          child: Text(
                            "原价价:" +
                                (double.parse(itemData.zkFinalPrice))
                                    .toStringAsFixed(2)
                                    .toString(),
                            style: TextStyle(
                                color: ColorsUtil.hexColor(0x666666),
                                fontSize: 13,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: ColorsUtil.hexColor(0x454646)),
                          ),
                        ),
                      ],
                    ),
                  ],
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
    var msg = category[index].title;
    //Toast.show("click $msg", context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TicketDetail(),
        settings: RouteSettings(
          arguments: TicketArgs(
            category[index].title,
            category[index].couponClickUrl == null
                ? category[index].clickUrl
                : category[index].couponClickUrl,
            "https:" + category[index].pictUrl,
          ),
        ),
      ),
    );
  }
}
