class FlashCard {
  final int boxId;
  final String question;
  final String answer;

  FlashCard(this.boxId, this.question, this.answer);

  FlashCard copyWith({
    int? boxId,
    String? question,
    String? answer,
  }) {
    return FlashCard(
      boxId ?? this.boxId,
      question ?? this.question,
      answer ?? this.answer,
    );
  }
}

final List<FlashCard> initialFlashCards = [
  FlashCard(1, "Why are you gay1", "Because .. "),
  FlashCard(1, "Why are you gay2", "Because .. "),
  FlashCard(1, "Why are you gay3", "Because .. "),
  FlashCard(1, "Why are you gay4", "Because .. "),
  FlashCard(1, "Why are you gay5", "Because .. "),
];
