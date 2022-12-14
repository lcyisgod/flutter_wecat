import 'package:flutter/material.dart';
import 'package:flutter_wecat/common/res/resources.dart';

class PersonInfoItem extends StatelessWidget {
  final String iconStr;
  final String weCatName;
  final String weCatNum;

  const PersonInfoItem({Key key, this.iconStr, this.weCatName, this.weCatNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100,
      color: Colors.white,
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network('https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi1.hdslb.com%2Fbfs%2Farchive%2F9f7069ccbb537742fa8946d4dd3b9624fd9025df.jpg&refer=http%3A%2F%2Fi1.hdslb.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1672973706&t=d20919bee00b32dc72f6a5b4047698bf',height: 80,width: 80,),
          ),
          Expanded(
            child: Container(
              alignment: Alignment(-1,0),
              margin: EdgeInsets.only(
                left: 15,
                top: 5
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      weCatName??'默认名称',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.textMain18Body,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 5
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       Expanded(
                         flex: 10,
                         child:  Text(
                           '微信号：',
                           maxLines: 1,
                           overflow: TextOverflow.ellipsis,
                           style: TextStyles.textMain18Body,
                         ),
                       ),
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            'assets/images/ic_qrcode_preview_tiny.png',
                            height: 10,
                            width: 10,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.chevron_right_rounded,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}