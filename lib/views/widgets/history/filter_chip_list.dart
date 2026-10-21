import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_boxes/views/widgets/history/filter_ship.dart';
import '../../../controllers/history_controller.dart';

class FilterChipList extends StatelessWidget {
  final HistoryController controller;

  const FilterChipList({required this.controller});

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
            return FilterChipWidget(
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