import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final _baseUrl = 'http://searchtest123-com.umbler.net/api-test/api';

  Future<Response> postGoogleSearch({
    required String? query,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? user = prefs.getString('email');
    String? password = prefs.getString('password');

    String basicAuth = 'Basic ${base64.encode(utf8.encode('$user:$password'))}';

    final Dio dio = Dio();
    var body = {'search': query};

    final response = await dio.post('$_baseUrl/v1/google-search',
        data: jsonEncode(body),
        options: Options(
          headers: {
            'Content-type': 'application/json',
            'app_id': '2323',
            'app_hash': 'jadeuboa',
            'authorization': basicAuth
          },
        ));

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to make request');
    }
  }
}
