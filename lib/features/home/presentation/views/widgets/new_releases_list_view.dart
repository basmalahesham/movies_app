import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/views/widgets/new_release_item.dart';

class NewReleasesListView extends StatelessWidget {
  const NewReleasesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.topLeft,
      width: double.infinity,
      height: 187,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: const Color.fromRGBO(40, 42, 40, 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'New Releases ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  const NewReleaseItem(),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
