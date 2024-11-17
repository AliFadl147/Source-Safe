import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:source_safe_project/Features/authentication/presentation/manager/auth_validation_cubit/auth_validation_cubit.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/circular_clipper.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/custom_card.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/login_desktop_layout.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/picture_and_fields_section.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/functions.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final _formKey = GlobalKey<FormState>();
  final AppPreferences _appPreferences = getIt.get<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        final SnackBar snackBar;
        if (state is AuthSuccessState) {
          snackBar = customSnackBar(
              title: 'Will Done!',
              message: 'Logged in successfully',
              contentType: ContentType.success,
              color: AppColors.successGren);
          showSnackBar(context, snackBar);
          _appPreferences.setUserLoggedIn();
          _appPreferences.getToken().then(
            (value) {
              // String id = JwtDecoder.decode(value)['sub'];
              // _appPreferences.getDeviceToken().then((value){
              //   print("Tooooooookeeeeeeen: $value");
              //   AuthCubit.get(context).addDeviceToken(id, value);
              // });
              // if (JwtDecoder.decode(value)['role'] == 'StoreManager') {
              //   GoRouter.of(context).go(AppRouter.kStoreManagerView);
              // } else if (JwtDecoder.decode(value)['role'] == 'User') {
              //   GoRouter.of(context).go(AppRouter.kHomeLayoutView);
              // }else{
              //   GoRouter.of(context).go(AppRouter.kCashierView);
              // }
            },
          );
        } else if (state is AuthFailureState) {
          snackBar = customSnackBar(
            title: 'On Snap',
            message: state.message,
            contentType: ContentType.failure,
          );
          showSnackBar(context, snackBar);
          AuthValidationCubit.get(context).clearLoginObject();
        }
      },
      builder: (context, state) {
        return Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.kPrimaryColor,
          ),
          ClipPath(
            clipper: CircularClipper(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.pastelBlue, // Separator color
            ),
          ),
          CustomCard(
            formKey: _formKey,
            child: LayoutBuilder(builder: (context, constrains) {
              if (constrains.maxWidth < 700) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 56
                  ),
                  child: PictureAndFieldsSection(),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 56,
                    right: 100
                  ),
                  child: LoginDesktopLayout(),
                );
              }
            }),
          )
        ]);
      },
    );
  }
}
