import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/widgets/custom_error_widget.dart';
import 'package:movies_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:movies_app/features/home/presentation/manager/similar_movies/similar_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/views/widgets/more_movies_item.dart';

class MoreMoviesListView extends StatelessWidget {
  const MoreMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      color: const Color.fromRGBO(40, 42, 40, 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'More Like This',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
            builder: (context, state) {
              if (state is SimilarMoviesSuccess) {
                return Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) =>
                        MoreMoviesItem(
                      movie: state.movieModel.results![index],
                    ),
                    itemCount: state.movieModel.results!
                        .length, // Use actual length of movies
                  ),
                );
              } else if (state is SimilarMoviesFailure) {
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
