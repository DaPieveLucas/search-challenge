// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:search_challenge/app/services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/search_link_model.dart';

part 'searchs_cubit_state.dart';

class SearchsCubit extends Cubit<SearchsCubitState> {
  SearchsCubit({required this.client}) : super(SearchsCubitInitial());

  ApiService client = ApiService();

  Future<void> setLaunchUrl(String? search) async {
    String? url = search;
    final Uri uri = Uri.parse(url ?? '');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> postGoogleSearch(
      {String? title, String? link, String? query}) async {
    try {
      emit(SearchsCubitLoading());

      final Response response = await client.postGoogleSearch(query: query);

      print('user created: ${response.data}');

      final retrievedData = SearchLinkModel.fromMap(response.data);

      emit(SearchsCubitSuccess(
        retrievedData.title ?? 'no title retrieved',
        retrievedData.link ?? 'no link retrieved',
      ));
    } catch (e) {
      emit(SearchsCubitError(e.toString()));
    }
  }
}
