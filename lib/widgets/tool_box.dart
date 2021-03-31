import 'package:flutter/material.dart';

class Styles {
  static final texts = {
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
    's2': TextStyle(
      color: Colors.white,
      fontSize: 25.0,
      fontWeight: FontWeight.w100,
    ),
    'd1': TextStyle(
      color: Colors.grey[800],
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    'd2': TextStyle(
      color: Colors.grey[800],
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    ),
  };

  static final containers = {
    'circle': BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blue.withOpacity(.4),
    ),
    'decoration1': BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.black.withOpacity(.3),
          Colors.black.withOpacity(.3),
        ],
      ),
    ),
    'decoration2': BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      gradient: LinearGradient(
        colors: [
          Colors.blue,
          Colors.blue.withOpacity(.7),
        ],
      ),
    ),
    'decoration3': BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      gradient: LinearGradient(
        colors: [
          Colors.pink,
          Colors.red.withOpacity(.7),
        ],
      ),
    ),
    'decoration4': BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
    ),
    'decoration5': BoxDecoration(
      border: Border.all(color: Colors.black),
    ),
  };
}
