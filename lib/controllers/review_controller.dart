import 'package:get/get.dart';

class ReviewController extends GetxController {
  var questNum = 0.obs;

  void nextQuest(int totalCards) {
    if (totalCards == 0) return;
    if (questNum.value < totalCards - 1) {
      questNum.value++;
    } else {
      Get.back();
    }
  }

  void reset() {
    questNum.value = 0;
  }
}
