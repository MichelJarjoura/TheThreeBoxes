import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_boxes/Models/flash_card.dart';
import 'package:three_boxes/controllers/history_controller.dart';
import 'package:three_boxes/core/theme/app_colors.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.isRegistered<HistoryController>()
        ? Get.find<HistoryController>()
        : Get.put(HistoryController());

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HistoryHeader(controller: controller),
            const SizedBox(height: 18),
            _FilterChipList(controller: controller),
            const SizedBox(height: 18),
            Expanded(
              child: _HistoryCardList(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryHeader extends StatelessWidget {
  final HistoryController controller;

  const _HistoryHeader({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (Navigator.canPop(context))
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: CloseButton(
                    onPressed: () => Get.back(),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(AppColors.surface),
                    ),
                  ),
                ),
              const Text(
                'History',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Obx(
            () => Text(
              '${controller.totalCardCount} cards in total',
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.textMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChipList extends StatelessWidget {
  final HistoryController controller;

  const _FilterChipList({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Obx(() {
        final selectedFilter = controller.selectedFilter.value;
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemCount: HistoryController.filters.length,
          separatorBuilder: (_, _) => const SizedBox(width: 10),
          itemBuilder: (context, i) {
            final (label, value) = HistoryController.filters[i];
            final isSelected = selectedFilter == value;
            return _FilterChip(
              label: label,
              selected: isSelected,
              onTap: () => controller.setFilter(value),
            );
          },
        );
      }),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(21),
          border: selected
              ? null
              : Border.all(color: AppColors.track, width: 1.5),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: selected ? Colors.white : AppColors.text,
          ),
        ),
      ),
    );
  }
}

class _HistoryCardList extends StatelessWidget {
  final HistoryController controller;

  const _HistoryCardList({required this.controller});

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
          return _HistoryCard(
            card: card,
            tagLabel: controller.getTagLabel(status),
            tagColor: controller.getTagColor(status),
          );
        },
      );
    });
  }
}

class _HistoryCard extends StatelessWidget {
  final FlashCard card;
  final String tagLabel;
  final Color tagColor;

  const _HistoryCard({
    required this.card,
    required this.tagLabel,
    required this.tagColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x143C5A50),
            blurRadius: 24,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  card.question,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  card.answer,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: tagColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              tagLabel,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: AppColors.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
