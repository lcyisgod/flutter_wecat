import 'package:flutter/material.dart';
import 'package:flutter_weicat/contacts/contacts_page.dart';
import 'package:flutter_weicat/discover/disover_page.dart';
import 'package:flutter_weicat/me/me_page.dart';
import 'package:flutter_weicat/message/message_page.dart';

import 'common/res/resources.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {

  PageController _pageController;
  int _currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            iconSize: 21.0,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            selectedItemColor: Colours.app_main,
            unselectedItemColor: Color(0xFFBFBFBF),
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add
                ),
                activeIcon: Icon(
                    Icons.add_a_photo
                ),
                label: '微信'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.deck
                  ),
                  activeIcon:  Icon(
                      Icons.deck
                  ),
                  label: '通讯录'
              ),
              BottomNavigationBarItem(
                  icon:  Icon(
                      Icons.find_in_page
                  ),
                  activeIcon: Icon(
                      Icons.find_in_page_outlined
                  ),
                  label: '发现'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                      Icons.minimize
                  ),
                  activeIcon: Icon(
                      Icons.minimize_outlined
                  ),
                  label: '我'
              )
            ],
            onTap: (int index) {
              _pageController.jumpToPage(index);
            },
          ),
          body: PageView(
            controller: _pageController,
            children: [
              MessagePage(),
              ContactsPage(),
              DiscoverPage(),
              MePage()
            ],
            onPageChanged: (int index){
              setState(() {
                _currentIndex = index;
              });
            },
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
        onWillPop: null);
  }
}