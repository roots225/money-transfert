import 'package:flutter/material.dart';

import '../../../../app_colors.dart';

class ActionButton extends StatelessWidget {
  final double size;
  final IconData? icon;
  final String label;
  final Function onPressed;
  const ActionButton({
    super.key,
    this.size = 55,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      width: size,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => onPressed(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              fixedSize: Size(size, size),
              padding: const EdgeInsets.all(0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            child: Icon(
              icon ?? Icons.arrow_circle_right_sharp,
              color: Colors.black,
              size: size / 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
          )
        ],
      ),
    );
  }
}
