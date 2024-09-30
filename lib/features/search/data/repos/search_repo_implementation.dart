import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/search/data/repos/search_repo.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, MovieModel>> fetchSearch({required String query}) {
    // TODO: implement fetchSearch
    throw UnimplementedError();
  }

}
