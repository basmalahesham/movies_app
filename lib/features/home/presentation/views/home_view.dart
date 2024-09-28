import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:movies_app/features/home/presentation/manager/latest_movies_cubit/latest_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/tob_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PopularMoviesCubit(
              getIt.get<HomeRepoImplementation>(),
            )..fetchPopularMovie(),
          ),
          BlocProvider(
            create: (context) => LatestMoviesCubit(
              getIt.get<HomeRepoImplementation>(),
            )..fetchLatestMovie(),
          ),
          BlocProvider(
            create: (context) => TopRatedMoviesCubit(
              getIt.get<HomeRepoImplementation>(),
            )..fetchTopRatedMovie(),
          ),
        ],
        child: const HomeViewBody(),
      ),
    );
  }
}
