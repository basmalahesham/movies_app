import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

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
          onTap: () {},
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
        InkWell(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset('assets/images/ic_bookmark.png'),
          ),
        ),
      ],
    );
  }
}
