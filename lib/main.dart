import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/user_repo_impl.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/add_group_cubit/add_group_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/create_group_cubit/create_group_cubit.dart';
import 'package:source_safe_project/Features/dashboard/presentation/manager/get_all_users_cubit/get_all_users_cubit.dart';
import 'package:source_safe_project/core/manager/change_lang_cubit/change_lang_cubit.dart';
import 'package:source_safe_project/core/manager/change_mode_cubit/change_mode_cubit.dart';
import 'package:source_safe_project/core/manager/eye_visibility_cubit/eye_visibility_cubit.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/app_router.dart';
import 'package:source_safe_project/core/utils/dark_theme_manager.dart';
import 'package:source_safe_project/core/utils/functions.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';
import 'package:source_safe_project/core/utils/light_theme_manager.dart';
import 'package:source_safe_project/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  AppPreferences.getToken().then((value) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(value);
    userId = decodedToken['sub'];
  });
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
          create: (context) => CreateGroupCubit(),
        ),
        BlocProvider(
          create: (context) =>
              GetAllUsersCubit(getIt.get<UserRepoImpl>())..getAllUsers(id: 2),
        ),
        BlocProvider(
          create: (context) => AddGroupCubit(getIt.get<UserRepoImpl>()),
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
