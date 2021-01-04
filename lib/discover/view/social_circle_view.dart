import 'package:flutter/material.dart';
import 'package:flutter_wecat/common/res/resources.dart';
import 'package:flutter_wecat/discover/models/social_circel_model.dart';
import 'package:flutter_wecat/discover/widget/social_circle_item.dart';

class SocialCircleView extends StatefulWidget {
  final List<SocialCircleModel> dataList;

  const SocialCircleView({Key key, this.dataList}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SocialCircleViewState();
  }
}

class SocialCircleViewState extends State<SocialCircleView> {
  ScrollController _controller;
  Color _headerColor;
  double _opacity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
    _headerColor = Color(0x00000000);
    _opacity = 0.0;
    _controller.addListener(() {
      double offset = _controller.offset;
      if (offset > 200 && _opacity == 0.0) {
        setState(() {
          _opacity = 1.0;
          _headerColor = Colors.white;
        });
      }else {
        if (offset < 200 && _opacity == 1.0) {
          setState(() {
            _opacity = 0.0;
            _headerColor = Color(0x00000000);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Stack(
        children: [
          Container(
            color: Colours.bg_color,
            child: ListView.builder(
                itemCount: widget.dataList.length+1,
                controller: _controller,
                itemBuilder: (BuildContext context,int index){
                  if(index == 0) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg'),
                          )
                      ),
                    );
                  } else {
                    SocialCircleModel model = widget.dataList[index-1];
                    return SocialCircleItem(
                      model: model,
                    );
                  }
                }),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              height: 45,
              color: _headerColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(
                          Icons.backspace
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      }),
                  Opacity(
                      opacity: _opacity,
                      child: Text('朋友圈')
                  ),
                  IconButton(icon: Icon(Icons.camera), onPressed: (){})
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}