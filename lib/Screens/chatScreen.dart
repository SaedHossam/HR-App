import 'package:flutter/material.dart';
import 'package:hrapp/Components/bottomNavBar.dart';
import 'package:hrapp/Components/drawerList.dart';
import 'package:hrapp/localization/localization_constants.dart';
import 'package:hrapp/services/size_config.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: drawerList(context),
      bottomNavigationBar: bottomNavBar(4,context),
      appBar: AppBar(
        title: Text(getTranslated(context, 'chat_page_title')),
        centerTitle: true,
      ),
    );
  }
}
