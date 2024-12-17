import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';
part 'change_mode_state.dart';

class ChangeModeCubit extends Cubit<ChangeModeState> {
  ChangeModeCubit() : super(ChangeModeStateInitial());

  static ChangeModeCubit get(context) => BlocProvider.of(context);

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
}
