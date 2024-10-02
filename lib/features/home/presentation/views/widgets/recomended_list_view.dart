import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/widgets/custom_error_widget.dart';
import 'package:movies_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:movies_app/features/home/presentation/manager/tob_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/views/widgets/recomended_item.dart';

class RecomendedListView extends StatelessWidget {
  const RecomendedListView({super.key});

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
            'Recomended',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
            builder: (context, state) {
              if (state is TopRatedMoviesSuccess) {
                return Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) =>
                        RecomendedItem(
                      movie: state.movieModel.results![index],
                    ),
                    itemCount: state.movieModel.results!.length,
                  ),
                );
              } else if (state is TopRatedMoviesFailure) {
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
