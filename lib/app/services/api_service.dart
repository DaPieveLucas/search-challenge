import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://reqres.in/api';
  //mudar baseUrl para o endereço correto e colocar o endpoint correto

  Future<Response> postGoogleSearch({
    required String? query,
  }) async {
    final Dio dio = Dio();
    var body = {'search': query};

    final response = await dio.post('$_baseUrl/',
        data: jsonEncode(body),
        options: Options(
          headers: {
            'Content-type': 'application/json',
            'app_id': '2323',
            'app_hash': 'jadeuboa'
          },
        ));

    if (response.statusCode == 201) {
      return response;
    } else {
      throw Exception('Failed to make request');
    }
  }
}
