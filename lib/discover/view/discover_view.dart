import 'package:flutter/material.dart';
import 'package:flutter_wecat/common/res/resources.dart';
import 'package:flutter_wecat/common/widget/distance_widget.dart';
import 'package:flutter_wecat/login/widget/disover_item.dart';

class DiscoverView extends StatefulWidget {
  final Function(int type,Map<String,dynamic> map)? onPressed;

  const DiscoverView({Key? key, this.onPressed}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DiscoverViewState();
  }
}

class DiscoverViewState extends State<DiscoverView> {
  late List dataList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataList = [
      {
        'title':'朋友圈',
        'image':'assets/images/ic_social_circle.png'
      },
      {},
      {
        'title':'扫一扫',
        'image':'assets/images/ic_quick_scan.png'
      },
      {
        'title':'摇一摇',
        'image':'assets/images/ic_shake_phone.png'
      },
      {},
      {
      'title':'看一看',
      'image':'assets/images/ic_feeds.png'
      },
      {
        'title':'搜一搜',
        'image':'assets/images/ic_quick_search.png'
      },
      {},
      {
        'title':'附近的人',
        'image':'assets/images/ic_cards_wallet.png'
      },
      {},
      {
        'title':'购物',
        'image':'assets/images/ic_game_entry.png'
      },
      {
        'title':'游戏',
        'image':'assets/images/ic_game_entry.png'
      },
      {},
      {
        'title':'小程序',
        'image':'assets/images/ic_tx_news.png'
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context,int index){
          Map dataMap = dataList[index];
          if (dataMap.isNotEmpty) {
            return InkWell(
              onTap: (){
                widget.onPressed?.call(0,{'title':dataMap['title']});
              },
              child: DisoverItem(
                imageUrl: dataMap['image'].toString(),
                title: dataMap['title'].toString(),
                hideArrow: false,
              ),
            );
          }else {
            return DistanceWidget(
              height: 15,
              color: Colours.bg_color,
            );
          }
    });
  }
}