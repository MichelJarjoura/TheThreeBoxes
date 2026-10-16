import 'dart:ui';
import 'package:sharpen/constants.dart';

class BoxModel {
  final int id;
  final String title;
  final Color color;
  final String description;

  BoxModel(this.id, this.title, this.color, this.description);

  String get number => id.toString();
}

List<BoxModel> boxes = [
  BoxModel(1, "Box 1 - New & tricky", AppColors.box1, "Review everyDay"),
  BoxModel(2, "Box 2 - Getting there", AppColors.box2, "Review 2-3 times a week"),
  BoxModel(3, "Box 3 - Mastered", AppColors.box3, "Review once a week"),
];
