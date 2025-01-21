import 'package:flutter/material.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';
import 'package:source_safe_project/core/utils/functions.dart';
import 'package:source_safe_project/core/utils/material_colors_manager.dart';

ThemeData getDarkApplicationTheme(BuildContext context) {
  return ThemeData(
    // Primary colors
    primaryColor: AppColors.kPrimaryColor,

    // Color Scheme (Dark version)
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: buildMaterialColor(AppColors.kPrimaryColor),
      brightness: Brightness.dark,
    ),

    // Background colors (Dark theme adjustments)
    scaffoldBackgroundColor:
        AppColors.darkShadeOfCyanBlue, // Dark background color
    cardColor: AppColors.darkShadeOfCyanBlue, // Dark card color
    dialogBackgroundColor:
        AppColors.darkShadeOfCyanBlue, // Dialog background color

    // AppBar theme (Dark version)
    // appBarTheme: AppBarTheme(
    //   backgroundColor: AppColors.darkShadeOfCyanBlue,
    //   foregroundColor: Colors.white,
    //   elevation: 2.0,
    //   centerTitle: true,
    //   titleTextStyle: AppStyles.styleBold18(context).copyWith(color: Colors.white),
    // ),

    cardTheme: CardTheme(
      color: AppColors.darkShadeOfCyanBlue,
    ),

    // Button theme (Dark version)
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
        foregroundColor: AppColors.white,
        textStyle: AppStyles.styleBold18(context),
      ),
    ),

    // InputDecoration theme (Dark version)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkFillColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      labelStyle: AppStyles.styleMedium18(context).copyWith(
        color: AppColors.white,
      ),
      errorMaxLines: 3,
      errorStyle: AppStyles.styleRegular16(context),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.guyabano, width: 1.5),
      ),
      enabledBorder: customOutlineInputBorder(color: AppColors.darkFillColor),
      focusedBorder: customOutlineInputBorder(color: AppColors.darkFillColor),
      errorBorder: customOutlineInputBorder(color: AppColors.darkFillColor),
      focusedErrorBorder:
          customOutlineInputBorder(color: AppColors.kPrimaryColor),
      prefixIconColor: AppColors.white,
      suffixIconColor: AppColors.white,
    ),

    // Typography
    textTheme: TextTheme(
      displayLarge: AppStyles.styleSemiBold20(context).copyWith(
        color: AppColors.white,
      ),
      displayMedium: AppStyles.styleBold18(context).copyWith(
        color: AppColors.white,
      ),
      displaySmall: AppStyles.styleBold16(context),
      headlineMedium: AppStyles.styleSemiBold16(context),
      titleMedium: AppStyles.styleMedium18(context),
      titleSmall: AppStyles.styleMedium16(context).copyWith(
        color: AppColors.white,
      ),
      bodyMedium: AppStyles.styleRegular16(context),
      bodySmall: AppStyles.styleRegular12(context),
    ),

    // Icons
    iconTheme: IconThemeData(
      color: AppColors.kPrimaryColor,
    ),

    // Divider theme (Dark version)
    dividerTheme: DividerThemeData(
      color: AppColors.gray74.withOpacity(0.5), // Slightly transparent divider
      thickness: 1,
    ),
  );
}
