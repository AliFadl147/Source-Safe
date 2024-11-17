import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:source_safe_project/core/manager/eye_visibility_cubit/eye_visibility_cubit.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/app_router.dart';
import 'package:source_safe_project/core/utils/language_manager.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';
import 'package:source_safe_project/core/utils/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupServiceLocator();
  runApp(EasyLocalization(
      supportedLocales: [arabicLocale, englishLocale],
      path: assetPathLocalisations,
      child: Phoenix(child: SourceSafe())));
}

class SourceSafe extends StatefulWidget {
  const SourceSafe({super.key});

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
      ],
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: getApplicationTheme(),
      ),
    );
  }
}
