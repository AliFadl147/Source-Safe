import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/file_repo_impl.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/group_repo_impl.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/user_repo_impl.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/add_group_cubit/add_group_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/check_box_and_validation_cubit/check_box_and_validation_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/add_file_cubit/add_file_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/file_check_box_cubit/file_check_box_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/get_all_users_cubit/get_all_users_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/get_group_files_cubit/get_group_files_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/get_user_groups_cubit/get_user_groups_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/radio_and_validation_cubit/radio_and_validation_cubit.dart';
import 'package:source_safe_project/core/manager/change_lang_cubit/change_lang_cubit.dart';
import 'package:source_safe_project/core/manager/change_mode_cubit/change_mode_cubit.dart';
import 'package:source_safe_project/core/manager/eye_visibility_cubit/eye_visibility_cubit.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/app_router.dart';
import 'package:source_safe_project/core/utils/dark_theme_manager.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';
import 'package:source_safe_project/core/utils/light_theme_manager.dart';
import 'package:source_safe_project/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  AppPreferences.getAppMode().then((mode) {
    runApp(SourceSafe(
      isDark: mode,
    ));
  });
}

class SourceSafe extends StatefulWidget {
  const SourceSafe({super.key, required this.isDark});

  final bool isDark;

  @override
  State<SourceSafe> createState() => _SourceSafeState();
}

class _SourceSafeState extends State<SourceSafe> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EyeVisibilityCubit(),
        ),
        BlocProvider(create: (context) {
          return ChangeModeCubit()
            ..changeAppMode(
              fromShared: widget.isDark,
            );
        }),
        BlocProvider(
          create: (context) => ChangeLangCubit()..getSavedLanguage(),
        ),
        BlocProvider(
          create: (context) => CheckBoxAndValidationCubit(),
        ),
        BlocProvider(
            create: (context) => GetAllUsersCubit(getIt.get<UserRepoImpl>())
            //..getAllUsers(id: userId),
            ),
        BlocProvider(
          create: (context) => AddGroupCubit(getIt.get<UserRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => AddFileCubit(getIt.get<UserRepoImpl>()),
        ),
        BlocProvider(
            create: (context) => GetUserGroupsCubit(getIt.get<GroupRepoImpl>())
            //..getUserGroups(userId: userId),
            ),
        BlocProvider(
          create: (context) => RadioAndValidationCubit(),
        ),
        BlocProvider(
          create: (context) => GetGroupFilesCubit(getIt.get<FileRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => FileCheckBoxCubit(),
        ),
      ],
      child: BlocBuilder<ChangeModeCubit, ChangeModeState>(
        builder: (context, state) {
          return BlocBuilder<ChangeLangCubit, AppChangeLangState>(
            builder: (context, langState) {
              return MaterialApp.router(
                locale: langState.locale,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
                theme: getApplicationTheme(context),
                darkTheme: getDarkApplicationTheme(context),
                themeMode: ChangeModeCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
              );
            },
          );
        },
      ),
    );
  }
}
