import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharpen/Models/box-model.dart';
import 'package:sharpen/controllers/review_controller.dart';
import 'package:sharpen/views/screens/review_page.dart';
import 'package:sharpen/views/widgets/primary_button.dart';
import '../../constants.dart';

class StartCard extends StatelessWidget {
  const StartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ReviewController>();

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
              Obx(() => Text(
                "${controller.getNumOfFlashCards()} cards to review",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              )),
              const SizedBox(height: 7),
              Obx(() => Text(
                "About ${(controller.getNumOfFlashCards() * 0.5).ceil()} minutes",
                style: TextStyle(color: AppColors.textMuted),
              )),
              const SizedBox(height: 20),
              PrimaryButton(
                onPressed: () {
                  final activeBox = boxes.firstWhere(
                    (b) => controller.getFlashCardsOfBox(b.id).isNotEmpty,
                    orElse: () => boxes.first,
                  );
                  if (controller.getFlashCardsOfBox(activeBox.id).isEmpty) {
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
