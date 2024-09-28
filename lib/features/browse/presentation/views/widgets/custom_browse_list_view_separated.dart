import 'package:flutter/material.dart';
import 'package:movies_app/features/browse/presentation/views/widgets/browse_list_view_item.dart';

class CustomBrowseListViewSeparated extends StatelessWidget {
  const CustomBrowseListViewSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (buildContext, index) => Container(
          margin: const EdgeInsets.only(
            left: 2,
            right: 2,
            top: 18,
            bottom: 18,
          ),
          width: double.infinity,
          height: 1,
          color: Colors.grey,
        ),
        itemCount: 10,
        itemBuilder: (buildContext, index) {
          return const BrowseListViewItem();
        },
      ),
    );
  }
}
