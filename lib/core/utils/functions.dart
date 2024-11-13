import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:source_safe_project/core/utils/size_config.dart';

final dPassValid = RegExp(r'\d');
final sPassValid = RegExp(r'\W');
final uPassValid = RegExp(r'[A-Z]');
final lPassValid = RegExp(r'[a-z]');

bool isDigitPasswordValid(String pass) {
  if (dPassValid.hasMatch(pass)) {
    return true;
  } else {
    return false;
  }
}

bool isSymbolPasswordValid(String pass) {
  if (sPassValid.hasMatch(pass)) {
    return true;
  } else {
    return false;
  }
}

bool isUpperCasePasswordValid(String pass) {
  if (uPassValid.hasMatch(pass)) {
    return true;
  } else {
    return false;
  }
}

bool isLowerCasePasswordValid(String pass) {
  if (lPassValid.hasMatch(pass)) {
    return true;
  } else {
    return false;
  }
}

double getMaxWidth(BuildContext context) {
  double maxWidth = 0;
  SizeConfig.init(context);
  if (SizeConfig.width >= 600 && SizeConfig.width <= 1000) {
    maxWidth = 400;
  } else if (SizeConfig.width > 1000) {
    maxWidth = 600;
  } else {
    maxWidth = double.infinity;
  }
  return maxWidth;
}

void showSnackBar(BuildContext context, SnackBar snackBar) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

SnackBar customSnackBar({
  required String title,
  required String message,
  required ContentType contentType,
  Color? color,
}) =>
    SnackBar(
      padding: const EdgeInsetsDirectional.only(top: 50),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        color: color,
        contentType: contentType,
      ),
    );

