import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:source_safe_project/Features/authentication/data/repos/auth_repo.dart';
import 'package:source_safe_project/Features/authentication/data/requests/auth_requests.dart';
import 'package:source_safe_project/Features/authentication/presentation/manager/auth_validation_cubit/auth_validation_cubit.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  final AuthRepo authRepo;

  bool isLoading = false;

  final AppPreferences _appPreferences = getIt.get<AppPreferences>();

  Future<void> login(BuildContext context) async {
    isLoading = true;
    emit(AuthLoadingState());
    var result = await authRepo.login(LoginRequest(
      AuthValidationCubit.get(context).loginObject.email,
      AuthValidationCubit.get(context).loginObject.password,
    ));
    result.fold((failure) {
      isLoading = false;
      emit(AuthFailureState(failure.errMessage));
    }, (data) {
      isLoading = false;
      _appPreferences.setToken(data.token!);
      _appPreferences.setRefreshToken(data.refreshToken!);
      emit(AuthSuccessState());
    });
  }

  Future<void> register(BuildContext context) async {
    isLoading = true;
    emit(AuthLoadingState());
    var result = await authRepo.register(RegisterRequest(
        AuthValidationCubit.get(context).registerObject.firstName,
        AuthValidationCubit.get(context).registerObject.lastName,
        AuthValidationCubit.get(context).registerObject.email,
        AuthValidationCubit.get(context).registerObject.password));
    result.fold((failure) {
      isLoading = false;
      emit(AuthFailureState(failure.errMessage));
    }, (data) {
      isLoading = false;
      emit(AuthSuccessState());
    });
  }

  Future<void> addDeviceToken(String id, String deviceToken) async {
    var result = await authRepo.addDeviceToken(id, deviceToken);
    result.fold((failure) {}, (data) {});
  }
}
