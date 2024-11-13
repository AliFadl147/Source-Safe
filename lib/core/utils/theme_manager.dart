import 'package:flutter/material.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/material_colors_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: AppColors.kPrimaryColor,
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: buildMaterialColor(AppColors.kPrimaryColor)),
  );
}
