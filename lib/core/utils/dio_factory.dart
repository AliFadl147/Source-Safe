// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:source_safe_project/core/utils/api_service.dart';
import 'package:source_safe_project/core/utils/app_interceptors.dart';
import 'package:source_safe_project/core/utils/app_prefs.dart';
import 'package:source_safe_project/core/utils/service_locator.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
// const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  DioFactory();

  Future<Dio> getDio() async {
    Dio dio = Dio();

    ApiService apiService = ApiService(dio);

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: '',
    };

    dio.options = BaseOptions(
      baseUrl: ApiService.baseUrl,
      headers: headers,
    );

    dio.interceptors
        .add(TokenInterceptor(getIt.get<AppPreferences>(), dio, apiService));

    if (!kReleaseMode) {
      // its debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
      ));
    }

    return dio;
  }
}
