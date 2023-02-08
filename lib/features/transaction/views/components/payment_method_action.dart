import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../app_colors.dart';

class PaymentMethodAction extends StatefulWidget {
  final String name;
  const PaymentMethodAction({super.key, required this.name});

  @override
  State<PaymentMethodAction> createState() => _PaymentMethodActionState();
}

class _PaymentMethodActionState extends State<PaymentMethodAction> {
  String get name => widget.name;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Center(
          child: Text(name, style: const TextStyle(color: AppColors.white))),
    );
  }
}
