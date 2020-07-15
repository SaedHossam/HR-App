import 'package:flutter/material.dart';
import 'package:hrapp/Components/bottomNavBar.dart';
import 'package:hrapp/Components/drawerList.dart';
import 'package:hrapp/Components/roundedBtn.dart';
import 'package:hrapp/Screens/checkInOut.dart';
import 'package:hrapp/Screens/vacationScreen.dart';
import 'package:hrapp/localization/localization_constants.dart';
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
  BorderRadius arRadius = BorderRadius.only(topLeft:Radius.circular(SizeConfig.safeBlockVertical*2) ,bottomLeft: Radius.circular(SizeConfig.safeBlockVertical*2));
  BorderRadius enRadius = BorderRadius.only(topRight:Radius.circular(SizeConfig.safeBlockVertical*2) ,bottomRight: Radius.circular(SizeConfig.safeBlockVertical*2));
  Locale myLocale ;

  @override
  Widget build(BuildContext context) {
    myLocale = Localizations.localeOf(context);
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: bottomNavBar(2,context),
      appBar: AppBar(
        title: Text(getTranslated(context, 'home_page_title')),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal),
            child: GestureDetector(
              onTap: () {
                //TODO: Show Notifications
              },
              child: Icon(
                Icons.notifications,
                color: Colors.white,
                size: SizeConfig.safeBlockHorizontal*8,
              ),
            ),
          ),
        ],
      ),
      drawer: drawerList(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: SizeConfig.blockSizeHorizontal*80.0,
              height: SizeConfig.blockSizeVertical*25.0,
              //margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal),
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
              child: Row(
                children: <Widget>[
                  Container(
                    width: SizeConfig.blockSizeHorizontal*78.0,
                    height: SizeConfig.blockSizeVertical*25.0,
                    //margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Color.fromRGBO(71, 80, 91, 1),
                              radius: SizeConfig.safeBlockHorizontal*5.5,
                              foregroundColor: Colors.grey,
                              child: Icon(
                                Icons.date_range,
                                color: Colors.white,
                                size: SizeConfig.safeBlockHorizontal*8,
                              ),
                            ),
                            Text(
                              dateToday,
                              style: KCardTextStyle.copyWith(fontSize: SizeConfig.safeBlockHorizontal*4,),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal*10.0,
                            ),
                            Text(
                              getTranslated(context, 'txtView_arrival'),
                              style: KCardTextStyle.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: SizeConfig.safeBlockHorizontal*5.0),
                            ),
                            Text(
                              arrivalTime,
                              style: KCardTextStyle.copyWith(fontSize: SizeConfig.safeBlockHorizontal*5.0),
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal*10.0,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal*10.0,
                            ),
                            Text(
                              getTranslated(context, 'txtView_leave'),
                              style: KCardTextStyle.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: SizeConfig.safeBlockHorizontal*5),
                            ),
                            Text(
                              leaveTime,
                              style: KCardTextStyle.copyWith(fontSize: SizeConfig.safeBlockHorizontal*5),
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal*10.0,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal*2.0,
                    height: SizeConfig.blockSizeVertical*25.0,
                    decoration: BoxDecoration(
                      borderRadius: myLocale.languageCode =='en'? enRadius : arRadius,
                      color: Color.fromRGBO(71, 80, 98,1),
                    ),
                  ),
                ],
              ),
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, CheckInOut.id);
              },
              title: getTranslated(context, 'btn_check_in_out'),
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, VacationScreen.id);
              },
              title: getTranslated(context, 'btn_vacation_request'),
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, ChatScreen.id);
              },
              title: getTranslated(context, 'btn_messaging'),
            )
          ],
        ),
      ),
    );
  }
}
