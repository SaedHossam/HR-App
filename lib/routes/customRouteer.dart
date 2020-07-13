import 'package:flutter/material.dart';
import 'package:hrapp/routes/routesNames.dart';

import 'package:hrapp/Screens/HomeScreen.dart';
import 'package:hrapp/Screens/HomeScreen.dart';
import 'package:hrapp/Screens/LoginScreen.dart';
import 'package:hrapp/Screens/checkInOut.dart';
import 'package:hrapp/Screens/chatScreen.dart';
import 'file:///G:/HiveTech/hr_app/lib/draft/mainScreen.dart';
import 'package:hrapp/Screens/personalScreen.dart';
import 'package:hrapp/Screens/vacationScreen.dart';
import 'package:hrapp/Screens/vacationSent.dart';

class CustomRoute{
  static Route<dynamic> allRoutes(RouteSettings settings){
    switch(settings.name){
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case checkInOut:
        return MaterialPageRoute(builder: (_) => CheckInOut());
      case chatScreen:
        return MaterialPageRoute(builder: (_) => ChatScreen());
      case personalScreen:
        return MaterialPageRoute(builder: (_) => PersonalScreen());
      case vacationScreen:
        return MaterialPageRoute(builder: (_) => VacationScreen());
      case vacationSentScreen:
        return MaterialPageRoute(builder: (_) => VacationSentScreen());
      case mainScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());
    }
    return MaterialPageRoute(builder: (_) => MainScreen());;
  }
}