import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharpen/Models/box-model.dart';
import 'package:sharpen/constants.dart';
import 'package:sharpen/controllers/review_controller.dart';
import 'package:sharpen/widgets/primary_button.dart';

class ReviewPage extends StatelessWidget {
  final BoxModel box;

  const ReviewPage({super.key, required this.box});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewController());
    controller.reset(); // Reset to starting point (0) whenever review opens

    final isEmpty = box.flashCards.isEmpty;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: CloseButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(AppColors.surface),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() {
                            final currentCardNum = isEmpty
                                ? 0
                                : (controller.questNum.value + 1).clamp(0, box.flashCards.length);
                            return Text(
                              "${box.title} . Card $currentCardNum of ${box.flashCards.length}",
                            );
                          }),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                              top: 8,
                              bottom: 8,
                            ),
                            child: Obx(() {
                              final progress = isEmpty
                                  ? 0.0
                                  : ((controller.questNum.value + 1) / box.flashCards.length).clamp(0.0, 1.0);
                              return LinearProgressIndicator(
                                value: progress,
                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.fill),
                                color: AppColors.track,
                                minHeight: 8,
                                borderRadius: BorderRadius.circular(15),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Obx(
                  () {
                    final hasCards = !isEmpty &&
                        controller.questNum.value < box.flashCards.length;
                    final questionText = hasCards
                        ? box.flashCards[controller.questNum.value].question
                        : "No cards available in this box.";

                    return SizedBox(
                      width: double.infinity,
                      height: 500,
                      child: Card(
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
                                questionText,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                if (isEmpty)
                  PrimaryButton(
                    onPressed: () => Navigator.pop(context),
                    text: "Go back",
                  )
                else
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () => controller.nextQuest(box.flashCards.length),
                            text: "Not yet",
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () => controller.nextQuest(box.flashCards.length),
                            text: "Got it",
                          ),
                        ),
                      ],
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
