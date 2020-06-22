import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

// BotttomNavBar
class BotttomNavBar extends StatefulWidget {
  @override
  _BotttomNavBarState createState() => _BotttomNavBarState();
}

class _BotttomNavBarState extends State<BotttomNavBar> {
  int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
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
        setState(() {
          selectedIndex = index;
          //TODO: Implement methods
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
    );
  }
}

