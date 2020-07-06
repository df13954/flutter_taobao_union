import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/bean/union_categories_entity.dart';
import 'package:flutterapp/page_info/ScreenArguments.dart';
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _getUnionCategory();
  }

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
              child: ListTile(
                title: Text("id->  " + category[index].id.toString()),
                subtitle: Text(category[index].title),
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryDetail(),
        // Pass the arguments as part of the RouteSettings. The
        // ExtractArgumentScreen reads the arguments from these
        // settings.
        settings: RouteSettings(
          arguments: ScreenArguments(
            category[index].id.toString(),
            msg,
          ),
        ),
      ),
    );
  }
}
