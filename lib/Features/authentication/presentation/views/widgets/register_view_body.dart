import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:source_safe_project/Features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:source_safe_project/Features/authentication/presentation/manager/auth_validation_cubit/auth_validation_cubit.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/circular_clipper.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/custom_card.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/register_desktop_layout.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/title_and_fields_section_in_register.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/functions.dart';

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
              title: 'Well Done!',
              message: 'Account Successfully Created',
              contentType: ContentType.success,
              color: AppColors.successGren);
          showSnackBar(context, snackBar);
          GoRouter.of(context).go('/');
        } else if (state is AuthFailureState) {
          snackBar = customSnackBar(
            title: 'Oh Snap!',
            message: state.message,
            contentType: ContentType.failure,
          );
          showSnackBar(context, snackBar);
          AuthValidationCubit.get(context).clearRegisterObject();
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.kPrimaryColor
            ),
            ClipPath(
              clipper: CircularClipper(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: AppColors.pastelBlue // Separator color
              ),
            ),
            CustomCard(
              formKey: _formKey,
              child: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth < 700) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 56
                    ),
                    child: TitleAndFieldsSectionInRegister(),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 100,
                      right: 100
                    ),
                    child: RegisterDesktopLayout(),
                  );
                }
              }),
            )
          ],
        );
      },
    );
  }
}
