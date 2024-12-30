import 'package:flutter/material.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/font_manager.dart';
import 'package:source_safe_project/core/utils/size_config.dart';

abstract class AppStyles {
  /*          */
  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFAAAAAA),
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold24(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF4EB7F2),
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

    static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF064061),
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }
  /*          */
  static TextStyle styleRegular12(BuildContext context) {
    return TextStyle(
      color: AppColors.mediumGray,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular16(context) {
    return TextStyle(
      color: AppColors.red,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      color: AppColors.darkShadeOfCyanBlue,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium18(BuildContext context) {
    return TextStyle(
      color: AppColors.gray74,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      color: AppColors.darkShadeOfCyanBlue,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBold18(BuildContext context) {
    return TextStyle(
      color: AppColors.deepCharcoal,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      color: AppColors.kPrimaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: FontConstants.fontFamily,
      fontWeight: FontWeight.w700,
    );
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double height = MediaQuery.sizeOf(context).height;
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = 0.0;
  double upperLimit = 0.0;

  if (height >= 1600) {
    responsiveFontSize *= 1.3;
    lowerLimit = fontSize * 1.8;
    upperLimit = fontSize * 2.2;
  } else {
    lowerLimit = fontSize * .8;
    upperLimit = fontSize * 1.2;
  }

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;

  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 800;
  } else {
    return width / 1100;
  }
}

// double getResponsiveFontSize(context, {required double fontSize}) {
//   double scaleFactor = getScaleFactor(context);
//   double responsiveFontSize = fontSize * scaleFactor;
//   double lowerLimit = fontSize * .8;
//   double upperLimit = fontSize * 1.2;
//   if (scaleFactor >= SizeConfig.tablet / 550) {
//     lowerLimit = fontSize * 1.2;
//     upperLimit = fontSize * 1.6;
//   }
//   return responsiveFontSize.clamp(lowerLimit, upperLimit);
// }

// double getScaleFactor(context) {
//   double width = MediaQuery.sizeOf(context).width;
//   return width / 550;
// }
