import 'package:flutter/material.dart';
import 'package:hrapp/localization/localization_constants.dart';

class AddLocation extends StatefulWidget {
  static const String id = 'addLocation_screen';
  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context,'add_location_page_title')),
        centerTitle: true,
      ),
    );
  }
}
