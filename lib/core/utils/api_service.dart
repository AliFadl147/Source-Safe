import 'package:dio/dio.dart';
import 'package:source_safe_project/core/utils/dio_factory.dart';

class ApiService {
  static const baseUrl = 'http://127.0.0.1:5114';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    var response = await _dio.post('$baseUrl$endPoint', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> postType2({
    required String endPoint,
  }) async {
    var response = await _dio.post('$baseUrl$endPoint');
    return response.data;
  }

  Future<dynamic> postFormData({
    required String endPoint,
    required dynamic data,
    Options? options,
  }) async {
    const baseUrl = 'http://127.0.0.1:5114'; // Replace with your backend URL
    final url = '$baseUrl$endPoint';

    final response = await _dio.post(
      url,
      data: data,
      options: options,
    );

    return response.data;
  }
}
