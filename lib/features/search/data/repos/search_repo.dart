import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, MovieModel>> fetchSearch({required String query});
}
