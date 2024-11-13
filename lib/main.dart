import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/core/manager/eye_visibility_cubit/eye_visibility_cubit.dart';
import 'package:source_safe_project/core/utils/app_router.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';
import 'package:source_safe_project/core/utils/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const SourceSafe());
}

class SourceSafe extends StatelessWidget {
  const SourceSafe({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EyeVisibilityCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: getApplicationTheme(),
      ),
    );
  }
}
