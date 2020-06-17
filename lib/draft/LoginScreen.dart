import 'package:flutter/material.dart';
import 'package:hrapp/Components/roundedBtn.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'constants.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  String phoneNum,pass;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 50),
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
                Padding(
                  padding: EdgeInsets.only(top: 20.0,left: 20,right: 20,bottom: 10),
                  child: Container(
                    child: TextField(
                      onChanged: (value){phoneNum = value;},
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.right,
                      maxLength: 11,
                      maxLengthEnforced: true,
                      decoration: kTextFieldDecoration.copyWith(
                      hintText: 'رقم الهاتف'
                    ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0,left: 20,right: 20,bottom: 20),
                  child: TextField(
                    onChanged: (value){phoneNum = value;},
                    obscureText: true,
                    textAlign: TextAlign.right,
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'كلمة المرور'
                    ),
                  ),
                ),
                RoundedButton(
                  onPressed: (){},
                  title: 'تسجيل الدخول',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// TODO: Implement Login
Widget login(String phoneNumber,String password){

  return null;
}
