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

  Map<String, dynamic> toMap() {
    return {
      'boxId': boxId,
      'question': question,
      'answer': answer,
    };
  }

  factory FlashCard.fromMap(Map<dynamic, dynamic> map) {
    return FlashCard(
      map['boxId'] as int,
      map['question'] as String,
      map['answer'] as String,
    );
  }
}

