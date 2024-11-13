import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:source_safe_project/Features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:source_safe_project/Features/authentication/presentation/manager/auth_validation_cubit/auth_validation_cubit.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/address_and_phone_number_fields_section.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/buttons_section.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/email_and_password_fields_section.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/first_name_and_last_name_fields_section.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/title_and_subtitle_section.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/functions.dart';
import 'package:source_safe_project/core/widgets/strings_manager.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        final SnackBar snackBar;
        if (state is AuthSuccessState) {
          snackBar = customSnackBar(
              title: 'Will Done!',
              message: 'Account Successfully Created',
              contentType: ContentType.success,
              color: AppColors.successGren);
          showSnackBar(context, snackBar);
          GoRouter.of(context).go('/');
        } else if (state is AuthFailureState) {
          snackBar = customSnackBar(
            title: 'On Snap',
            message: state.message,
            contentType: ContentType.failure,
          );
          showSnackBar(context, snackBar);
          AuthValidationCubit.get(context).clearRegisterObject();
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: AuthCubit.get(context).isLoading,
          color: AppColors.white,
          progressIndicator: CircularProgressIndicator(
            color: AppColors.kPrimaryColor,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                    right: 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleAndSubTitleSection(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              33),
                      const FirstnameAndLastnameFieldsSection(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              33),
                      EmailAndpasswordfieldssection(
                        onChangedEmail: (value) =>
                            AuthValidationCubit.get(context)
                                .setRegisterEmail(value),
                        onChangedPassword: (value) =>
                            AuthValidationCubit.get(context)
                                .setRegisterPassword(value),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              33),
                      const AddressAndPhonenumberFieldsSection(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height /
                              12),
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
