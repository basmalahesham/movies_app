import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/views/widgets/custom_carousel_slider.dart';
import 'package:movies_app/features/home/presentation/views/widgets/new_releases_list_view.dart';
import 'package:movies_app/features/home/presentation/views/widgets/recomended_list_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomCarouselSlider(),
              SizedBox(
                height: 24,
              ),
              NewReleasesListView(),
              SizedBox(
                height: 30,
              ),
              RecomendedListView(),
            ],
          ),
        ),
      ],
    );
  }
}
