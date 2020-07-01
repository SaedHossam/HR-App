import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:hrapp/Components/drawerList.dart';

import 'package:hrapp/Screens/HomeScreen.dart';
import 'package:hrapp/Screens/personalScreen.dart';
import 'addLocationScreen.dart';
import 'chatScreen.dart';
import 'checkInOut.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'MainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int selectedIndex = 2;
  List<Widget> screens=[
    ChatScreen(),
    PersonalScreen(),
    HomeScreen(),
    AddLocation(),
    CheckInOut()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: drawerList(context),
      body: screens[selectedIndex],
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Color.fromRGBO(84, 189, 176, 1),
          selectedItemBackgroundColor: Color.fromRGBO(84, 189, 176, 1),
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
            print(selectedIndex);
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.chat,
            label: '',
          ),
          FFNavigationBarItem(
            iconData: Icons.person,
            label: '',
          ),
          FFNavigationBarItem(
            iconData: Icons.home,
            label: '',
          ),
          FFNavigationBarItem(
            iconData: Icons.add_location,
            label: '',
          ),
          FFNavigationBarItem(
            iconData: Icons.fingerprint,
            label: '',
          ),
        ],
      ),
    );
  }
}
