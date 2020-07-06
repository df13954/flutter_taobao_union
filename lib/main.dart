import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/bean/union_categories_entity.dart';
import 'package:flutterapp/page_info/ScreenArguments.dart';
import 'package:flutterapp/union/category_detail.dart';
import 'package:flutterapp/union/union_nav.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: BottonWidget(),
    );
  }
}

