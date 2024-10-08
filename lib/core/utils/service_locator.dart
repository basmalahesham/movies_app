import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/browse/data/repos/browse_repo_implementation.dart';
import 'package:movies_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:movies_app/features/search/data/repos/search_repo_implementation.dart';

final getIt = GetIt.instance;
void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImplementation>(
      HomeRepoImplementation(getIt.get<ApiService>()));
  getIt.registerSingleton<SearchRepoImplementation>(
      SearchRepoImplementation(getIt.get<ApiService>()));
  getIt.registerSingleton<BrowseRepoImplementation>(
      BrowseRepoImplementation(getIt.get<ApiService>()));
}
