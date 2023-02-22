import 'package:app/app_colors.dart';
import 'package:flutter/material.dart';

void displayDialog(BuildContext context, Widget page,
    {barrierDismissible = false, Function? onCancel, Function? onComfirm}) {
  showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        content: page,
      );
    },
  );
}
