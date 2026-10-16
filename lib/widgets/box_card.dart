import 'package:flutter/material.dart';
import 'package:sharpen/Models/box-model.dart';
import 'package:sharpen/views/review_page.dart';
import '../constants.dart';

class BoxCard extends StatelessWidget {
  final BoxModel box;

  const BoxCard({
    super.key,
    required this.box,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (box.flashCards.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("No cards in ${box.title} yet!"),
              duration: const Duration(seconds: 2),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReviewPage(box: box)),
          );
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: box.color,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.surface,
                  child: Text(box.number),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      box.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(box.description),
                  ],
                ),
                const Spacer(),
                Text(
                  box.number,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
