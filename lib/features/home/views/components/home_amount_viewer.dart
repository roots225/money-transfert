import 'package:flutter/material.dart';

import '../../../../app_colors.dart';

class HomeTotalAmountViewer extends StatelessWidget {
  const HomeTotalAmountViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'FCFA 500 000',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            'Total de vos transactions',
            style: TextStyle(
              color: AppColors.white.withAlpha(120),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
