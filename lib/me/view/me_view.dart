import 'package:flutter/cupertino.dart';
import 'package:flutter_wecat/common/res/resources.dart';
import 'package:flutter_wecat/common/widget/distance_widget.dart';
import 'package:flutter_wecat/login/view/disover_item.dart';
import 'package:flutter_wecat/me/view/person_info_item.dart';

class MeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MeViewState();
  }
}

class MeViewState extends State<MeView> {
  List dataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataList = [
      {},
      {
        'title':'支付',
        'image':'assets/images/ic_wallet.png'
      },
      {},
      {
        'title':'收藏',
        'image':'assets/images/ic_collections.png'
      },
      {
        'title':'相册',
        'image':'assets/images/ic_album.png'
      },
      {},
      {
        'title':'卡包',
        'image':'assets/images/ic_cards_wallet.png'
      },
      {
        'title':'表情',
        'image':'assets/images/ic_emotions.png'
      },
      {},
      {
        'title':'设置',
        'image':'assets/images/ic_settings.png'
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: dataList.length+1,
        itemBuilder: (BuildContext context, int index){
        if (index == 0) {
          return PersonInfoItem();
        }else {
          Map dataMap = dataList[index-1];
          if (dataMap.isNotEmpty) {
            return DisoverItem(
              imageUrl: dataMap['image'].toString()??'',
              title: dataMap['title'].toString()??'',
              hideArrow: false,
            );
          }else {
            return DistanceWidget(
              height: 15,
              color: Colours.bg_color,
            );
          }
        }
        });
  }
}