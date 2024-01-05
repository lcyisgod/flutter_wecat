import 'package:flutter/material.dart';
import 'package:flutter_wecat/common/res/resources.dart';
import 'package:flutter_wecat/me/view/me_view.dart';

class MePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MePageState();
  }
}

class MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
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