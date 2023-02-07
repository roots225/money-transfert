import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../app_colors.dart';
import '../../domains/entities/Transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  const TransactionCard({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    Color applyColor =
        transaction.direction == "credit" ? AppColors.success : AppColors.error;
    return Card(
      color: const Color(0xFF3f3e45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        minVerticalPadding: 0,
        onTap: () {
          /// TODO: Go to detail page
        },
        title: const Text(
          '0799887766',
          style: TextStyle(color: AppColors.white),
        ),
        subtitle: const Text(
          'John Doe',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 11,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              transaction.price,
              style: TextStyle(
                color: applyColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    transaction.operator,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    transaction.direction == "credit"
                        ? FeatherIcons.arrowDown
                        : FeatherIcons.arrowUp,
                    size: 15,
                    color: applyColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
