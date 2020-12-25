import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_weicat/common/widget/blanktoolbar/blank_tool_bar_tool.dart';
import 'package:flutter_weicat/login/view/login_view.dart';
import 'package:flutter_weicat/main_page.dart';
import 'package:oktoast/oktoast.dart';

import 'common/res/resources.dart';

void main() {
  EasyLoading.instance
    ..maskType = EasyLoadingMaskType.clear;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: FlutterEasyLoading(
          child: MaterialApp(
            title: '微信',
            theme: ThemeData(
              primaryColor:Colours.bg_color,
              scaffoldBackgroundColor: Colors.white,
            ),
            home: MyHomePage(),
          ),
        ),
        backgroundColor: Colors.black54,
        textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  BlankToolBarModel blankToolBarModel = BlankToolBarModel();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: BlankToolBarTool.blankToolBarWidget(
        context,
        model: blankToolBarModel,
        showToolBar: false,
        body: SafeArea(
          child: Center(
            child: LoginView(
              onPressed: (int type, dynamic data) {
                /*
                * 0:选择地区
                * 1:邮箱登陆
                * 2:下一步
                * 3:找回密码
                * 4:更多选项*/
                if (type == 2) {
                  Map dataMap = data as Map;
                  String phone = dataMap['phone'] as String;
                  if (phone.isNotEmpty) {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){return MainPage();}), (route) => false
                    );
                  }
                }
              },
            ),
          ),
        )
      ),
    );
  }
}
