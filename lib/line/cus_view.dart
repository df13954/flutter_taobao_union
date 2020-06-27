import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  //传递参数
  IconData iconData;
  double size = 20.0;
  Color color = Colors.black;



  IconContainer(this.iconData, {this.size=30, this.color=
  Colors.red});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
      child: Center(
        child: Icon(
          iconData,
          size: size,
        ),
      ),
    );
  }
}
