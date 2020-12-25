import 'package:flutter/material.dart';
import 'package:flutter_weicat/common/res/resources.dart';
import 'package:flutter_weicat/discover/models/social_circel_model.dart';
import 'package:flutter_weicat/discover/view/social_circle_view.dart';

import 'widget/social_circle_item.dart';

class SocialCirclePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SocialCirclePageState();
  }
}

class SocialCirclePageState extends State<SocialCirclePage> {

  List<SocialCircleModel> dataList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataList = [
      SocialCircleModel(
          headerUrl: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
          nickName: '木木次女',
          contentStr: '日落西山红霞飞，战士打靶燕飞回',
          iconList: [
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg'
          ],
          dateStr: '9小时前'
      ),
      SocialCircleModel(
        headerUrl: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
        nickName: '泰罗',
        contentStr: '太子党',
        iconList: [
          'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
          'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
          'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg'
        ],
        dateStr: '23小时前'
      ),
      SocialCircleModel(
          headerUrl: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
          nickName: '天行者',
          contentStr: '一个孤独的天行者，十大撒打算撒打算撒大撒打算撒打算的阿斯顿阿斯顿撒打算打算一个孤独的天行者，十大撒打算撒打算撒大撒打算撒打算的阿斯顿阿斯顿撒打算打算一个孤独的天行者，十大撒打算撒打算撒大撒打算撒打算的阿斯顿阿斯顿撒打算打算一个孤独的天行者，十大撒打算撒打算撒大撒打算撒打算的阿斯顿阿斯顿撒打算打算一个孤独的天行者，十大撒打算撒打算撒大撒打算撒打算的阿斯顿阿斯顿撒打算打算',
          iconList: [
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg'
          ],
          dateStr: '10小时前'
      ),
      SocialCircleModel(
          headerUrl: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
          nickName: '爱迪王',
          contentStr: '第一酱油王',
          iconList: [
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg'
          ],
          dateStr: '10小时前'
      ),
      SocialCircleModel(
          headerUrl: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
          nickName: '空明',
          contentStr: '太子党一号人物',
          iconList: [
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg'
          ],
          dateStr: '10小时前'
      ),SocialCircleModel(
          headerUrl: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3215504584,2616830327&fm=26&gp=0.jpg',
          nickName: '微明',
          contentStr: '太子党三号人物',
          iconList: [

          ],
          dateStr: '10小时前'
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SocialCircleView(
            dataList: dataList,
          ),
        ),
      ),
    );
  }
}