import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://api.themoviedb.org/3/';
  final _apiKey = '5eaf06d00921bf74711bebae7460e509';
  final Dio _dio;
  ApiService(this._dio);
  Future<dynamic> get({required String endpoint, String? query}) async {
    var response = await _dio.get('$_baseUrl$endpoint?api_key=$_apiKey&$query');
    return response.data;
  }
}
