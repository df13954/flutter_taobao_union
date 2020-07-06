import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/bean/union_category_detail_entity.dart';
import 'package:flutterapp/page_info/ScreenArguments.dart';
import 'package:flutterapp/utils/color_utils.dart';
import 'package:toast/toast.dart';

class CategoryDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    print("arg ->> " + args.id);

    return new MaterialApp(
      home: new MyCategoryDetail(
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

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
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
          itemCount: category.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 2 / 1,
                      child: Image.network(
                        "https:" + category[index].pictUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ListTile(
                      title: Text(category[index].title,style: TextStyle(
                        color: ColorsUtil.hexColor(0x333333)
                      ),),
                      subtitle: Text(category[index].itemDescription),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(17, 0, 10, 0),
                          child: Text(
                            "补贴价  ¥" + category[index].zkFinalPrice,
                            style: TextStyle(
                              color: ColorsUtil.hexColor(0xFD4A43),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(17, 5, 10, 0),
                          child: Text(
                            "优惠券数量:" +
                                category[index].couponTotalCount.toString(),
                            style: TextStyle(
                              color: ColorsUtil.hexColor(0x9C9C9C),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(2, 5, 0, 0),
                          child: Text(
                            "付款: " + category[index].commissionRate,
                            style: TextStyle(
                                color: ColorsUtil.hexColor(0xFF8500),
                                fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(17),
                          child: Text(category[index].couponStartTime),
                        )
                      ],
                    )
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
    Toast.show("click $msg", context);
  }
}
