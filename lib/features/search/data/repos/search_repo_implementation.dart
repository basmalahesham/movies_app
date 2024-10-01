import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/search/data/repos/search_repo.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, MovieModel>> fetchSearch(
      {required String query}) async {
    try {
      var data = await apiService.get(
        endpoint: 'search/movie',
        query: query,
        queryName: 'query',
      );
      var result = MovieModel.fromJson(data);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
