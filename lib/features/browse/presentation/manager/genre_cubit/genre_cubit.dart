import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/browse/data/models/genre_model.dart';
import 'package:movies_app/features/browse/data/repos/browse_repo.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  GenreCubit(this.browseRepo) : super(GenreInitial());
  final BrowseRepo browseRepo;

  Future<void> fetchGenre() async {
    emit(GenreLoading());
    var result = await browseRepo.fetchGenre();
    result.fold(
          (failure) => emit(
        GenreFailure(failure.errMessage),
      ),
          (genre) => emit(
        GenreSuccess(genre),
      ),
    );
  }
}
