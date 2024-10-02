import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/generated/assets.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/presentation/manager/similar_movies/similar_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/views/widgets/more_movies_list_view.dart';
import 'package:movies_app/features/watch_list/pesentation/manager/watch_list_cubit/watch_list_cubit.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Results;
    Size size = MediaQuery.of(context).size;
    // Trigger the cubit function to fetch similar movies
    BlocProvider.of<SimilarMoviesCubit>(context)
        .fetchSimilarMovie(movieId: args.id ?? 0);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF1D1E1D),
        centerTitle: true,
        title: Text(
          args.title ?? '',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.22,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: 'https://image.tmdb.org/t/p/w500'
                                '${args.backdropPath ?? ''}',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
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
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            args.title ?? '',
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            args.releaseDate ?? '',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(181, 180, 180, 1.0),
                            ),
                          ),
                          // PopularItem(movies),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 190,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: 130,
                        height: 300,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: 'https://image.tmdb.org/t/p/w500'
                                  '${args.posterPath}',
                              fit: BoxFit.cover,
                              width: 130,
                              height: 200,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            BlocBuilder<WatchListCubit, WatchListState>(
                              builder: (context, state) {
                                return InkWell(
                                  onTap: () {
                                    BlocProvider.of<WatchListCubit>(context)
                                        .selectMovie(args);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: BlocProvider.of<WatchListCubit>(
                                                context)
                                            .state
                                            .idList
                                            .contains(args.id)
                                        ? Image.asset(Assets.imagesIcCheck)
                                        : Image.asset(Assets.imagesIcBookmark),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      // PopularItem(movies),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Action',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.share,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              args.overview ?? '',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${args.voteAverage}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                const MoreMoviesListView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
