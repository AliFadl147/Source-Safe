import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:source_safe_project/Features/authentication/data/repos/auth_repo_impl.dart';
import 'package:source_safe_project/Features/dashboard/data/repos/user_repo_impl.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/dio_factory.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  if (!GetIt.I.isRegistered<DioFactory>()) {
    final sharedPrefs = await SharedPreferences.getInstance();

    getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

    // app prefs instance
    getIt.registerLazySingleton<AppPreferences>(
        () => AppPreferences(sharedPrefs));
    getIt.registerSingleton<DioFactory>(DioFactory());
    Dio dio = await getIt.get<DioFactory>().getDio();
    getIt.registerSingleton<ApiService>(ApiService(dio));
    getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
      getIt.get<ApiService>(),
    ));
  }

  if (!GetIt.I.isRegistered<UserRepoImpl>()) {
    getIt
        .registerSingleton<UserRepoImpl>(UserRepoImpl(getIt.get<ApiService>()));
  }
}
