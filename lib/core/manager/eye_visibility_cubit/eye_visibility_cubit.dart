import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'eye_visibility_state.dart';

class EyeVisibilityCubit extends Cubit<EyeVisibilityState> {
  EyeVisibilityCubit() : super(EyeVisibilityInitial());

  static EyeVisibilityCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
