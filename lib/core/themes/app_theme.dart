import 'package:doctor_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Themes {
  static const Color _lightScaffoldColor = AppColors.white;
  static const Color _lightAppBarColor = AppColors.primaryColor;
  static const Color _foregroundTextColor = AppColors.white;

  static const Color _darkAppBarColor = Color(0xff1F1F1F);

  static get lightTheme => ThemeData(
        scaffoldBackgroundColor: _lightScaffoldColor,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: _lightAppBarColor,
          foregroundColor: _foregroundTextColor,
          centerTitle: true,
        ),
        textTheme: GoogleFonts.latoTextTheme(ThemeData.light().textTheme),
        elevatedButtonTheme: _elevatedButtonTheme(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.white),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xffD9E1F9),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: _borderDecoration(color: const Color(0xffD9E1F9)),
          enabledBorder: _borderDecoration(color: const Color(0xffD9E1F9)),
          focusedBorder: _borderDecoration(color: Colors.black, width: 1),

          errorBorder: _borderDecoration(color: Colors.red),
          focusedErrorBorder: _borderDecoration(color: Colors.red, width: 2),
          hintStyle: const TextStyle(color: Color(0xff4169E1), fontSize: 18),
          labelStyle: const TextStyle(color: Color(0xff4169E1)),
          suffixIconColor: Colors.green, // Icon color
          prefixIconColor: const Color(0xff4169E1),
          errorStyle: const TextStyle(color: Colors.red),
        ),
      );

  static get darkTheme => ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: _darkAppBarColor,
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
        elevatedButtonTheme: _elevatedButtonTheme(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.white),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xff203470),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: _borderDecoration(color: const Color(0xff203470)),
          enabledBorder: _borderDecoration(color: const Color(0xff203470)),
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

  static ElevatedButtonThemeData _elevatedButtonTheme(
      {required Color backgroundColor, required Color foregroundColor}) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(255, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }

  static OutlineInputBorder _borderDecoration(
          {required Color color, double radius = 10, double width = 0}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(color: color, width: width),
      );
}
