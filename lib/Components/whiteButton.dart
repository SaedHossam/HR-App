import 'package:flutter/material.dart';
import 'package:hrapp/services/size_config.dart';

class WhiteButton extends StatelessWidget {
  WhiteButton({this.title, @required this.onPressed});

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      //elevation: 5.0,
      color: Colors.white,
      borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal*19),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: SizeConfig.safeBlockHorizontal*70,
        height: SizeConfig.safeBlockVertical*6,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: SizeConfig.safeBlockHorizontal*4.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}