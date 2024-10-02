import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/widgets/custom_error_widget.dart';
import 'package:movies_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:movies_app/features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/views/widgets/custom_carousel_slider_item.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesSuccess) {
          return CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.55,
              viewportFraction: 1.0, // Full width for each item
              enlargeCenterPage: false, // Disable enlargement to avoid gaps
              //height: size.height * 0.30,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlayInterval: const Duration(seconds: 8),
              autoPlayAnimationDuration: const Duration(milliseconds: 400),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              /*
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
*/
            ),
            items: state.movieModel.results!.map((item) {
              return CustomCarouselSliderItem(movies: item);
            }).toList(),
          );
        } else if (state is PopularMoviesFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
