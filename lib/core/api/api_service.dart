import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio;

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://api.testte.online',
            connectTimeout: const Duration(milliseconds: 5000),
            receiveTimeout: const Duration(milliseconds: 3000),
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );

  Future<void> _addTokenToHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  Future<Response> get(String endpoint) async {
    try {
      await _addTokenToHeaders();
      final response = await _dio.get(endpoint);
      return response;
    } on DioError catch (e) {
      throw Exception(
          e.response?.data['message'] ?? 'Request to $endpoint failed');
    }
  }

  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    try {
      await _addTokenToHeaders();
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioError catch (e) {
      throw Exception(
          e.response?.data['message'] ?? 'Request to $endpoint failed');
    }
  }
}
