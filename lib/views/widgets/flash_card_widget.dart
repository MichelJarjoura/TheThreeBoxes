import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_boxes/Models/box-model.dart';
import '../../constants.dart';
import '../../controllers/review_controller.dart';

class FlashCardWidget extends StatelessWidget {

   FlashCardWidget({
    super.key,
    required this.box,
  });

  final BoxModel box;
  final reviewController = Get.find<ReviewController>();


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
            Obx(
                  (){
                    return Text(
                   reviewController.answerIsRevealed.value == true ? "answer" : "Question",
              style: TextStyle(
                color: AppColors.textMuted,
              ),
            );}
      ),
            const Divider(
              indent: 35,
              endIndent: 35,
              thickness: 0.4,
            ),
            const SizedBox(height: 10),
      Obx(
          ()=>
      Text(
                reviewController.answerIsRevealed.value == true?
                    reviewController.getAnswer(box.id):
                    reviewController.getQuestion(box.id),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),),
            Spacer(),
            Center(child: OutlinedButton(onPressed: ()=> reviewController.toggleAnswerIsRevealed(),
                child:
                Obx(
                  ()=>Text(
                  reviewController.answerIsRevealed.value == true?
              "return to question":"reveal answer",
            style: TextStyle(
              color:AppColors.textMuted
            ),)
            ),
            ))
          ],
        ),
      ),
    );
  }
}