import 'package:flutter/material.dart';
import 'package:hrapp/Components/bottomNavBar.dart';
import 'package:hrapp/localization/localization_constants.dart';
import 'package:hrapp/services/size_config.dart';

class AddLocation extends StatefulWidget {
  static const String id = 'addLocation_screen';
  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: bottomNavBar(1,context),
      appBar: AppBar(
        title: Text(getTranslated(context,'add_location_page_title')),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
