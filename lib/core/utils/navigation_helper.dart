import 'package:flutter/material.dart';

void pushPage(BuildContext context, Widget to) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => to),
  );
}
