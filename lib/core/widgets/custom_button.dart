import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.foregroundColor,
    required this.text,
    this.backgroundColor,
    this.onPressed,
    this.style,
  });

  final Color foregroundColor;
  final Color? backgroundColor;
  final TextStyle? style;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          elevation: 0),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
