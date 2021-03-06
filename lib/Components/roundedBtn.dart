import 'package:flutter/material.dart';
import 'package:hrapp/services/size_config.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.title, @required this.onPressed});

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      //elevation: 5.0,
      color: Color.fromRGBO(84, 189, 176, 1),
      borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal*19),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: SizeConfig.safeBlockHorizontal*70,
        height: SizeConfig.safeBlockVertical*8,
        child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.safeBlockHorizontal*5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
  }
}