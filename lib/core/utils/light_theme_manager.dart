import 'package:flutter/material.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';
import 'package:source_safe_project/core/utils/functions.dart';
import 'package:source_safe_project/core/utils/material_colors_manager.dart';

ThemeData getApplicationTheme(BuildContext context) {
  return ThemeData(
    // Primary colors
    primaryColor: AppColors.kPrimaryColor,

    // Color Scheme
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: buildMaterialColor(AppColors.kPrimaryColor)),

    // Background colors
    scaffoldBackgroundColor: AppColors.white,
    cardColor: AppColors.white,
    dialogBackgroundColor: AppColors.white,

    // AppBar theme
    /*appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kPrimaryColor,
      foregroundColor: Colors.white,
      elevation: 2.0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),*/

    cardTheme: CardTheme(
      color: AppColors.white,
    ),

    // Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        textStyle: AppStyles.styleBold18(context),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.kPrimaryColor,
        textStyle: AppStyles.styleBold18(context),
      ),
    ),

    // InputDecoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.guyabano,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      labelStyle: AppStyles.styleMedium18(context),
      errorMaxLines: 3,
      errorStyle: AppStyles.styleRegular16(context),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.guyabano, width: 1.5),
      ),
      enabledBorder: customOutlineInputBorder(),
      focusedBorder: customOutlineInputBorder(),
      errorBorder: customOutlineInputBorder(),
      focusedErrorBorder:
          customOutlineInputBorder(color: AppColors.kPrimaryColor),
      prefixIconColor: AppColors.sonicSilver,
      suffixIconColor: AppColors.sonicSilver,
    ),

    // Typography
    textTheme: TextTheme(
      displayLarge: AppStyles.styleSemiBold20(context),
      displayMedium: AppStyles.styleBold18(context),
      displaySmall: AppStyles.styleBold16(context),
      headlineMedium: AppStyles.styleSemiBold16(context),
      titleMedium: AppStyles.styleMedium18(context),
      titleSmall: AppStyles.styleMedium16(context),
      bodyMedium: AppStyles.styleRegular16(context),
      bodySmall: AppStyles.styleRegular12(context),
    ),

    // Icons
    iconTheme: IconThemeData(
      color: AppColors.kPrimaryColor,
    ),

    // Divider
    dividerTheme: DividerThemeData(
      color: AppColors.gray74,
      thickness: 1,
    ),
  );
}
