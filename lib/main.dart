import 'package:flutter/material.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/checkInOut.dart';
import 'Screens/chatScreen.dart';
import 'Screens/personalScreen.dart';
import 'Screens/vacationScreen.dart';
import 'Screens/vacationSent.dart';
import 'draft/draftScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromRGBO(84, 189, 176, 1),
        accentColor: Colors.white,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 4.0,
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.white,
              fontSize: 27.9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: CheckInOut(),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        CheckInOut.id: (context) => CheckInOut(),
        ChatScreen.id: (context) => ChatScreen(),
        PersonalScreen.id: (context) => PersonalScreen(),
        VacationScreen.id: (context) => VacationScreen(),
        VacationSentScreen.id: (context) => VacationSentScreen(),
      },
    );
  }
}
