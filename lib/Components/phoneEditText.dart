import 'package:flutter/material.dart';

class PhoneEditText extends StatelessWidget {
  PhoneEditText({this.title, @required this.onChanged});

  final Function onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20.0,
      shadowColor: Color.fromRGBO(0, 0, 0, 0.15),
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: TextInputType.phone,
        autofocus: false,
        decoration: InputDecoration(
          hintText: title,
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colors.grey, width: 1.0)
          ),
        ),
      ),
    );
  }
}
