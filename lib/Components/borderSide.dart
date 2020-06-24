import 'package:flutter/material.dart';

BorderSide _side = BorderSide(
    color: Color.fromRGBO(196, 196, 196, 1),
    width: 1.0
);

Border KBorderSide = Border(
  bottom: _side,
  left: _side,
  right: _side,
  top: _side
);
