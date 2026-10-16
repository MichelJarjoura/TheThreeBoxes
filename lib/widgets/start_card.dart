import 'package:flutter/material.dart';
import 'package:sharpen/Models/box-model.dart';
import 'package:sharpen/views/review_page.dart';
import 'package:sharpen/widgets/primary_button.dart';
import '../constants.dart';

class StartCard extends StatelessWidget {
  const StartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TODAY",
                style: TextStyle(color: AppColors.primary),
              ),
              const SizedBox(height: 7),
              Text(
                "${boxes.fold(0, (sum, box) => sum + box.flashCards.length)} cards to review",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                "About ${(boxes.fold(0, (sum, box) => sum + box.flashCards.length) * 0.5).ceil()} minutes",
                style: TextStyle(color: AppColors.textMuted),
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                onPressed: () {
                  final activeBox = boxes.firstWhere(
                    (b) => b.flashCards.isNotEmpty,
                    orElse: () => boxes.first,
                  );
                  if (activeBox.flashCards.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No flashcards available to review!"),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReviewPage(box: activeBox),
                      ),
                    );
                  }
                },
                text: "Start review",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
