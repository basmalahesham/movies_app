part of 'top_rated_movies_cubit.dart';

@immutable
sealed class TopRatedMoviesState {}

final class TopRatedMoviesInitial extends TopRatedMoviesState {}
final class TopRatedMoviesLoading extends TopRatedMoviesState {}

final class TopRatedMoviesSuccess extends TopRatedMoviesState {
  final MovieModel movieModel;

  TopRatedMoviesSuccess(this.movieModel);
}

final class TopRatedMoviesFailure extends TopRatedMoviesState {
  final String errMessage;

  TopRatedMoviesFailure(this.errMessage);
}
