import 'package:dio/dio.dart';

class NewsRepository {
  final _dio = Dio();

  Future<Response> getTopBusinessNews() async {
    final res = await _dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=02252582c8a6486893f9c6f84a604377");

    return res;
  }
}
