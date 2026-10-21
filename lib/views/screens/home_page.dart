import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:three_boxes/Models/box-model.dart';
import 'package:three_boxes/core/theme/app_colors.dart';
import 'package:three_boxes/routes/app_routes.dart';
import 'package:three_boxes/views/widgets/add_card.dart';
import 'package:three_boxes/views/widgets/box_card.dart';
import 'package:three_boxes/views/widgets/start_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate3 = DateFormat('MMMM dd, yyyy').format(now);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(formattedDate3),
                        Text(
                          "Hello Kinan",
                          style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => Get.toNamed(AppRoutes.history),
                      icon: const Icon(Icons.history_rounded, size: 26),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.surface,
                        foregroundColor: AppColors.text,
                        padding: const EdgeInsets.all(12),
                      ),
                      tooltip: 'History',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const StartCard(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: const Text(
                    "your boxes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                for (BoxModel box in boxes)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: BoxCard(box: box),
                  ),
                const SizedBox(height: 25),
                const AddCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
