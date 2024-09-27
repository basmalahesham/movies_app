import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/views/widgets/custom_carousel_slider_item.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final items = [
    Image.asset('assets/images/Image.png', fit: BoxFit.cover),
    Image.asset('assets/images/Image.png', fit: BoxFit.cover),
    Image.asset('assets/images/Image.png', fit: BoxFit.cover),
    Image.asset('assets/images/Image.png', fit: BoxFit.cover),
  ];

  @override
  Widget build(BuildContext context) {
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
      items: items.map((item) {
        return const CustomCarouselSliderItem();
      }).toList(),
    );
  }
}
