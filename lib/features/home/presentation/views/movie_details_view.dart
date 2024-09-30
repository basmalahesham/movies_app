import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:movies_app/features/home/presentation/manager/similar_movies/similar_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/views/widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({
    super.key,
  });

  static const String routeName = 'movie_details_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMoviesCubit(
        getIt.get<HomeRepoImplementation>(),
      ),
      child: const MovieDetailsViewBody(),
    );
  }
}
