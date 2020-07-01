import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//import 'package:hrapp/routes/customRouteer.dart';
//import 'package:hrapp/routes/routesNames.dart';

import 'Screens/HomeScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/addLocationScreen.dart';
import 'Screens/checkInOut.dart';
import 'Screens/chatScreen.dart';
import 'Screens/mainScreen.dart';
import 'Screens/personalScreen.dart';
import 'Screens/vacationScreen.dart';
import 'Screens/vacationSent.dart';
//import 'draft/draftScreen.dart';
import 'localization/demo_localization.dart';
import 'localization/localization_constants.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static void setLocate(BuildContext context, Locale local) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocal(local);
  }
}

class _MyAppState extends State<MyApp> {

  void setLocal(Locale locale){
    setState(() {
      _locale = locale;
    });
  }
  Locale _locale;

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if(_locale == null){
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    else {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        locale: _locale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color.fromRGBO(84, 189, 176, 1),
          accentColor: Colors.white,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            elevation: 4.0,
            textTheme: TextTheme(
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 27.9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        home: LoginScreen(),
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          CheckInOut.id: (context) => CheckInOut(),
          ChatScreen.id: (context) => ChatScreen(),
          PersonalScreen.id: (context) => PersonalScreen(),
          VacationScreen.id: (context) => VacationScreen(),
          VacationSentScreen.id: (context) => VacationSentScreen(),
          MainScreen.id: (context) => MainScreen(),
          AddLocation.id: (context) => AddLocation()
        },
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('ar', 'EG'),
        ],
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          DemoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocale, supportedLocals){
          for(var locale in supportedLocals){
            if(locale.languageCode == deviceLocale.languageCode &&
                locale.countryCode == deviceLocale.countryCode){
              return deviceLocale;
            }
          }
          return supportedLocals.first;
        },
      );
    }
  }
}
