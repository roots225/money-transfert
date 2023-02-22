import 'package:flutter/material.dart';

import '../../app_colors.dart';

String? isRequired(String? value) {
  if (value == null || value.isEmpty) {
    return 'Veuillez renseigner ce champ !';
  }
  return null;
}

bool isEmail(String? value) {
  RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regex.hasMatch(value ?? "");
}

void customSnackbar(BuildContext context, String message, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? Colors.red.withAlpha(150),
      content: Text(
        message,
        style: const TextStyle(color: AppColors.white),
      ),
    ),
  );
}
