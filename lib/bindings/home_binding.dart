import 'package:get/get.dart';
import 'package:three_boxes/controllers/flashcard_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlashCardController>(() => FlashCardController());
  }
}
