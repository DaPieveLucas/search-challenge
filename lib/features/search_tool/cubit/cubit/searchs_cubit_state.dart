part of 'searchs_cubit.dart';

@immutable
abstract class SearchsCubitState extends Equatable {}

class SearchsCubitInitial extends SearchsCubitState {
  @override
  List<Object> get props => [];
}

class SearchsCubitLoading extends SearchsCubitState {
  @override
  List<Object> get props => [];
}

class SearchsCubitSuccess extends SearchsCubitState {
  SearchsCubitSuccess(this.searchs);

  final List<SearchLinkModel> searchs;

  @override
  List<Object> get props => [searchs];
}

class SearchsCubitError extends SearchsCubitState {
  @override
  List<Object> get props => [];
}
