import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/data/repos/home_repo.dart';

class HomeRepoImplementation implements HomeRepo{
  @override
  Future<Either<Failure, List<MovieModel>>> fetchLatestMovie() {
    // TODO: implement fetchLatestMovie
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovie() {
    // TODO: implement fetchPopularMovie
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchTopRatedMovie() {
    // TODO: implement fetchTopRatedMovie
    throw UnimplementedError();
  }

}