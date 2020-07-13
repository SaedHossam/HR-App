import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:hrapp/Screens/HomeScreen.dart';
import 'package:hrapp/Screens/addLocationScreen.dart';
import 'package:hrapp/Screens/chatScreen.dart';
import 'package:hrapp/Screens/checkInOut.dart';
import 'package:hrapp/Screens/personalScreen.dart';

FFNavigationBar bottomNavBar(int selectedIndex, BuildContext context) {

  return FFNavigationBar(
    theme: FFNavigationBarTheme(
      barBackgroundColor: Colors.white,
      selectedItemBorderColor: Color.fromRGBO(84, 189, 176, 1),
      selectedItemBackgroundColor: Color.fromRGBO(84, 189, 176, 1),
      selectedItemIconColor: Colors.white,
      selectedItemLabelColor: Colors.black,
    ),
    selectedIndex: selectedIndex,
    onSelectTab: (index) {
      selectedIndex = index;
      switch(index) {
        case 0: {Navigator.pushNamed(context, CheckInOut.id); }
        break;
        case 1: {Navigator.pushNamed(context, AddLocation.id); }
        break;
        case 2: { Navigator.pushNamed(context, HomeScreen.id); }
        break;
        case 3: { Navigator.pushNamed(context, PersonalScreen.id); }
        break;
        case 4: { Navigator.pushNamed(context, ChatScreen.id); }
        break;
      }
    },
    items: [
      FFNavigationBarItem(
        iconData: Icons.fingerprint,
        label: '',
      ),
      FFNavigationBarItem(
        iconData: Icons.add_location,
        label: '',
      ),
      FFNavigationBarItem(
        iconData: Icons.home,
        label: '',
      ),
      FFNavigationBarItem(
        iconData: Icons.person,
        label: '',
      ),
      FFNavigationBarItem(
        iconData: Icons.chat,
        label: '',
      ),
    ],
  );
}
