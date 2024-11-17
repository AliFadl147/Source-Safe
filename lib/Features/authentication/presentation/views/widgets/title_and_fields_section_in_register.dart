import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:source_safe_project/Features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:source_safe_project/Features/authentication/presentation/manager/auth_validation_cubit/auth_validation_cubit.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/address_and_phone_number_fields_section.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/buttons_section.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/email_and_password_fields_section.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/first_name_and_last_name_fields_section.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/title_section.dart';
import 'package:source_safe_project/core/widgets/strings_manager.dart';

class TitleAndFieldsSectionInRegister extends StatelessWidget {
  const TitleAndFieldsSectionInRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleSection(
            text: AppStrings.createYourAccountToday,
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 33),
          const FirstnameAndLastnameFieldsSection(),
          SizedBox(height: MediaQuery.of(context).size.height / 33),
          EmailAndpasswordfieldssection(
            onChangedEmail: (value) =>
                AuthValidationCubit.get(context).setRegisterEmail(value),
            onChangedPassword: (value) =>
                AuthValidationCubit.get(context).setRegisterPassword(value),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 33),
          const AddressAndPhonenumberFieldsSection(),
          SizedBox(height: MediaQuery.of(context).size.height / 12),
          BlocBuilder<AuthValidationCubit, AuthValidationState>(
            builder: (context, state) {
              return ButtonsSection(
                buttonText: AppStrings.register,
                bottomCenterText: AppStrings.alreadyHaveAnAccount,
                onPressed: (state is AllDataRegisterIsValid)
                    ? () {
                        AuthCubit.get(context).register(context);
                      }
                    : null,
                textButtonOnPressed: () {
                  GoRouter.of(context).go('/');
                },
              );
            },
          ),
        ],
      ),
    );
  }
}