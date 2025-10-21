import 'package:flutter/material.dart';

// 앱에서 사용할 색 정의
final Color blue = const Color.fromARGB(255, 56, 151, 253);
final Color lightGrey = Color.fromARGB(255, 218, 219, 221);
final Color darkGrey = const Color.fromARGB(255, 180, 180, 182);
final Color lightBlack = const Color.fromARGB(255, 41, 41, 41);

// 라이트 모드 테마 지정
final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: blue,
  ),
  cardColor: lightGrey,

  scaffoldBackgroundColor: darkGrey,

  appBarTheme: AppBarTheme(
    backgroundColor: lightGrey,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: blue,
    iconSize: 24,
    shape: CircleBorder(),
  ),

  snackBarTheme: SnackBarThemeData(
    insetPadding: EdgeInsets.only(left: 20, right: 20, bottom: 100),
    backgroundColor: blue,
    contentTextStyle: TextStyle(fontSize: 15),
    behavior: SnackBarBehavior.floating,
  ),
);

// 다크 모드 테마 지정
final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: blue,
  ),
  cardColor: lightBlack,

  scaffoldBackgroundColor: Colors.black,

  appBarTheme: AppBarTheme(
    backgroundColor: lightBlack,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: blue,
    iconSize: 24,
    shape: CircleBorder(),
  ),

  snackBarTheme: SnackBarThemeData(
    insetPadding: EdgeInsets.only(left: 20, right: 20, bottom: 100),
    backgroundColor: blue,
    contentTextStyle: TextStyle(fontSize: 15),
    behavior: SnackBarBehavior.floating,
  ),
);
