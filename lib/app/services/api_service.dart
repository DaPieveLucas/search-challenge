import 'package:dio/dio.dart';

class ApiService {
  Future<Response> getGoogleSearch(int getUserId) async {
    final Dio dio = Dio();

    final response =
        await dio.get('https://reqres.in/api/users?page=$getUserId');

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to make request');
    }
  }
}
