// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:search_challenge/app/services/api_service.dart';

import '../../model/search_link_model.dart';

part 'searchs_cubit_state.dart';

class SearchsCubit extends Cubit<SearchsCubitState> {
  SearchsCubit({required this.client}) : super(SearchsCubitInitial());

  ApiService client = ApiService();

  void postGoogleSearch({String? title, String? link, String? query}) async {
    try {
      emit(SearchsCubitLoading());

      final Response response = await client.postGoogleSearch(query: query);

      print('user created: ${response.data}');

      final retrievedData = SearchLinkModel.fromMap(response.data);

      print('this retrieved user: ${retrievedData.toString()}');

      emit(SearchsCubitSuccess(
        retrievedData.title ?? '',
        retrievedData.link ?? '',
      ));
    } catch (e) {
      emit(SearchsCubitError(e.toString()));
    }
  }
}
