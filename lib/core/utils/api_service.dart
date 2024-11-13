import 'package:dio/dio.dart';

class ApiService {
  static const baseUrl = 'http://192.168.249.49:5067';
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
}
