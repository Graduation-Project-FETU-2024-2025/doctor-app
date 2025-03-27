import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Themes {
  static const Color _lightScaffoldColor = AppColors.white;
  static const Color _lightAppBarColor = AppColors.primaryColor;
  static const Color _lightElevatedButtonColor = AppColors.primaryColor;
  static const Color _foregroundTextColor = AppColors.white;

  static const Color _darkAppBarColor = Color(0xff1F1F1F);
  static const Color _darkPrimaryColor = Color(0xff292929);
  static const Color _darkElevatedButtonColor = Color(0xff2D88D6);

  static get lightTheme => ThemeData(
        scaffoldBackgroundColor: _lightScaffoldColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: _lightAppBarColor,
          foregroundColor: _foregroundTextColor,
          centerTitle: true,
        ),
        textTheme: GoogleFonts.latoTextTheme(ThemeData.light().textTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(255, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: _lightElevatedButtonColor,
            foregroundColor: _foregroundTextColor,
            textStyle: const TextStyle(
                color: _foregroundTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xffD9E1F9),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: _borderDecoration(color: Color(0xffD9E1F9)),
          enabledBorder: _borderDecoration(color: Color(0xffD9E1F9)),
          focusedBorder: _borderDecoration(color: Colors.black, width: 1),

          errorBorder: _borderDecoration(color: Colors.red),
          focusedErrorBorder: _borderDecoration(color: Colors.red, width: 2),
          hintStyle: const TextStyle(color: Color(0xff4169E1), fontSize: 18),
          labelStyle: const TextStyle(color: Color(0xff4169E1)),
          suffixIconColor: Colors.green, // Icon color
          prefixIconColor: Color(0xff4169E1),
          errorStyle: const TextStyle(color: Colors.red),
        ),
      );

  static get darkTheme => ThemeData(
        scaffoldBackgroundColor: _darkPrimaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: _darkAppBarColor,
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: _darkElevatedButtonColor,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xff203470),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: _borderDecoration(color: Color(0xff203470)),
          enabledBorder: _borderDecoration(color: Color(0xff203470)),
          focusedBorder: _borderDecoration(color: Colors.white, width: 1),
          errorBorder: _borderDecoration(color: Colors.red),
          focusedErrorBorder: _borderDecoration(color: Colors.red),
          hintStyle: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          labelStyle: const TextStyle(color: Colors.white),
          suffixIconColor: Colors.green,
          prefixIconColor: Colors.white,
          errorStyle: const TextStyle(color: Colors.red),
        ),
      );

  static OutlineInputBorder _borderDecoration(
          {required Color color, double radius = 10, double width = 0}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(color: color, width: width),
      );
}
