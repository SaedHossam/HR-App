import 'package:flutter/material.dart';
import 'package:hrapp/Components/passwordEditText.dart';
import 'package:hrapp/Components/phoneEditText.dart';
import 'package:hrapp/Components/roundedBtn.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                title: 'رقم الهاتف',
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
                  title: 'كلمة المرور',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'تسجيل الدخول',
                onPressed: ()  {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
