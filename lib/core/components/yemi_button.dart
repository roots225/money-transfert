import 'package:flutter/material.dart';

import '../../app_colors.dart';

class YemiButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  const YemiButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.success,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      onPressed: () => onPressed,
      child: Text(
        title,
        style: const TextStyle(color: AppColors.black),
      ),
    );
  }
}
