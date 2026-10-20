import 'package:flutter/material.dart';

import 'package:three_boxes/Models/box-model.dart';
import 'package:three_boxes/core/theme/app_colors.dart';
import 'package:three_boxes/views/widgets/add_card.dart';
import 'package:three_boxes/views/widgets/box_card.dart';
import 'package:three_boxes/views/widgets/start_card.dart';
import 'package:intl/intl.dart';

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
                Text(formattedDate3),
                Text(
                  "Hello Kinan",
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const StartCard(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "your boxes",
                    style: const TextStyle(
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
