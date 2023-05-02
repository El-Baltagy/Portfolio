import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import '../../changes/colors.dart';

final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    primaryColor: primaryColor,
    backgroundColor: lightBackgroundColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color:Colors.black ),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent,
          systemNavigationBarColor:Colors.transparent ),
    ),
    textTheme: TextTheme(button: TextStyle(color: lightTextColor)));

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Poppins',
  primaryColor: primaryColor,
  backgroundColor: darkBackgroundColor,
  scaffoldBackgroundColor: const Color(0xFF00040F),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color:Colors.white ),
      backgroundColor: Colors.transparent,systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,systemNavigationBarColor:Colors.transparent)
  ),
  textTheme: TextTheme(
    button: TextStyle(color: darkTextColor),
  ),

);


extension ThemeExtras on ThemeData {
  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  Color get navBarColor => brightness == Brightness.light
      ? const Color(0xffF0F0F0)
      : const Color(0xFF00040F);
  Color get navBar => brightness == Brightness.light
      ? Colors.transparent
      : Colors.transparent;
  Color get shimmerColor => brightness == Brightness.dark
      ?  Colors.white24:Colors.white24;

  Color get shadowColor => brightness == Brightness.dark
      ?  Colors.white:Colors.black87;

  Color get text2 => brightness == Brightness.light
      ? const Color(0xffF0F0F0)
      : const Color(0xFF00040F);


  //
  Color get textColor => brightness == Brightness.dark
      ?  Colors.white
      :  Colors.black;
  //
  Color get secondaryColor => const Color(0xFFFE53BB);
  //
  Gradient get card =>
      brightness == Brightness.light ? grayWhite : grayBack;

  //
  Gradient get contactCard =>
      brightness == Brightness.light ? grayWhite : contactGradi;
}
