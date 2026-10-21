import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_boxes/controllers/history_controller.dart';
import 'package:three_boxes/views/widgets/history/history_card.dart';

import '../../../core/theme/app_colors.dart';

class HistoryCardList extends StatelessWidget {
  final HistoryController controller;

  const HistoryCardList({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final cards = controller.filteredCards;

      if (cards.isEmpty) {
        return const Center(
          child: Text(
            'No cards here yet',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textMuted,
            ),
          ),
        );
      }

      return ListView.separated(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        itemCount: cards.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final card = cards[i];
          final status = controller.getCardStatus(card);
          return Dismissible(
            key: ValueKey(card),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Colors.red.shade400,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.delete_outline_rounded, color: Colors.white, size: 24),
                ],
              ),
            ),
            onDismissed: (_) {
              controller.deleteCard(card);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Flashcard deleted')),
              );
            },
            child: Obx(
                  () => HistoryCard(
                card: card,
                tagLabel: controller.getTagLabel(status),
                tagColor: controller.getTagColor(status),
                isExpanded: controller.isCardExpanded(card),
                onTap: () => controller.toggleCardExpanded(card),
              ),
            ),
          );
        },
      );
    });
  }
}
