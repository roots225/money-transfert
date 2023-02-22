import 'package:flutter/material.dart';

import '../../app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String label;
  final Color? titleColor;
  const SectionTitle({super.key, required this.label, this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          color: titleColor ?? AppColors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
