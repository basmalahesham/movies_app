import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

abstract class HomeRepo{
  Future<Either<Failure,MovieModel>> fetchPopularMovie();
  Future<Either<Failure,MovieModel>> fetchLatestMovie();
  Future<Either<Failure,MovieModel>> fetchTopRatedMovie();
}