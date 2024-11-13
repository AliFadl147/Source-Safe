import 'package:flutter/material.dart';

class TextFieldModel {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String label;
  final String? error;
  final GestureTapCallback? suffixPressed;
  final bool? isPassword;
  final String? suffixIcon;
  final String prefixIcon;
  final String? initial;
  final bool? enable;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final Color? fillColor;

  const TextFieldModel({
    required this.label,
    this.error,
    this.controller,
    this.keyboardType,
    this.isPassword = false,
    this.suffixPressed,
    this.enable,
    this.initial,
    this.onChanged,
    this.onFieldSubmitted,
    this.suffixIcon,
    required this.prefixIcon,
    this.obscureText = false,
    this.fillColor,
  });
}
