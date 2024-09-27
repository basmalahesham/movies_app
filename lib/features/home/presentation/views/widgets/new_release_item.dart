import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/views/widgets/custom_movie_image.dart';

class NewReleaseItem extends StatelessWidget {
  const NewReleaseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 130,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: const CustomMovieImage(),
    );
  }
}
