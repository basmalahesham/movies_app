import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/generated/assets.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/presentation/views/movie_details_view.dart';
import 'package:movies_app/features/watch_list/pesentation/manager/watch_list_cubit/watch_list_cubit.dart';

class CustomMovieImage extends StatelessWidget {
  const CustomMovieImage({
    super.key,
    required this.movies,
    required this.index,
  });
  final MovieModel movies;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              MovieDetailsView.routeName,
              arguments: movies.results!.elementAt(index),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/w500'
                  '${movies.results!.elementAt(index).posterPath}',
              fit: BoxFit.cover,
              width: 110,
              height: 130,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
        BlocBuilder<WatchListCubit, WatchListState>(
          builder: (context, state) {
            return InkWell(
              onTap: () {
                BlocProvider.of<WatchListCubit>(context)
                    .selectMovie(movies.results!.elementAt(index));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: BlocProvider.of<WatchListCubit>(context).state
                        .idList
                        .contains(movies.results!.elementAt(index).id)
                    ? Image.asset(Assets.imagesIcCheck)
                    : Image.asset(Assets.imagesIcBookmark),
              ),
            );
          },
        ),
      ],
    );
  }
}
