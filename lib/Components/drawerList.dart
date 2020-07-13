import 'package:flutter/material.dart';
import 'package:hrapp/Screens/HomeScreen.dart';
import 'package:hrapp/Screens/addLocationScreen.dart';
import 'package:hrapp/Screens/chatScreen.dart';
import 'package:hrapp/Screens/checkInOut.dart';
import 'package:hrapp/Screens/personalScreen.dart';
import 'package:hrapp/localization/localization_constants.dart';
import 'package:hrapp/services/size_config.dart';

Container drawerList(BuildContext context) {
  SizeConfig().init(context);
  TextStyle _textStyle = TextStyle(
    color: Colors.white,
    fontSize: SizeConfig.safeBlockHorizontal*5,
  );
  return Container(
    width: MediaQuery.of(context).size.width/1.5,
    color: Theme.of(context).primaryColor,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Container(
            height:SizeConfig.safeBlockVertical*70.0 ,
            child: CircleAvatar(
              //TODO: add profile picture
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.message,
            color: Colors.white,
            size: SizeConfig.safeBlockVertical*5,
          ),
          title: Text(
            getTranslated(context,'chat_page_title'),
            style: _textStyle,
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, ChatScreen.id);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.person,
            color: Colors.white,
            size: SizeConfig.safeBlockVertical*5,
          ),
          title: Text(
            getTranslated(context,'profile_page_title'),
            style: _textStyle,
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, PersonalScreen.id);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.white,
            size: SizeConfig.safeBlockVertical*5,
          ),
          title: Text(
            getTranslated(context, 'home_page_title'),
            style: _textStyle,
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, HomeScreen.id);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.add_location,
            color: Colors.white,
            size: SizeConfig.safeBlockVertical*5,
          ),
          title: Text(
            getTranslated(context,'add_location_page_title'),
            style: _textStyle,
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AddLocation.id);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.fingerprint,
            color: Colors.white,
            size: SizeConfig.safeBlockVertical*5,
          ),
          title: Text(
            getTranslated(context,'check_in_out_page_title'),
            style: _textStyle,
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, CheckInOut.id);
          },
        ),
      ],
    ),
  );
}