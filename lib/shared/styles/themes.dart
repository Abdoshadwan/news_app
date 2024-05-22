import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darktheme = ThemeData(
  bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
  scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch: Colors.lime,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 158, 119, 0)),
  appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.white),
      backgroundColor: HexColor('333739'),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 20,
    backgroundColor: HexColor('333739'),
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.white,
    selectedItemColor: Color.fromARGB(255, 158, 119, 0),
    selectedLabelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
    selectedIconTheme: IconThemeData(color: Color.fromARGB(255, 158, 119, 0)),
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      bodyText2: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
);

ThemeData lighttheme = ThemeData(
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      bodyText2: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
  primarySwatch: Colors.lime,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 158, 119, 0)),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      backgroundColor: Colors.white,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 20,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Color.fromARGB(255, 158, 119, 0),
    selectedLabelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
    selectedIconTheme: IconThemeData(color: Colors.black, size: 35),
  ),
);
