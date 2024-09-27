import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/views/widgets/custom_carousel_slider.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomCarouselSlider(),
      ],
    );
  }
}
