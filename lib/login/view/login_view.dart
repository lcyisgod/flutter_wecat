import 'package:flutter/material.dart';
import 'package:flutter_wecat/common/res/resources.dart';
import 'package:flutter_wecat/common/widget/distance_widget.dart';

class LoginView extends StatefulWidget {
  final Function(int type,Map<String,dynamic>? map)? onPressed;
  const LoginView({Key? key, this.onPressed}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginViewState();
  }
}

class LoginViewState extends State<LoginView> {

  late bool canLogin;
  late List<TextEditingController> controllerList;

  @override
  void initState() {
    super.initState();
    canLogin = false;
    controllerList = <TextEditingController>[
      TextEditingController(text: '+86'),
      TextEditingController(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
          top: 100,
        ),
        color: Colors.white,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment(-1, 0),
              child: Text(
                '手机号登录',
                style: TextStyles.textMain30Body,
              ),
            ),
            DistanceWidget(
              height: 30,
            ),
            InkWell(
              onTap: (){
                widget.onPressed?.call(0,null);
              },
              child: Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '国家/地区  中国大陆',
                      style: TextStyles.textMain18Body,
                    ),
                    Icon(Icons.chevron_right_rounded)
                  ],
                ),
              ),
            ),
            Divider(
              height: 1,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    alignment: Alignment(0,0),
                    child: TextField(
                      enabled: false,
                      controller: controllerList[0],
                      style: TextStyles.textMain18Body,
                      textInputAction: TextInputAction.done,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none, //去掉下划线
                        isCollapsed: true
                      ),
                    ),
                  ),
                  DistanceWidget(
                    width: 0.5,
                    color: Colours.color_7766,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment(0,0),
                      child: TextField(
                        controller: controllerList[1],
                        style: TextStyles.textMain18Body,
                        textInputAction: TextInputAction.done,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.phone,
                        onChanged: (String text) {
                          if(text.isNotEmpty && !canLogin) {
                            setState(() {
                              canLogin = true;
                            });
                          }
                          if(text.isEmpty && canLogin) {
                            setState(() {
                              canLogin = false;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,//去掉下划线
                          hintText: '请填写手机号码',
                          ///TextField在设置高度后
                          ///如果布局高度小于它的默认高度
                          ///那么它的文本在垂直居中上就会有问题
                          ///使用isCollapsed来取消默认高度使其跟随父空间高度
                          ///默认高度多少没查到
                          isCollapsed: true,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              height: 1,
            ),
            DistanceWidget(
              height: 30,
            ),
            InkWell(
              onTap: (){
                widget.onPressed?.call(1,null);
              },
              child: Container(
                height: 40,
                width: double.infinity,
                alignment: Alignment(-1,0),
                child: Text(
                  '用微信号/QQ号/邮箱登录号',
                  style: TextStyles.text6ca516,
                ),
              ),
            ),
            DistanceWidget(
              height: 60,
            ),
            InkWell(
              onTap: (){
                if(canLogin) {
                  widget.onPressed?.call(2,{'phone':controllerList[1].text});
                }
              },
              child: Container(
                height: 40,
                width: double.infinity,
                alignment: Alignment(0,0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: canLogin?Colours.color_6ca5:Colours.color_e2e2
                ),
                child: Text(
                  '下一步',
                  style: TextStyles.text18White,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 150
              ),
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      widget.onPressed?.call(3,null);
                    },
                    child: Text(
                      '找回密码 ',
                      style: TextStyles.text6ca516,
                    ),
                  ),
                  DistanceWidget(
                    width: 0.5,
                    color: Colours.color_7766,
                  ),
                  InkWell(
                    onTap: (){
                     widget.onPressed?.call(4,null);
                    },
                    child: Text(
                      ' 更多选项',
                      style: TextStyles.text6ca516,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}