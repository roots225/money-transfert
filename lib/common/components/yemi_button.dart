import 'package:flutter/material.dart';

import '../../app_colors.dart';

class YemiButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color? labelColor;
  final Color? backgroundColor;
  const YemiButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.labelColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(100, 35),
        backgroundColor: backgroundColor ?? AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(
        title,
        style: TextStyle(color: labelColor ?? AppColors.black),
      ),
    );
  }
}
