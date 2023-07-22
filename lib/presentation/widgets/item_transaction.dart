import 'package:flutter/material.dart';
import 'package:flutter_ngirit/domain/transaction_domain.dart';

import '../misc/app_colors.dart';
import '../misc/app_strings.dart';
import '../misc/app_styles.dart';

class ItemTransaction extends StatelessWidget {
  const ItemTransaction({super.key, required this.transaction});

  final TransactionDomain transaction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          '${AppStrings.imagePath}img_transaction.png',
          height: 35,
          width: 34,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.category,
              style: textStyleW700S16,
            ),
            Text(
              transaction.date,
              style: textStyleW400S12.copyWith(
                color: lightGray,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          'Rp ${transaction.amount}',
          style: textStyleW700S16.copyWith(
            color: lightGreen,
          ),
        ),
      ],
    );
  }
}
