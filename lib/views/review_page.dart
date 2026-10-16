import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharpen/Models/box-model.dart';
import 'package:sharpen/constants.dart';
import 'package:sharpen/controllers/review_controller.dart';
import 'package:sharpen/widgets/primary_button.dart';

class ReviewPage extends StatelessWidget {

  final BoxModel box;
   const ReviewPage({super.key,required this.box});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(ReviewController());


    return Scaffold(
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 25,vertical: 25),
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
                      )
                      ,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${box.title} . Card ${controller.questNum + 1} of ${box.flashCards.length}",),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 8,
                                top: 8,
                                bottom: 8
                              ),
                              child: LinearProgressIndicator(
                                value: 0.6,
                                valueColor: AlwaysStoppedAnimation<Color>(AppColors.fill),
                                color: AppColors.track,
                                minHeight: 8,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                  ,

                  Obx(
                    () => SizedBox(
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
                              Text("Question:"
                              ,style: TextStyle(
                                  color: AppColors.textMuted
                                ),),

                              Divider(
                                indent: 35,
                                endIndent: 35,
                                thickness: 0.4,
                              ),
                              SizedBox(height: 10,),
                              Text(box.flashCards[controller.questNum].question,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold

                              ))

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                      SizedBox(height: 30,),
                  SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(child: PrimaryButton(
                                   onPressed: controller.nextQuest()
                                ,text: "Not yet")),
                            SizedBox(width: 20,),
                            Expanded(child: PrimaryButton(
                                onPressed:controller.nextQuest(),
                                text: "Got it")),
                          ],
                        ),
                      ),
                ],
              ),

            ),
          )
      ),
    );
  }
}
