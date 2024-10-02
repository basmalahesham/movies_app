import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/presentation/views/movie_details_view.dart';

class SearchListViewItem extends StatelessWidget {
  const SearchListViewItem({
    super.key,
    required this.movieResponse,
  });
  final Results movieResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          Flexible(
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MovieDetailsView.routeName,
                      arguments: movieResponse,
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(
                      imageUrl: 'https://image.tmdb.org/t/p/w500'
                          '${movieResponse.posterPath}',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 100,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset('assets/images/ic_bookmark.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  movieResponse.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  movieResponse.releaseDate ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(181, 180, 180, 1.0),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  movieResponse.overview ?? '',
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
