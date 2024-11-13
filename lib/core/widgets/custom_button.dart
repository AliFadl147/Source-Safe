import 'package:flutter/material.dart';
import 'package:source_safe_project/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.foregroundColor,
    required this.text,
    required this.backgroundColor,
    this.onPressed,
  });

  final Color foregroundColor;
  final Color backgroundColor;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      child: Text(
        text,
        style: AppStyles.styleBold18(context),
      ),
    );
  }
}
