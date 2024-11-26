import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/authentication/data/models/text_field_model.dart';
import 'package:source_safe_project/Features/authentication/presentation/manager/auth_validation_cubit/auth_validation_cubit.dart';
import 'package:source_safe_project/core/manager/eye_visibility_cubit/eye_visibility_cubit.dart';
import 'package:source_safe_project/core/utils/app_strings.dart';
import 'package:source_safe_project/core/widgets/custom_text_field_widget.dart';

class EmailAndpasswordfieldssection extends StatefulWidget {
  const EmailAndpasswordfieldssection(
      {super.key,
      required this.onChangedEmail,
      required this.onChangedPassword});

  final ValueChanged<String> onChangedEmail;
  final ValueChanged<String> onChangedPassword;

  @override
  State<EmailAndpasswordfieldssection> createState() =>
      _EmailAndpasswordfieldssectionState();
}

class _EmailAndpasswordfieldssectionState
    extends State<EmailAndpasswordfieldssection> {
  _EmailAndpasswordfieldssectionState();

  late TextEditingController _emailController;

  late TextEditingController _passwordController;

  bool isEmailValid = true;
  bool isPasswordValid = true;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthValidationCubit, AuthValidationState>(
      listener: (BuildContext context, AuthValidationState state) {
        if (state is EmailIsValid) {
          isEmailValid = true;
        } else if (state is EmailIsInValid) {
          isEmailValid = false;
        } else if (state is PasswordIsValid) {
          isPasswordValid = true;
        } else if (state is PasswordIsInValid) {
          isPasswordValid = false;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            CustomTextFieldWidget(
              textFieldModel: TextFieldModel(
                controller: _emailController,
                label: AppStrings.email.tr(),
                onChanged: widget.onChangedEmail,
                error: (isEmailValid) ? null : AppStrings.emailError.tr(),
                prefixIcon: Icons.email_outlined,
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / 33.0),
            BlocBuilder<EyeVisibilityCubit, EyeVisibilityState>(
              builder: (context, state) {
                return CustomTextFieldWidget(
                  textFieldModel: TextFieldModel(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    label: AppStrings.password.tr(),
                    onChanged: widget.onChangedPassword,
                    error: (isPasswordValid) ? null : AppStrings.passwordError.tr(),
                    prefixIcon: Icons.lock_outline,
                    obscureText: EyeVisibilityCubit.get(context).isPassword,
                    suffixPressed: EyeVisibilityCubit.get(context)
                        .changePasswordVisibility,
                    suffixIcon: EyeVisibilityCubit.get(context).suffix,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
