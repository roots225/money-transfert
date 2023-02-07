import 'package:flutter/material.dart';

import '../../app_colors.dart';

class SectionTitle extends StatelessWidget {
  final String label;
  const SectionTitle({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          color: AppColors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
