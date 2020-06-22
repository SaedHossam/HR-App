import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.title, @required this.onPressed});

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: Color.fromRGBO(84, 189, 176, 1),
        borderRadius: BorderRadius.circular(40.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 300.0,
          height: 53.94,
          child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
    );
  }
}