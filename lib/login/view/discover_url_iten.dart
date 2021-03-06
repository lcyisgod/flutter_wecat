import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weicat/common/res/resources.dart';
import 'package:flutter_weicat/common/widget/distance_widget.dart';

class DisoverUrlItem extends StatelessWidget {
  final Map dataMap;
  final bool hideArrow;

  const DisoverUrlItem({Key key, this.dataMap,this.hideArrow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 55,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 54.75,
            padding: EdgeInsets.only(
                left: 15,
                right: 15
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  dataMap['image'].toString(),
                  width: 30,
                  height: 30,
                ),
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 10
                      ),
                      alignment: Alignment(-1,0),
                      child: Text(
                          dataMap['title'].toString()
                      ),
                    )
                ),
                Offstage(
                  offstage: hideArrow,
                  child: Icon(
                    Icons.chevron_right_rounded,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: 55
            ),
            child: DistanceWidget(
              height: 0.25,
              color: Colours.color_7766,
            ),
          )
        ],
      ),
    );
  }
}