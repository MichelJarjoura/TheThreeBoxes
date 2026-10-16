import 'dart:ui';
import 'package:sharpen/Models/flash_card.dart';
import 'package:sharpen/constants.dart';

class BoxModel{
  final String number;
  final String title;
  final Color color;
  final String description;
  final List<FlashCard> flashCards;

  BoxModel(this.number,this.title,this.color,this.description,this.flashCards);
}


List<BoxModel> boxes = [
  BoxModel("1","Box 1 - New & tricky",AppColors.box1,"Review everyDay",[
    FlashCard("Are you gay1 ?", "yes"),
    FlashCard("Are you gay2 ?", "yes"),
    FlashCard("Are you gay3 ?", "yes"),
    FlashCard("Are you gay4 ?", "yes"),
    FlashCard("Are you gay5 ?", "yes"),
  ]),
  BoxModel("2","Box 2 - Getting there",AppColors.box2,"Review 2-3 times a week",[]),
  BoxModel("3","Box 3 - Mastered",AppColors.box3,"Review once a week",[]),
];