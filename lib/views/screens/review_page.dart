import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_boxes/Models/box-model.dart';
import 'package:three_boxes/constants.dart';
import 'package:three_boxes/controllers/review_controller.dart';
import 'package:three_boxes/views/widgets/flash_card_widget.dart';
import 'package:three_boxes/views/widgets/primary_button.dart';

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
                    child: FlashCardWidget(reviewController: reviewController, box: box),
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


