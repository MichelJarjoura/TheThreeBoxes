import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharpen/Models/box-model.dart';
import 'package:sharpen/constants.dart';
import 'package:sharpen/controllers/review_controller.dart';
import 'package:sharpen/views/widgets/primary_button.dart';

class ReviewPage extends StatelessWidget {
  final BoxModel box;

  const ReviewPage({super.key, required this.box});

  @override
  Widget build(BuildContext context) {
    final reviewController = Get.put(ReviewController());
    reviewController.initSession(box.id);

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
                            var currentCardNum = reviewController.currentCardNum(box.id);
                            var total = reviewController.totalCards;
                            return Text(
                              "${box.title} . Card $currentCardNum of $total",
                            );
                          }),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                              top: 8,
                              bottom: 8,
                            ),
                            child: Obx(() {
                              return LinearProgressIndicator(
                                value: reviewController.getProgressBarValue(box.id),
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
                Obx(() {
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
                              reviewController.getQuestion(box.id),
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
                }),
                const SizedBox(height: 30),
                Obx(() {
                  if (reviewController.totalCardsIsZero(box.id) || reviewController.isFinished(box.id)) {
                    return PrimaryButton(
                      onPressed: () => Navigator.pop(context),
                      text: "Go back",
                    );
                  }
                  return SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () {
                              reviewController.onAnswerPressed(box.id, false);
                            },
                            text: "Not yet",
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () {
                              reviewController.onAnswerPressed(box.id, true);
                            },
                            text: "Got it",
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
