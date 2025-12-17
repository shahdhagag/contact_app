import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.label, required this.controller});

  final String label;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: AppColors.goldColor),
      controller: controller,
      cursorColor: AppColors.goldColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2, color: AppColors.goldColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2, color: AppColors.goldColor),
        ),
        hintText: label,
        hintStyle: TextStyle(color: AppColors.lightBlueColor, fontSize: 16),
      ),
    );
  }
}
