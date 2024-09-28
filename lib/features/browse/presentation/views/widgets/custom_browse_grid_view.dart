import 'package:flutter/material.dart';
import 'package:movies_app/features/browse/presentation/views/widgets/custom_browse_grid_view_item.dart';

class CustomBrowseGridView extends StatelessWidget {
  const CustomBrowseGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          childAspectRatio: 3 / 2,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return const CustomBrowseGridViewItem();
        },
      ),
    );
  }
}
