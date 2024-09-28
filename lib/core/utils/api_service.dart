import 'package:dio/dio.dart';

class ApiService{
  final baseUrl = 'https://api.themoviedb.org/3/movie/';
  final apiKey = '5eaf06d00921bf74711bebae7460e509';
  final Dio dio = Dio();
  Future<Map<String,dynamic>> get({required String endpoint})async{
    var response = await dio.get('$baseUrl$endpoint?api_key=$apiKey');
    return response.data;
  }
}