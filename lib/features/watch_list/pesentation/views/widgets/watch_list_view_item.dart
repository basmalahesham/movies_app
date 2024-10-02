import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/generated/assets.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/presentation/views/movie_details_view.dart';
import 'package:movies_app/features/watch_list/pesentation/manager/watch_list_cubit/watch_list_cubit.dart';

class WatchListViewItem extends StatelessWidget {
  const WatchListViewItem({super.key, required this.movieResult});
  final Results movieResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    MovieDetailsView.routeName,
                    arguments: movieResult,
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    imageUrl: 'https://image.tmdb.org/t/p/w500'
                        '${movieResult.posterPath}',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 100,
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
                          .selectMovie(movieResult);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: BlocProvider.of<WatchListCubit>(context)
                          .idList
                          .contains(movieResult.id)
                          ? Image.asset(Assets.imagesIcCheck)
                          : Image.asset(Assets.imagesIcBookmark),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  movieResult.title??'',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  movieResult.releaseDate??'',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(181, 180, 180, 1.0),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  movieResult.overview??'',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(181, 180, 180, 1.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
