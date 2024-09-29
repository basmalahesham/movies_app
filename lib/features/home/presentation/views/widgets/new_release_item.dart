import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/presentation/views/widgets/custom_movie_image.dart';

class NewReleaseItem extends StatelessWidget {
  const NewReleaseItem({super.key, required this.topMovies, required this.index});
  final MovieModel topMovies;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 130,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: CustomMovieImage(index: index,movies: topMovies,),
    );
  }
}
