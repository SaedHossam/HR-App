import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:hrapp/Components/roundedBtn.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  static const String id = 'home_screen';
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 2;
  String dateToday = "May, 21 - 2020";
  String arrivalTime = "09:20 AM";
  String leaveTime = "00:00 00";

  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery.of(context).size.width;
//    double height = MediaQuery.of(context).size.height;
//    print("$width $height");
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.menu,
            color: Colors.white,
            size: 35.34,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 35.34,
              ),
            ),
          ),
        ],
        centerTitle: true,
        title: Text("الرئيسية"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 360.0,
              height: 182.28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromRGBO(221, 239, 237, 1),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        -0.1, // horizontally
                        2.5, // Vertically
                      ))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
//                  Container(
//                    width: 7.44,
//                    height: 180,
//                    color: Colors.black,
//                    //color: Color.fromRGBO(71, 80, 98,1),
//                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 32, right: 32.0, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              dateToday,
                              style: KCardTextStyle.copyWith(fontSize: 22.32),
                            ),
                            CircleAvatar(
                              backgroundColor: Color.fromRGBO(71, 80, 91, 1),
                              radius: 26.5,
                              foregroundColor: Colors.grey,
                              child: Icon(
                                Icons.date_range,
                                color: Colors.white,
                                size: 35.34,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 75, right: 100.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              arrivalTime,
                              style: KCardTextStyle.copyWith(fontSize: 18.6),
                            ),
                            Text(
                              "وصول",
                              style: KCardTextStyle.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 22.32),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 75, right: 100.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              leaveTime,
                              style: KCardTextStyle.copyWith(fontSize: 18.6),
                            ),
                            Text(
                              "انصراف",
                              style: KCardTextStyle.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 22.32),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            RoundedButton(
              onPressed: () {},
              title: 'تسجيل وصول / انصراف',
            ),
            RoundedButton(
              onPressed: () {},
              title: 'طلب أجازة',
            ),
            RoundedButton(
              onPressed: () {},
              title: 'المراسلات',
            )
          ],
        ),
      ),
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
