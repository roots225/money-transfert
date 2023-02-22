import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../app_colors.dart';

class PaymentMethodAction extends StatelessWidget {
  final String name;
  final String? description;
  final Function onPressed;
  final Widget? icon;
  const PaymentMethodAction(
      {super.key,
      required this.name,
      this.description,
      required this.onPressed,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom:
                BorderSide(width: 1, color: AppColors.white.withAlpha(100))),
      ),
      child: ListTile(
        onTap: () {
          onPressed();
        },
        leading: SizedBox(width: 70, height: 70, child: icon),
        title: Text(name, style: const TextStyle(color: AppColors.white)),
        subtitle: Text(description ?? "Envoyer de l'argent",
            style: const TextStyle(color: AppColors.white)),
        trailing: const Icon(FeatherIcons.arrowRight),
      ),
    );
  }
}
