import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/bean/union_on_sell_entity.dart';
import 'package:toast/toast.dart';

class Email extends StatelessWidget {
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
      mList = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: mList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Image.network("https:"+mList[index].pictUrl),
                      title: Text(mList[index].itemDescription),
                      subtitle: Text(mList[index].nick),
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
    var msg = mList[index].zkFinalPrice;
    Toast.show("click $msg", context);
  }
}
