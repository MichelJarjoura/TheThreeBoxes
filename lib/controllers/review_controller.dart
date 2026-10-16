import 'package:get/get.dart';
import '../Models/flash_card.dart';

class ReviewController extends GetxController {
  var questNum = 0.obs;
  var flashcards = <FlashCard>[
    FlashCard(1, "Why are you gay1", "Because .. "),
    FlashCard(1, "Why are you gay2", "Because .. "),
    FlashCard(1, "Why are you gay3", "Because .. "),
    FlashCard(1, "Why are you gay4", "Because .. "),
    FlashCard(1, "Why are you gay5", "Because .. "),
  ].obs;

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

  List<FlashCard> getFlashCardsOfBox(int boxId) {
    return flashcards.where((card) => card.boxId == boxId).toList();
  }

  int getNumOfFlashCards() {
    return flashcards.length;
  }

  int getNumOfCardsOnBox(int boxId) {
    return getFlashCardsOfBox(boxId).length;
  }

  void addFlashCard(int boxId, String question, String answer) {
    if (question.trim().isEmpty || answer.trim().isEmpty) return;
    flashcards.add(FlashCard(boxId, question.trim(), answer.trim()));
  }
}
