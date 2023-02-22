import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../app_colors.dart';
import '../../../../common/components/section_title.dart';
import '../../../../common/utils/navigation_helper.dart';
import '../../../transaction/data/models/transaction_model.dart';
import '../../../transaction/views/components/transaction_card.dart';
import '../../../transaction/views/pages/send_page.dart';
import '../../../transaction/views/pages/transactions_page.dart';
import '../components/action_button.dart';
import '../components/home_amount_viewer.dart';

class SyntheseHomePage extends StatefulWidget {
  const SyntheseHomePage({super.key});

  @override
  State<SyntheseHomePage> createState() => _SyntheseHomePageState();
}

class _SyntheseHomePageState extends State<SyntheseHomePage> {
  double logoSize = 50;

  @override
  Widget build(BuildContext context) {
    List<TransactionModel> transactions = [];
    for (var i = 0; i < 10; i++) {
      transactions.add(TransactionModel(
        operator: 'Orange',
        amount: 10000,
        direction: 'debit',
      ));
    }
    List<Widget> transactionWidgets =
        transactions.map((item) => TransactionCard(transaction: item)).toList();

    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: logoSize,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ROOTS225',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Money Transfert',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: logoSize,
                      width: logoSize,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(logoSize / 2)),
                      ),
                      child: const Icon(FeatherIcons.bell),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                const HomeTotalAmountViewer(),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ActionButton(
                      icon: FeatherIcons.arrowUpRight,
                      label: "Envoyer",
                      onPressed: () {
                        pushPage(context, const SendPage());
                      },
                    ),
                    ActionButton(
                      icon: FeatherIcons.arrowDownLeft,
                      label: "Encaisser",
                      onPressed: () {},
                    ),
                    ActionButton(
                      icon: FeatherIcons.hash,
                      label: "Scanner",
                      onPressed: () {},
                    ),
                    ActionButton(
                      icon: FeatherIcons.plus,
                      label: "Services",
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SectionTitle(label: 'Transactions'),
                    TextButton(
                      onPressed: () {
                        pushPage(context, const TransactionPage());
                      },
                      child: const Text(
                        'Tout voir',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 11,
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [...transactionWidgets],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
