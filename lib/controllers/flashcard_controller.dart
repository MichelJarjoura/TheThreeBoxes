import 'package:get/get.dart';
import '../Models/flash_card.dart';

class FlashCardController extends GetxController {

  var gotIt = true.obs;

  var flashcards = <FlashCard>[
    FlashCard(1, "Why are you gay1", "Because .. "),
    FlashCard(1, "Why are you gay2", "Because .. "),
    FlashCard(1, "Why are you gay3", "Because .. "),
    FlashCard(1, "Why are you gay4", "Because .. "),
    FlashCard(1, "Why are you gay5", "Because .. "),
  ].obs;

  List<FlashCard> getFlashCardsOfBox(int boxId) {
    return flashcards.where((card) => card.boxId == boxId).toList();
  }

  int getTotalCards() {
    return flashcards.length;
  }

  int getNumOfCardsOnBox(int boxId) {
    return getFlashCardsOfBox(boxId).length;
  }

  void addFlashCard(int boxId, String question, String answer) {
    if (question.trim().isEmpty || answer.trim().isEmpty) return;
    flashcards.add(FlashCard(boxId, question.trim(), answer.trim()));
  }

  void deleteFlashCard(FlashCard card) {
    flashcards.remove(card);
  }

  void moveFlashCard(FlashCard card, int targetBoxId) {
    final index = flashcards.indexOf(card);
    if (index != -1) {
      flashcards[index] = card.copyWith(boxId: targetBoxId);
    }
  }

  void moveCardToBox(FlashCard card, bool isGotIt) {
    if (isGotIt) {
      if (card.boxId == 1) {
        moveFlashCard(card, 2);
      } else if (card.boxId == 2) {
        moveFlashCard(card, 3);
      } else {
        deleteFlashCard(card);
      }
    } else {
      if (card.boxId == 2) {
        moveFlashCard(card, 1);
      } else if (card.boxId == 3) {
        moveFlashCard(card, 2);
      }
    }
  }
}
