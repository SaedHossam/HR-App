import 'package:flutter/material.dart';
import 'package:hrapp/Components/bottomNavBar.dart';
import 'package:hrapp/localization/localization_constants.dart';
import 'package:hrapp/services/size_config.dart';

class PersonalScreen extends StatefulWidget {
  static const String id = 'personal_screen';
  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: bottomNavBar(3,context),
      body: Center(
        child: Container(
          width: SizeConfig.blockSizeHorizontal*100,
          height: SizeConfig.blockSizeVertical*100,
          //color: Colors.grey,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                height: SizeConfig.blockSizeVertical*40,
                width: SizeConfig.blockSizeHorizontal*100,
                color: Color.fromRGBO(84, 189, 176, 1),
                child: Text(
                    getTranslated(context,'profile_page_title')
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: SizeConfig.blockSizeVertical*60,
                  width: SizeConfig.safeBlockHorizontal*100,
                  color: Colors.white,
                ),
              ),
              Positioned(
                left: SizeConfig.safeBlockHorizontal*25,
                top: SizeConfig.blockSizeVertical*12.5,
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(137, 137, 137
                  ,1),
                  minRadius: SizeConfig.safeBlockHorizontal*25,
                  child: Icon(
                    Icons.person,
                    size: SizeConfig.safeBlockHorizontal*50,
                    color: Color.fromRGBO(227, 227, 227, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
