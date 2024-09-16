import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme
{
  static final  Color lightPrimary =   Color(0xFFB7935F);
  static final  Color darkPrimary =   Color(0xFF141A2E);
  static final  Color darkSecondary =    Color(0xFFFACC1D);



  static final ThemeData lightTheme = ThemeData(

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontFamily: 'El Messiri',
          fontWeight: FontWeight.w700,),
      iconTheme: IconThemeData(color: Colors.black)
    ),

    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      margin:  const EdgeInsets.fromLTRB(30, 30, 30, 100),
      elevation: 0,
      shadowColor: Colors.black,
      color: Colors.white70,

    ),



    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontFamily: 'El Messiri',
        fontWeight: FontWeight.w600,),

      titleLarge:  TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w400,),

      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w400,),

      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,),
    ),


    colorScheme: ColorScheme.fromSeed(
        seedColor: lightPrimary,
        primary: const Color(0xFFBC9761),
        onPrimary: Colors.black,
        secondary: lightPrimary,
        onSecondary: Colors.black,
        ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white),
  );


  static final ThemeData darkTheme = ThemeData(

    appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'El Messiri',
            fontWeight: FontWeight.w600,
            ),
        iconTheme: IconThemeData(color: Colors.white),
    ),

    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      margin:  const EdgeInsets.fromLTRB(30, 30, 30, 100),
      elevation: 0,
      shadowColor: Colors.white10,

      color:darkPrimary,


    ),

    textTheme:  TextTheme(
      headlineMedium: const TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontFamily: 'El Messiri',
        fontWeight: FontWeight.w600,),

      titleLarge:  TextStyle(
        color: darkSecondary,
        fontSize: 25,
        fontWeight: FontWeight.w400,),

      titleMedium: const TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w400,),



      bodySmall: TextStyle(
        color: darkSecondary,
        fontSize: 20,
        fontWeight: FontWeight.w400,),
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: darkPrimary,
      primary: darkPrimary,
      onPrimary: darkSecondary,
      secondary: darkSecondary,
      onSecondary: Colors.white,
    ),

    bottomNavigationBarTheme:  BottomNavigationBarThemeData(

        selectedItemColor:  darkSecondary,
        unselectedItemColor: Colors.white),
  );
}