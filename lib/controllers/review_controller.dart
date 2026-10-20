import 'package:get/get.dart';
import 'package:three_boxes/Models/flash_card.dart';
import 'package:three_boxes/controllers/flashcard_controller.dart';

class ReviewController extends GetxController {
  final controller = Get.find<FlashCardController>();

  var sessionCards = <FlashCard>[].obs;
  var questNum = 0.obs;
  var answerIsRevealed = false.obs;

  void initSession(int boxId) {
    sessionCards.value = controller.getFlashCardsOfBox(boxId);
    questNum.value = 0;
  }

  int get totalCards => sessionCards.length;

  int currentCardNum(int boxId) {
    if (totalCards == 0) return 0;
    return (questNum.value + 1).clamp(0, totalCards);
  }

  double getProgressBarValue(int boxId) {
    if (totalCards == 0) return 0.0;
    return ((questNum.value + 1) / totalCards).clamp(0.0, 1.0);
  }

  String getQuestion(int boxId) {
    if (sessionCards.isEmpty || questNum.value >= sessionCards.length) {
      return "All questions reviewed!";
    }
    return sessionCards[questNum.value].question;
  }

  String getAnswer(int boxId) {
    if (sessionCards.isEmpty || questNum.value >= sessionCards.length) {
      return "All answers reviewed!";
    }
    return sessionCards[questNum.value].answer;
  }

  bool isFinished(int boxId) {
    return sessionCards.isEmpty || questNum.value >= sessionCards.length;
  }

  void onAnswerPressed(int boxId, bool gotIt) {
    if (isFinished(boxId)) return;

    final currentCard = sessionCards[questNum.value];
    controller.moveCardToBox(currentCard, gotIt);

    questNum.value++;
  }

  bool totalCardsIsZero(int boxId) {
    return totalCards == 0;
  }


  void toggleAnswerIsRevealed(){
    if(answerIsRevealed.value == true){
      answerIsRevealed.value = false;
    }else{
      answerIsRevealed.value = true;
    }

  }

}
