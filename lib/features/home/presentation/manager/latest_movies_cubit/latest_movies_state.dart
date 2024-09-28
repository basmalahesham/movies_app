part of 'latest_movies_cubit.dart';

@immutable
sealed class LatestMoviesState {}

final class LatestMoviesInitial extends LatestMoviesState {}

final class LatestMoviesLoading extends LatestMoviesState {}

final class LatestMoviesSuccess extends LatestMoviesState {
  final MovieModel movieModel;

  LatestMoviesSuccess(this.movieModel);
}

final class LatestMoviesFailure extends LatestMoviesState {
  final String errMessage;

  LatestMoviesFailure(this.errMessage);
}
