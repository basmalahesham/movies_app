import 'package:flutter/material.dart';
import 'package:movies_app/features/browse/presentation/views/widgets/custom_browse_grid_view.dart';

class BrowseViewBody extends StatelessWidget {
  const BrowseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Browse Category',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            CustomBrowseGridView(),
          ],
        ),
      ),
    );
  }
}
