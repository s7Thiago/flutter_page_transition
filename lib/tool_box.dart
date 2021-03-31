import 'package:flutter/material.dart';

class Styles {
  static const texts = {
    'h1': TextStyle(
      color: Colors.white,
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
    ),
    's1': TextStyle(
      color: Colors.white,
      fontSize: 30.0,
      fontWeight: FontWeight.w100,
    ),
  };

  static final containers = {
    'circle': BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blue.withOpacity(.4),
    )
  };
}
