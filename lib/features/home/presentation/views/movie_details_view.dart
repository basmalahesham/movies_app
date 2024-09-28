import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/views/widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  static const String routeName = 'movie_details_view';
  @override
  Widget build(BuildContext context) {
    return const MovieDetailsViewBody();
  }
}
