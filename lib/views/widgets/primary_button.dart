import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: getForegroundColor(text),
          backgroundColor: getBackgroundColor(text),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            height: 3,
          ),
        ),
      ),
    );
  }
}

Color getForegroundColor(String text) {
  if (text == "Not yet") {
    return AppColors.box1Text;
  }
  return AppColors.surface;
}

Color getBackgroundColor(String text) {
  if (text == "Not yet") {
    return AppColors.box1;
  }
  return AppColors.primary;
}
