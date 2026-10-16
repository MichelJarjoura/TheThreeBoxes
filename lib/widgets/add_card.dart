import 'package:flutter/material.dart';

import '../constants.dart';
import 'bottom_sheet.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(onPressed: (){_displayBottomSheet(context);},
        style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            padding: EdgeInsets.all(18),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            side: BorderSide(
                color: AppColors.primary
            )
        ),
        child: Text("+ Add cards",),),
    );
  }
}


//----function----

Future _displayBottomSheet(BuildContext context) async {
  return showModalBottomSheet(
    enableDrag: true,
    isScrollControlled: true,
    showDragHandle: true,

      context: context,
      builder: (context) => AddCardBottomSheet()
  );
}