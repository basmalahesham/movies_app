import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/views/widgets/recomended_item.dart';

class RecomendedListView extends StatelessWidget {
  const RecomendedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 14),
      color: const Color.fromRGBO(40, 42, 40, 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recomended',
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
              itemBuilder: (BuildContext context, int index) =>
                  const RecomendedItem(),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
