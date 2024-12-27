import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:source_safe_project/Features/authentication/data/models/login_model.dart';
import 'package:source_safe_project/core/utils/api_service.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/functions.dart';

class TokenInterceptor extends Interceptor {
  final AppPreferences appPreferences;
  final Dio dio;
  final ApiService apiService;

  TokenInterceptor(this.appPreferences, this.dio, this.apiService);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await AppPreferences.getToken().then(
      (value) {
        if (value != null) {
          options.headers['Authorization'] = 'Bearer $value';
        }
        handler.next(options);
      },
    );
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.connectionError) {
      try {
        await appPreferences.getRefreshToken().then((refToken) async {
          if (refToken != null) {
            final isRefreshed = await _refreshToken(refToken);

            if (isRefreshed) {
              final retryOptions = err.requestOptions;

              AppPreferences.getToken().then((value) {
                if (value != null) {
                  retryOptions.headers['Authorization'] = 'Bearer $value';
                }
              });

              final response = await dio.fetch(retryOptions);
              return handler.resolve(response);
            } else {
              return handler.next(err);
            }
          }
        });
      } catch (e) {
        return handler.next(err);
      }
    } else {
      return handler.next(err);
    }
  }

  Future<bool> _refreshToken(String refreshToken) async {
    try {
      var response = await apiService.get(
          endPoint: '/User/RefreshToken?refreshToken=$refreshToken');

      final loginModel = LoginModel.fromJson(response);

      if (loginModel.status == 200 &&
          loginModel.token != null &&
          loginModel.refreshToken != null) {
        await appPreferences.setToken(loginModel.token!);
        await appPreferences.setRefreshToken(loginModel.refreshToken!);
        Map<String, dynamic> decodedToken =
            JwtDecoder.decode(loginModel.token!);
        userId = decodedToken['sub'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
