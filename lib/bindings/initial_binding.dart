import 'package:get/get.dart';
import 'package:three_boxes/controllers/flashcard_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FlashCardController(), permanent: true);
  }
}
