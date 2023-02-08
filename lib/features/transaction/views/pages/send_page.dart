import 'package:flutter/material.dart';

import '../../../../app_colors.dart';
import '../../../../core/components/yemi_button.dart';
import '../components/payment_method_action.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  double topRadius = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topRadius),
          topRight: Radius.circular(topRadius),
        ),
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    PaymentMethodAction(name: 'OM'),
                    PaymentMethodAction(name: 'Wave'),
                    PaymentMethodAction(name: 'Moov'),
                  ],
                ),
                const SizedBox(height: 15),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Céllulaire, e-mail ou username"),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                YemiButton(
                  title: 'CONTINUER',
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
