import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/authentication/data/repos/auth_repo_impl.dart';
import 'package:source_safe_project/Features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:source_safe_project/Features/authentication/presentation/manager/auth_validation_cubit/auth_validation_cubit.dart';
import 'package:source_safe_project/Features/authentication/presentation/views/widgets/register_view_body.dart';
import 'package:source_safe_project/core/utils/app_colors.dart';
import 'package:source_safe_project/core/utils/app_images.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';
import 'package:source_safe_project/core/widgets/custom_app_bar.dart';
import 'package:source_safe_project/core/widgets/custom_icon.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => AuthValidationCubit(),
          ),
        ],
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.white,
              appBar: CustomAppBar(
                backgroundColor: state is AuthLoadingState
                    ? const Color(0xffE2E2E2)
                    : AppColors.white,
                svgPicture: CustomIcon(
                  image: Assets.imagesLeftArrow,
                  color: AppColors.black,
                  padding: 12.0,
                ),
              ),
              body: RegisterViewBody(),
            );
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
