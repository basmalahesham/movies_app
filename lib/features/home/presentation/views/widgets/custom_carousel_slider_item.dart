import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/generated/assets.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/presentation/views/movie_details_view.dart';
import 'package:movies_app/features/watch_list/pesentation/manager/watch_list_cubit/watch_list_cubit.dart';

class CustomCarouselSliderItem extends StatelessWidget {
  const CustomCarouselSliderItem({super.key, required this.movies});
  final Results movies;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.30,
      margin: const EdgeInsets.only(bottom: 5),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: size.height * 0.22,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: 'https://image.tmdb.org/t/p/w500'
                      '${movies.backdropPath ?? ''}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                ),
                Align(
                  alignment: Alignment.center,
                  // left: size.width * 0.40,
                  // top: size.height * 0.09,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_circle_filled,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: size.width * 0.05,
            top: size.height * 0.06,
            child: Row(
              children: [
                SizedBox(
                  width: 130,
                  height: 300,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            MovieDetailsView.routeName,
                            arguments: movies,
                          );
                        },
                        child: CachedNetworkImage(
                          imageUrl: 'https://image.tmdb.org/t/p/w500'
                              '${movies.posterPath}',
                          fit: BoxFit.cover,
                          width: 130,
                          height: 200,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                      ),
                      BlocBuilder<WatchListCubit, WatchListState>(
                        builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              BlocProvider.of<WatchListCubit>(context)
                                  .selectMovie(movies);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: BlocProvider.of<WatchListCubit>(context).state
                                  .idList
                                  .contains(movies.id)
                                  ? Image.asset(Assets.imagesIcCheck)
                                  : Image.asset(Assets.imagesIcBookmark),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      movies.title ?? '',
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movies.releaseDate ?? '',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(181, 180, 180, 1.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
