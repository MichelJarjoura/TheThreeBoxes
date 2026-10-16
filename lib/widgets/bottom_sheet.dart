import 'package:flutter/material.dart';
import 'package:sharpen/widgets/primary_button.dart';
import '../constants.dart';

class AddCardBottomSheet extends StatelessWidget {
  const AddCardBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min ,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Row(
                children: [Text("New Card",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
                  Spacer(),
                  TextButton(
                      onPressed: (){Navigator.pop(context);},
                      child:Text("Cancel",
                        style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 15
                        ),) )
                ],
              ),
                Padding(
                  padding: const EdgeInsetsGeometry.directional(top: 20,bottom: 10),
                  child: Text("Question",
                  style: TextStyle(
                    fontSize: 15
                  )
                          ),
                )
                ,
                TextField(
                  maxLines:5,
                  minLines:3,
                  decoration: InputDecoration(
      
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "type the question you want to recall",
                  ),
                ),
      
                Padding(
                  padding: const EdgeInsetsGeometry.directional(top: 20,bottom: 10),
                  child: Text("Answer",
                      style: TextStyle(
                          fontSize: 15
                      )
                  ),
                ),
      
                TextField(
      
                  minLines: 3,
                  maxLines: 5,
      
      
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    hintText: "type the answer you want to recall",
      
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40
                  ),
                  child: PrimaryButton(
                     onPressed:(){}
                  ,text: "save card"),
                )
      
      
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}
