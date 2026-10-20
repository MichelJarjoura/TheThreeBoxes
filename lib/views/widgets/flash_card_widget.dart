import 'package:flutter/material.dart';
import 'package:three_boxes/Models/box-model.dart';

import '../../constants.dart';
import '../../controllers/review_controller.dart';

class FlashCardWidget extends StatelessWidget {
  const new({
    super.key,
    required this.reviewController,
    required this.box,
  });

  final ReviewController reviewController;
  final BoxModel box;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: AppColors.surface,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question:",
              style: TextStyle(
                color: AppColors.textMuted,
              ),
            ),
            const Divider(
              indent: 35,
              endIndent: 35,
              thickness: 0.4,
            ),
            const SizedBox(height: 10),
            Text(
              reviewController.getQuestion(box.id),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Center(child: OutlinedButton(onPressed: (){}, child: Text("reveal answer",
            style: TextStyle(
              color:AppColors.textMuted
            ),)))
          ],
        ),
      ),
    );
  }
}