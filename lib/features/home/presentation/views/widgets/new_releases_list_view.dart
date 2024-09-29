import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/widgets/custom_error_widget.dart';
import 'package:movies_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:movies_app/features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/views/widgets/new_release_item.dart';

class NewReleasesListView extends StatelessWidget {
  const NewReleasesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.topLeft,
      width: double.infinity,
      height: 187,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: const Color.fromRGBO(40, 42, 40, 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'New Releases ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
            builder: (context, state) {
              if (state is PopularMoviesSuccess) {
                return Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => NewReleaseItem(
                      topMovies: state.movieModel,
                      index: index,
                    ),
                    itemCount: state.movieModel.results!.length,
                  ),
                );
              } else if (state is PopularMoviesFailure) {
                return CustomErrorWidget(errMessage: state.errMessage);
              } else {
                return const CustomLoadingIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
