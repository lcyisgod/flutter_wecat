import 'package:flutter/material.dart';

class DistanceWidget extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const DistanceWidget({Key key, this.height,this.width,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: width==null?double.infinity:width,
      height: height == null?double.infinity:height,
      color: color == null?Colors.white:color,
    );
  }
}