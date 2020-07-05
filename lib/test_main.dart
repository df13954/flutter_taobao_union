import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/list/grid_view.dart';
import 'dart:io';
import 'line/cus_view.dart';
import 'list/list_demo.dart';


class DisDemo extends StatefulWidget {
  DisDemo({Key key}) : super(key: key);

  @override
  _DioState createState() {
    return _DioState();
  }
}
class _DioState extends State<DisDemo>{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[

      ],
    );
  }

}


class Home4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('demo'),
        ),
        body: Stack(
          children: <Widget>[
            //类似于margin left  top
            Positioned(
              child: IconContainer(
                Icons.save,
                size: 30,
                color: Colors.blue,
              ),
              left: 20,
              top: 100,
            ),
            Align(
              child: Image.network(
                "https://upload-images.jianshu.io/upload_images/16293134-e1179189de4cf3de?imageMogr2/auto-orient/strip|imageView2/2/w/640",
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
    );
  }
}

class Home3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('demo'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: IconContainer(
                Icons.save,
                size: 30,
                color: Colors.blue,
              ),
              flex: 2,
            ),
            Expanded(
              flex: 3,
              child: IconContainer(
                Icons.home,
                size: 30,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Home2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('demo'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconContainer(
              Icons.save,
              size: 30,
              color: Colors.blue,
            ),
            IconContainer(
              Icons.home,
              size: 30,
              color: Colors.red,
            ),
            IconContainer(
              Icons.close,
              size: 30,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('demo'),
        ),
        body: Center(
          child: Container(
            child: Text(
              'container 2233233233322123',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20.0),
            ),
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                border: Border.all(color: Colors.black, width: 2.0)),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('hello java'),
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: ClipOval(
      child: Image.network(
        "https://upload-images.jianshu.io/upload_images/16293134-e1179189de4cf3de?imageMogr2/auto-orient/strip|imageView2/2/w/640",
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    )));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _ipAddress = 'Unknown';

  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        result = data['origin'];
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
      _ipAddress = result;
    });
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _ipAddress,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
