import 'package:flutter/material.dart';
import 'package:hrapp/localization/localization_constants.dart';

class PersonalScreen extends StatefulWidget {
  static const String id = 'personal_screen';
  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text(getTranslated(context,'profile_page_title')),
            centerTitle: true,
          ),
        );
  }
}
