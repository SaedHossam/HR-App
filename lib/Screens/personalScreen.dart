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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,

          )
        ],
      ),
    );
  }
}
