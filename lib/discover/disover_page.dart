import 'package:flutter/material.dart';
import 'package:flutter_wecat/common/res/resources.dart';
import 'package:flutter_wecat/discover/social_circle_page.dart';
import 'package:flutter_wecat/discover/view/discover_view.dart';

class DiscoverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DiscoverPageState();
  }
}

class DiscoverPageState extends State<DiscoverPage> {
  Future<void> _clickEventAction(int type,dynamic data) async{
    Map dataMap = data as Map;
    if(type == 0) {
      if (dataMap['title'].toString() == '朋友圈'){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context){
              return SocialCirclePage();
            })
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '发现'
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colours.bg_color,
            child: DiscoverView(
              onPressed: (int type,dynamic data) {
                _clickEventAction(type, data);
              },
            ),
          ),
        ),
      ),
    );
  }
}