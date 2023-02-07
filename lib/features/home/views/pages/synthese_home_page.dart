import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../app_colors.dart';
import '../../../../core/components/section_title.dart';
import '../../../../core/utils/navigation_helper.dart';
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

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/phone-gf8bb85b69_1280.jpg'),
            fit: BoxFit.fitHeight,
            opacity: 0.18,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.overlay)),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
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
                                fontSize: 14,
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
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(logoSize / 2)),
                        ),
                        child: Image.asset('assets/images/logo.png'),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const HomeTotalAmountViewer(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ActionButton(
                        icon: FeatherIcons.arrowUpRight,
                        label: "Envoyer",
                        onPressed: () {
                          showBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              elevation: 6,
                              constraints: BoxConstraints(
                                maxHeight:
                                    MediaQuery.of(context).size.height * 0.65,
                              ),
                              builder: (context) {
                                return SendPage();
                              });
                        },
                      ),
                      ActionButton(
                        icon: FeatherIcons.arrowDownLeft,
                        label: "",
                        onPressed: () {},
                      ),
                      ActionButton(
                        icon: FeatherIcons.hash,
                        label: "Scanner",
                        onPressed: () {},
                      ),
                      ActionButton(
                        icon: FeatherIcons.plus,
                        label: "Ajouter",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  // const SizedBox(height: 15),
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
      ),
    );
  }
}
