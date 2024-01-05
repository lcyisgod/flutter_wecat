import 'package:flutter/material.dart';
import 'package:flutter_wecat/common/res/resources.dart';
import 'package:flutter_wecat/discover/models/social_circel_model.dart';

class SocialCircleItem extends StatefulWidget {
  final SocialCircleModel model;

  const SocialCircleItem({Key? key, required this.model}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return SocialCircleItemState();
  }
}

class SocialCircleItemState extends State<SocialCircleItem> {
  Widget buildImageWidget(List dataList,BuildContext context) {
    if (dataList.isEmpty) {
      return Container();
    } else {
      if (dataList.length == 1) {
        return Container(
          margin: EdgeInsets.only(
            top: 5,
            bottom: 5
          ),
          child: Image.network(
            dataList.first.toString(),
            height: 200,
            fit: BoxFit.cover,
          ),
        );
      } else {
        double listHeight = 90.0;
        if (dataList.length <= 3) {
          listHeight = 100.0;
        } else if (dataList.length <= 6) {
          listHeight = 200.0;
        } else {
          listHeight = 350.0;
        }
        return Container(
          margin: EdgeInsets.only(
              top: 5,
              bottom: 5
          ),
          height: listHeight,
          child: GridView.builder(
              itemCount: dataList.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                  crossAxisCount: 3,
                  //横轴间距
                  crossAxisSpacing: 5.0,
                  //子组件宽高长度比例
                  childAspectRatio: 1.0
              ),
              itemBuilder: (BuildContext context,int index){
                return Container(
                  height: 90,
                  child: Column(
                    children: [
                      Container(
                        height: 85,
                        child: Image.network(
                          dataList[index].toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 5,
                      )
                    ],
                  ),
                );
              }),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 5,
              bottom: 5
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///用户头像
                Image.network(
                  widget.model.headerUrl,
                  height: 20,
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 5
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///昵称
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.model.nickName,
                              style: TextStyle(
                                color: Colors.blue
                              ),
                            ),
                          ),
                        ),
                        ///文字内容
                        Container(
                          child: Text(
                              widget.model.contentStr
                          ),
                        ),
                        ///图片布局
                        buildImageWidget(
                            widget.model.iconList,
                            context
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 30,
            padding: EdgeInsets.only(
                left: 30,
                right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///发布时间
                Text(widget.model.dateStr),
                ///点击操作
                IconButton(
                    icon: Icon(Icons.ac_unit),
                    onPressed: () {

                    }
                )
              ],
            ),
          ),
          ///点赞信息布局
          Offstage(
            offstage: true,
            child: Container(
              margin: EdgeInsets.only(
                left: 30,
                right: 10
              ),
              decoration: BoxDecoration(
                color: Colours.bg_color,
                borderRadius: BorderRadius.circular(5.0),
              ),
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(
                    top: 3,
                    bottom: 3,
                    left: 5
                ),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('❤️'),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 10,
                          scrollDirection : Axis.horizontal,
                          itemBuilder: (BuildContext context,int index){
                            return Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                left: 5,
                                right: 5,
                              ),
                              child: InkWell(
                                onTap: (){

                                },
                                child: Text('点赞人1'),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 5,
          ),
          Divider(
            height: 1.0,
          )
        ],
      ),
    );
  }
}