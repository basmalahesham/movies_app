import 'package:flutter/material.dart';
import 'package:movies_app/features/browse/presentation/views/widgets/browse_list_view_item.dart';

class BrowseListView extends StatelessWidget {
  const BrowseListView({
    super.key,
  });
  static const String routeName = 'browse_list_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF1D1E1D),
        title: const Text(
          '{generResponse!.name} List',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
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
            ),
          ],
        ),
      ),
    );
  }
}