
import 'package:flutter/material.dart';
import 'package:whatsapp/core/utils/app_colors.dart';
import 'package:whatsapp/core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(

    primaryColor: AppColors.darkPrimaryColor,
    primarySwatch: Colors.green,
    hintColor: AppColors.greyColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AppStrings.fontFamily,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColors.darkPrimaryColor,
        elevation: 0,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.0)),
    textTheme: const TextTheme(
      displayMedium: TextStyle(
          height: 1.3,
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold),
    ),
  );
}
