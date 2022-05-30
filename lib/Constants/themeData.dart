import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData imputTheme(double width) {
    ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: const Color.fromRGBO(253, 254, 255, 1),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: width * 0.025),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(width * 0.04))),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromRGBO(77, 82, 233, 1)),
            borderRadius: BorderRadius.all(Radius.circular(width * 0.04))),
        hintStyle: TextStyle(color: Colors.black54, fontSize: width * 0.05),
      ),
    );

    return themeData;
  }
}
