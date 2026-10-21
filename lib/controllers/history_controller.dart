import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_boxes/Models/flash_card.dart';
import 'package:three_boxes/controllers/flashcard_controller.dart';
import 'package:three_boxes/core/theme/app_colors.dart';

class HistoryController extends GetxController {
  final FlashCardController flashCardController = Get.find<FlashCardController>();

  final selectedFilter = Rxn<CardStatus>();

  static const filters = <(String, CardStatus?)>[
    ('All', null),
    ('Box 1', CardStatus.box1),
    ('Box 2', CardStatus.box2),
    ('Box 3', CardStatus.box3),
    ('Finished', CardStatus.finished),
  ];

  void setFilter(CardStatus? status) {
    selectedFilter.value = status;
  }

  List<FlashCard> get filteredCards {
    final allCards = flashCardController.flashcards;
    if (selectedFilter.value == null) {
      return allCards;
    }
    return allCards
        .where((card) => getCardStatus(card) == selectedFilter.value)
        .toList();
  }

  int get totalCardCount => flashCardController.getTotalCards();

  CardStatus getCardStatus(FlashCard card) {
    switch (card.boxId) {
      case 1:
        return CardStatus.box1;
      case 2:
        return CardStatus.box2;
      case 3:
        return CardStatus.box3;
      default:
        return CardStatus.finished;
    }
  }

  String getTagLabel(CardStatus status) {
    switch (status) {
      case CardStatus.box1:
        return 'Box 1';
      case CardStatus.box2:
        return 'Box 2';
      case CardStatus.box3:
        return 'Box 3';
      case CardStatus.finished:
        return 'Finished';
    }
  }

  Color getTagColor(CardStatus status) {
    switch (status) {
      case CardStatus.box1:
        return AppColors.box1;
      case CardStatus.box2:
        return AppColors.box2;
      case CardStatus.box3:
        return AppColors.box3;
      case CardStatus.finished:
        return AppColors.surface;
    }
  }
}
