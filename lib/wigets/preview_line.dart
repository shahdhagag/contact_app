import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class PreviewLine extends StatelessWidget {
  final String text;

  const PreviewLine({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.goldColor,
          ),
        ),
        Container(width: 190, height: 1.25, color: AppColors.goldColor),
      ],
    );
  }
}
