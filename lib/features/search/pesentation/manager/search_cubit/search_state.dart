part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final MovieModel movieModel;

  SearchSuccess(this.movieModel);
}

final class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure(this.errMessage);
}
