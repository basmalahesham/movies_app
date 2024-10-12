import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/browse/data/repos/browse_repo.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

part 'movies_list_state.dart';

class MoviesListCubit extends Cubit<MoviesListState> {
  MoviesListCubit(this.browseRepo) : super(MoviesListInitial());
  final BrowseRepo browseRepo;

  Future<void> fetchMoviesList({required int categoryName}) async {
    emit(MoviesListLoading());
    var result = await browseRepo.fetchMoviesList(categoryId: categoryName);
    result.fold(
      (failure) => emit(
        MoviesListFailure(failure.errMessage),
      ),
      (genre) => emit(
        MoviesListSuccess(genre),
      ),
    );
  }
}
