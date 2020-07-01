import 'package:flutter/material.dart';
import 'package:hrapp/localization/localization_constants.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context,'chat_page_title')),
        centerTitle: true,
      ),
    );
  }
}
