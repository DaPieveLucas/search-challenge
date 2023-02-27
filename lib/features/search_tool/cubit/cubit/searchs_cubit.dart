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

  void fetchGoogleSearch(int fetchUserId) async {
    try {
      emit(SearchsCubitLoading());

      final Response response = await client.getGoogleSearch(fetchUserId);

      final List<SearchLinkModel> results = response.data['data']
          .map<SearchLinkModel>((e) => SearchLinkModel.fromMap(e))
          .toList();

      emit(SearchsCubitSuccess(results));
    } catch (e) {
      emit(SearchsCubitError());
    }
  }
}
