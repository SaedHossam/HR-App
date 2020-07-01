import 'package:flutter/material.dart';
import 'package:hrapp/Components/passwordEditText.dart';
import 'package:hrapp/Components/phoneEditText.dart';
import 'package:hrapp/Components/roundedBtn.dart';
import 'package:hrapp/localization/localization_constants.dart';
import 'package:hrapp/models/language.dart';
import 'package:hrapp/services/size_config.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../main.dart';
import 'mainScreen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  String phone;
  String password;

  void _logIn(String phone, String password) {
    print("login Called");
  }

  void _changeLanguage(Language language) async{
    Locale _temp = await setLocale(language.languageCode);
    MyApp.setLocate(context,_temp);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal*2),
            child: DropdownButton(
              underline: SizedBox(),
              icon: Icon(Icons.language, color: Colors.white),
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                value: lang,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(lang.name, style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal*5,),),
                    Text(lang.flag),
                  ],
                ),
              ),
              ).toList(),
              onChanged: (Language language) {
                _changeLanguage(language);
              },
            ),
          ),
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('images/login_text.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                    ),
                    Image(
                      image: AssetImage('images/login_logo.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
//
            Container(
              child: PhoneEditText(
                onChanged: (value){
                  phone = value;
                },
                title: getTranslated(context,'phone_number'),
              ),
            ),
              SizedBox(
                height: 28.0,
              ),
              Container(
                child: PasswordEditText(
                  onChanged: (value) {
                    password = value;
                  },
                  title: getTranslated(context,'password'),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: getTranslated(context,'log_in'),
                onPressed: ()  {
                  //TODO Login auth
                  _logIn(phone,password);
                  Navigator.pushNamed(context, MainScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


