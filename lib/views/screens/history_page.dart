import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_boxes/controllers/history_controller.dart';
import 'package:three_boxes/core/theme/app_colors.dart';
import 'package:three_boxes/views/widgets/history/filter_chip_list.dart';
import '../widgets/history/history_card_list.dart';
import '../widgets/history/history_header.dart';

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
            HistoryHeader(controller: controller),
            const SizedBox(height: 18),
            FilterChipList(controller: controller),
            const SizedBox(height: 18),
            Expanded(
              child: HistoryCardList(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}



