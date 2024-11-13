import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:source_safe_project/Features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:source_safe_project/Features/authentication/presentation/manager/auth_validation_cubit/auth_validation_cubit.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/buttons_section.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/email_and_password_fields_section.dart';
import 'package:source_safe_project/core/utils/app_router.dart';
import 'package:source_safe_project/core/widgets/strings_manager.dart';

class LoginFieldsAndButtons extends StatelessWidget {
  const LoginFieldsAndButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 14.0),
        EmailAndpasswordfieldssection(
          onChangedEmail: (value) =>
              AuthValidationCubit.get(context).setLoginEmail(value),
          onChangedPassword: (value) =>
              AuthValidationCubit.get(context).setLoginPassword(value),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 10),
        BlocBuilder<AuthValidationCubit, AuthValidationState>(
          builder: (context, state) {
            return ButtonsSection(
              buttonText: AppStrings.login,
              bottomCenterText: AppStrings.createAnAccount,
              onPressed: (state is AllDataLoginIsValid)
                  ? () {
                      AuthCubit.get(context).login(context);
                    }
                  : null,
              textButtonOnPressed: () {
                GoRouter.of(context).go(AppRouter.kRegisterView);
              },
            );
          },
        ),
      ],
    );
  }
}
