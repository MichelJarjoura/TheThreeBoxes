import 'package:flutter/material.dart';
import 'package:sharpen/Models/box-model.dart';
import 'package:sharpen/constants.dart';
import 'package:sharpen/widgets/add_card.dart';
import 'package:sharpen/widgets/box_card.dart';
import 'package:sharpen/widgets/start_card.dart';
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
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20,vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(formattedDate3),
                  Text("Hello Kinan",
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                  ),
                  ),

                  SizedBox(height:20),

                  StartCard(),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text("your boxes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight(500),
                    ),),
                  ),


                  for(BoxModel box in boxes)
                    Padding(
                      padding: EdgeInsetsGeometry.directional(bottom: 20),
                      child: BoxCard(box: box),
                    ),


                  SizedBox(height:25),

                  AddCard()
                  
                ],
              ),
            ),
        ),
      ),

    );
  }
}




