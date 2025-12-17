import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.goldColor,
        foregroundColor: AppColors.darkBlueColor,
        overlayColor: Colors.transparent,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
      onPressed: onPressed,
      child: const Center(
        child: Text("Enter user", textAlign: TextAlign.center),
      ),
    );
  }
}
