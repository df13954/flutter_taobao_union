import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/bean/union_category_detail_entity.dart';
import 'package:flutterapp/bean/union_ticket_entity.dart';
import 'package:flutterapp/page_info/ticket_args.dart';
import 'package:flutterapp/utils/color_utils.dart';
import 'package:toast/toast.dart';

/// 生成淘宝口令页面
class TicketDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TicketArgs args = ModalRoute.of(context).settings.arguments;
    print("arg ticket ->> " + args.title);
    print("arg ticket ->> " + args.url);
    print("arg ticket ->> " + args.cover);
    return new Scaffold(
      appBar: AppBar(
        title: Text('淘口令'),
      ),
      body: new TicketDetailState(
        arg: args,
      ),
    );
  }
}

class TicketDetailState extends StatefulWidget {
  TicketDetailState({Key key, this.arg}) : super(key: key);
  TicketArgs arg;

  @override
  _MyTicketState createState() => new _MyTicketState(this.arg);
}

class _MyTicketState extends State<TicketDetailState> {
  TicketArgs arguments;
  var baseUrl;
  UnionTicketEntity ticketEntity;

  _MyTicketState(TicketArgs arg) {
    this.arguments = arg;
    baseUrl = 'https://api.sunofbeach.net/shop/tpwd';
    _getUnionTicket();
  }

  _getUnionTicket() async {
    var url = baseUrl;
    print("http ->> " + url);

    var httpClient = new HttpClient();
    UnionTicketEntity entity;
    String result;
    try {
      //post request
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      // post 在领券联盟的接口,使用post 方式
      request.headers.set('content-type', 'application/json');
      Map jsonMap = {'url': "https:" + arguments.url, 'title': arguments.title};
      request.add(utf8.encode(json.encode(jsonMap)));

      var response = await request.close();
      print("http------>>");
      print(response.headers);
      print(response);

      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        Map<String, dynamic> map = jsonDecode(json);
        entity = UnionTicketEntity().fromJson(map);
      } else {
        result = 'Http status ${response.statusCode}';
        print('Http reasonPhrase ${response.reasonPhrase}');
      }
    } catch (exception) {
      result = 'Failed getting ticket';
    }
    print("->> $result");
    if (!mounted) return;
    setState(() {
      print("http succeed");
      ticketEntity = entity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 30),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              //增加圆角裁剪
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Image.network(
                  arguments.cover,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
              decoration: BoxDecoration(
                border: new Border.all(color: Color(0xFF9E9E9E), width: 1),
                // 边色与边宽度
                color: Colors.white,
                // 底色
                shape: BoxShape.rectangle,
                // 默认值也是矩形
                borderRadius: new BorderRadius.circular((5.0)), // 圆角度
              ),
              child: Text(
                ticketEntity == null
                    ? ""
                    : ticketEntity.data.tbkTpwdCreateResponse.data.model,
                style: TextStyle(
                    fontSize: 25, color: ColorsUtil.hexColor(0x666666)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                decoration: BoxDecoration(
                  // 边色与边宽度
                  color: ColorsUtil.hexColor(0xFF8500),
                  // 底色
                  shape: BoxShape.rectangle,
                  // 默认值也是矩形
                  borderRadius: new BorderRadius.circular((5.0)), // 圆角度
                ),
                child: Text(
                  "复制口令",
                  style: TextStyle(
                      fontSize: 25, color: ColorsUtil.hexColor(0xffffff)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
