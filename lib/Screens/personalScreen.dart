import 'package:flutter/material.dart';

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
            title: Text('الصفحة الشخصية'),
            centerTitle: true,
          ),
        );
  }
}
