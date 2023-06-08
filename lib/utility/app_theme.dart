import 'package:flutter/material.dart';
import 'package:ashtar/utility/app_colors.dart';
import 'package:ashtar/utility/app_fonts.dart';


final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.mainColor,
  scaffoldBackgroundColor: Colors.white,
fontFamily: AppFonts.mainfont,

//  accentColor: Colors.white,
  // canvasColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    color: Colors.white,
    iconTheme: IconThemeData(
      color: AppColors.mainColor,
    ),
  ),
);
