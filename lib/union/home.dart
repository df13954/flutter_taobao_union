import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/bean/union_categories_entity.dart';
import 'package:flutterapp/page_info/ScreenArguments.dart';
import 'package:flutterapp/utils/color_utils.dart';
import 'package:toast/toast.dart';

import 'category_detail.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类列表'),
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

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    _getUnionCategory();
  }

  var imgList = [
    "images/ic_recomd.png",
    "images/ic_food.png",
    "images/ic_male.png",
    "images/ic_female.png",
    "images/ic_underwear.png",
    "images/ic_kids.png",
    "images/ic_digital.png",
    "images/ic_cosmetics.png",
    "images/ic_outdoors.png",
    "images/ic_shoes.png",
    "images/ic_furniture.png",
  ];

  var baseUrl = 'https://api.sunofbeach.net/shop/discovery/categories';

  List<UnionCategoriesData> category = List();

  _getUnionCategory() async {
    var url = baseUrl;
    var httpClient = new HttpClient();
    List<UnionCategoriesData> tempList;
    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        Map<String, dynamic> map = jsonDecode(json);
        var entity = UnionCategoriesEntity().fromJson(map);

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
          itemCount: category?.length ?? 0,
          itemBuilder: (context, index) {
            if (category == null) {
              return Text("");
            }
            var item = category[index];
            return GestureDetector(
              child: Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Row(
                  children: <Widget>[
                    //图片
                    Image.asset(
                      imgList[index],
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        item.title,
                        style: TextStyle(
                            color: ColorsUtil.hexColor(0x000814), fontSize: 20),
                      ),
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

  //点击事件部分
  void itemClick(int index) {
    var msg = category[index].title;
    //Toast.show("click $msg", context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryDetail(),
        settings: RouteSettings(
          arguments: ScreenArguments(
            category[index].id.toString(),
            msg,
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
