import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/language_manager.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';
import 'package:intl/intl.dart';
part 'change_lang_state.dart';

class ChangeLangCubit extends Cubit<AppChangeLangState> {
  ChangeLangCubit() : super(AppChangeLangState(locale: Locale('en')));

  static ChangeLangCubit get(context) => BlocProvider.of(context);

  final AppPreferences appPreferences = getIt.get<AppPreferences>();

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode = await appPreferences.getAppLanguage();

    emit(AppChangeLangState(locale: Locale(cachedLanguageCode)));
  }

  void changeLanguage() {
    if (Intl.getCurrentLocale() == LanguageType.arabic.getValue()) {
      appPreferences.changeAppLanguage('en');
      emit(AppChangeLangState(locale: Locale('en')));
    } else {
      appPreferences.changeAppLanguage('ar');
      emit(AppChangeLangState(locale: Locale('ar')));
    }
  }
}
