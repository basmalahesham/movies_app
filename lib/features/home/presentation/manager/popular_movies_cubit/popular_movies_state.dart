part of 'popular_movies_cubit.dart';

@immutable
sealed class PopularMoviesState {}

final class PopularMoviesInitial extends PopularMoviesState {}

final class PopularMoviesLoading extends PopularMoviesState {}

final class PopularMoviesSuccess extends PopularMoviesState {
  final MovieModel movieModel;

  PopularMoviesSuccess(this.movieModel);
}

final class PopularMoviesFailure extends PopularMoviesState {
  final String errMessage;

  PopularMoviesFailure(this.errMessage);
}
