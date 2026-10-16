import 'package:flutter/material.dart';
import 'package:sharpen/widgets/primary_button.dart';
import '../constants.dart';

class StartCard extends StatelessWidget {



  const StartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("TODAY",style: TextStyle(
                  color: AppColors.primary
              ),),
              SizedBox(height: 7,),
              Text("12 cards to review",style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              )),
              SizedBox(height: 7,),
              Text("About 6 minutes ",
                style: TextStyle(
                    color: AppColors.textMuted
                ),),
              SizedBox(height: 20,),

              PrimaryButton(
                  onPressed: (){}
              ,text: "Start review"),

            ],
          ),
        ),
      ),

    );
  }
}
