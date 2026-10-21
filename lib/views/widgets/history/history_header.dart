import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/history_controller.dart';
import '../../../core/theme/app_colors.dart';

class HistoryHeader extends StatelessWidget {
  final HistoryController controller;

  const HistoryHeader({required this.controller});

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