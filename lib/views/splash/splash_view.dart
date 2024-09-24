import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/generated/assets.dart';
import 'package:movies_app/layout/home_layout.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = "splash";
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () => Navigator.of(context).pushReplacementNamed(
        HomeLayout.routeName,
      ),
    );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.imagesSplash,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
