import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearch({required String query}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearch(query: query);
    result.fold(
      (failure) => emit(
        SearchFailure(failure.errMessage),
      ),
      (movies) => emit(
        SearchSuccess(movies),
      ),
    );
  }
}
