import 'package:flutter/material.dart';
import 'package:source_safe_project/Features/authentication/data/models/text_field_model.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextFieldModel textFieldModel;

  const CustomTextFieldWidget({
    super.key,
    required this.textFieldModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: textFieldModel.controller,
        keyboardType: textFieldModel.keyboardType,
        style: Theme.of(context).textTheme.titleMedium, // Use theme text style
        cursorColor: AppColors.kPrimaryColor, // Keep custom cursor color
        obscureText: textFieldModel.obscureText,
        decoration: customInputDecoration(context), // Use modified decoration
        initialValue: textFieldModel.initial,
        onChanged: textFieldModel.onChanged,
        onFieldSubmitted: textFieldModel.onFieldSubmitted,
        enabled: textFieldModel.enable,
      ),
    );
  }

  InputDecoration customInputDecoration(BuildContext context) {
    return InputDecoration(
      labelText: textFieldModel.label,
      errorText: textFieldModel.error,
      prefixIcon: Icon(textFieldModel.prefixIcon),
      suffixIcon: textFieldModel.suffixIcon != null
          ? GestureDetector(
              onTap: textFieldModel.suffixPressed,
              child: Icon(textFieldModel.suffixIcon),
            )
          : null,
    );
  }
}
