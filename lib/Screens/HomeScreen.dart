import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/Components/roundedBtn.dart';
import 'package:hrapp/Screens/checkInOut.dart';
import 'package:hrapp/Screens/mainScreen.dart';
import 'package:hrapp/Screens/vacationScreen.dart';
import 'package:hrapp/services/size_config.dart';
import '../constants.dart';
import 'chatScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  static const String id = 'home_screen';
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dateToday = "May, 21 - 2020";
  String arrivalTime = "09:20 AM";
  String leaveTime = "00:00 00";


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading:Padding(
          padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal),
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.notifications,
              color: Colors.white,
              size: SizeConfig.blockSizeHorizontal*10,
            ),
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: SizeConfig.blockSizeHorizontal*10,
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
              onPressed: () {
//                Navigator.pushNamed(context, MainScreen.id,arguments: {
//                  'index':4
//                });

                Navigator.pushNamed(context, CheckInOut.id);
              },
              title: 'تسجيل وصول / انصراف',
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, VacationScreen.id);
              },
              title: 'طلب أجازة',
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, ChatScreen.id);
              },
              title: 'المراسلات',
            )
          ],
        ),
      ),
    );
  }
}
