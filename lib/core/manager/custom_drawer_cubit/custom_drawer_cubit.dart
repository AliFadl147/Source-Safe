import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';
part 'custom_drawer_state.dart';

class CustomDrawerCubit extends Cubit<CustomDrawerState> {
  CustomDrawerCubit() : super(CustomDrawerStateInitial());

  static CustomDrawerCubit get(context) => BlocProvider.of(context);

  final AppPreferences appPreferences = getIt.get<AppPreferences>();

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      appPreferences.changeAppMode().then(
        (value) {
          emit(AppChangeModeState());
        },
      );
    }
  }
  void changeLanguage(BuildContext context) {
    appPreferences.changeAppLanguage();
    Phoenix.rebirth(context);
  }
}
