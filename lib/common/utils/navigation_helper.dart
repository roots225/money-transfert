import 'package:flutter/material.dart';

void pushPage(BuildContext context, Widget to) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => to),
  );
}

void pushReplacementPage(BuildContext context, Widget to) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => to),
  );
}

void pushReplacementAll(BuildContext context, Widget to) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => to),
    ModalRoute.withName('/'),
  );
}

void popNavigation(BuildContext context) {
  Navigator.of(context).pop();
}
