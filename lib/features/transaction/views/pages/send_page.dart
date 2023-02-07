import 'package:flutter/material.dart';

import '../../../../app_colors.dart';

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
            child: Column(
              children: [
                Row(
                  children: [],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
