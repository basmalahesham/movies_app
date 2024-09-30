part of 'movies_list_cubit.dart';

@immutable
sealed class MoviesListState {}

final class MoviesListInitial extends MoviesListState {}
final class MoviesListLoading extends MoviesListState {}

final class MoviesListSuccess extends MoviesListState {
  final MovieModel movieModel;

  MoviesListSuccess(this.movieModel);
}

final class MoviesListFailure extends MoviesListState {
  final String errMessage;

  MoviesListFailure(this.errMessage);
}