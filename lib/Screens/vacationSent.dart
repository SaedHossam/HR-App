import 'package:flutter/material.dart';
import 'package:hrapp/Components/bottomNavBar.dart';
import 'package:hrapp/Components/drawerList.dart';
import 'package:hrapp/Components/roundedBtn.dart';
import 'package:hrapp/Components/whiteButton.dart';
import 'package:hrapp/localization/localization_constants.dart';
import 'package:hrapp/services/size_config.dart';

class VacationSentScreen extends StatefulWidget {
  static const String id = 'vacationSent_screen';
  @override
  _VacationSentScreenState createState() => _VacationSentScreenState();
}

class _VacationSentScreenState extends State<VacationSentScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: drawerList(context),
      bottomNavigationBar: bottomNavBar(2,context),
      appBar: AppBar(
        title: Text(getTranslated(context,"vacation_request_sent_page_title")),
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
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal*2,
            vertical: SizeConfig.safeBlockVertical*1
        ),
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal*5,
           vertical: SizeConfig.safeBlockVertical*10
        ),
        height: SizeConfig.safeBlockVertical*60,
        decoration: BoxDecoration(
          color: Colors.white,
          //borderRadius: BorderRadius.circular(SizeConfig.safeBlockVertical*2),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: SizeConfig.safeBlockVertical*1, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  -0.1, // horizontally
                  2.5, // Vertically
                ))
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                  getTranslated(context, "txtView_request_sent"),
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontSize: SizeConfig.safeBlockHorizontal*5
                  ),
              ),
              Text(
                  getTranslated(context, "txtView_response"),
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: SizeConfig.safeBlockHorizontal*4
                ),),
              RoundedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                title: getTranslated(context, "btn_back"),
              ),
              WhiteButton(
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                title: getTranslated(context, "btn_home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
