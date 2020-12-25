import 'package:flutter/material.dart';
import 'package:flutter_weicat/common/res/resources.dart';
import 'package:flutter_weicat/me/view/me_view.dart';

class MePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MePageState();
  }
}

class MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colours.bg_color,
            child: MeView(

            ),
          ),
        ),
      ),
    );
  }
}