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
            child: Image.network('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',height: 80,width: 80,),
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