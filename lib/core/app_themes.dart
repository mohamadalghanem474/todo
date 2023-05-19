import 'package:flutter/material.dart';

final appDarkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: ThemeData.light(useMaterial3: true).primaryColor,
    ),
  ),
  // inputDecorationTheme: InputDecorationTheme(
  //   floatingLabelStyle: TextStyle(color: primaryColor),
  //   iconColor: secondaryColor,
  //   focusedBorder: OutlineInputBorder(
  //     borderSide: BorderSide(color: secondaryColor),
  //     borderRadius: BorderRadius.circular(8),
  //   ),
  //   border: OutlineInputBorder(
  //     borderSide: BorderSide(color: primaryColor),
  //     borderRadius: BorderRadius.circular(8),
  //   ),
  // ),
);
