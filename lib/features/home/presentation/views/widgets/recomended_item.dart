import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/presentation/views/widgets/custom_movie_image.dart';

class RecomendedItem extends StatelessWidget {
  const RecomendedItem({super.key, required this.topMovies, required this.index});
  final MovieModel topMovies;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color.fromRGBO(52, 53, 52, 1.0),
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 1.6),
        ],
      ),
      child: Column(
        children: [
           Stack(
            children: [
              CustomMovieImage(movies: topMovies, index: index,),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(6),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.grade,
                      size: 18,
                      color: Color.fromRGBO(255, 187, 59, 1.0),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${topMovies.results!.elementAt(index).voteAverage}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  topMovies.results!.elementAt(index).title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  topMovies.results!.elementAt(index).releaseDate ?? '',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 10,
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
