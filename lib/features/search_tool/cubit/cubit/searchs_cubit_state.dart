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
  SearchsCubitSuccess(this.title, this.link);

  final String title;
  final String link;

  @override
  List<Object> get props => [title, link];
}

class SearchsCubitError extends SearchsCubitState {
  SearchsCubitError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
