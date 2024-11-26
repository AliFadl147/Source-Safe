import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:source_safe_project/core/manager/custom_drawer_cubit/custom_drawer_cubit.dart';
import 'package:source_safe_project/core/manager/eye_visibility_cubit/eye_visibility_cubit.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/app_router.dart';
import 'package:source_safe_project/core/utils/dark_theme_manager.dart';
import 'package:source_safe_project/core/utils/language_manager.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';
import 'package:source_safe_project/core/utils/light_theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupServiceLocator();
  AppPreferences.getAppMode().then((mode) {
    runApp(EasyLocalization(
        supportedLocales: [arabicLocale, englishLocale],
        path: assetPathLocalisations,
        child: Phoenix(
            child: SourceSafe(
          isDark: mode,
        ))));
  });
}

class SourceSafe extends StatefulWidget {
  const SourceSafe({super.key, required this.isDark});

  final bool isDark;

  @override
  State<SourceSafe> createState() => _SourceSafeState();
}

class _SourceSafeState extends State<SourceSafe> {
  final AppPreferences _appPreferences = getIt.get<AppPreferences>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appPreferences.getLocal().then((local) {
      if (mounted) {
        context.setLocale(local);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EyeVisibilityCubit(),
        ),
        BlocProvider(create: (context) {
          return CustomDrawerCubit()
            ..changeAppMode(
              fromShared: widget.isDark,
            );
        })
      ],
      child: BlocBuilder<CustomDrawerCubit, CustomDrawerState>(
        builder: (context, state) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            theme: getApplicationTheme(context),
            darkTheme: getDarkApplicationTheme(context),
            themeMode: CustomDrawerCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
          );
        },
      ),
    );
  }
}
