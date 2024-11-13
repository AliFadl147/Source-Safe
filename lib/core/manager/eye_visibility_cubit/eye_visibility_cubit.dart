import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/core/utils/app_images.dart';
part 'eye_visibility_state.dart';

class EyeVisibilityCubit extends Cubit<EyeVisibilityState> {
  EyeVisibilityCubit() : super(EyeVisibilityInitial());

  static EyeVisibilityCubit get(context) => BlocProvider.of(context);

  String suffix = Assets.imagesEyeIconVisibilityOn;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword
        ? Assets.imagesEyeIconVisibilityOn
        : Assets.imagesEyeIconVisibilityOff;
    emit(ChangePasswordVisibilityState());
  }
}
