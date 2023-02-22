import 'package:app/common/components/yemi_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../app_colors.dart';
import '../../../../common/utils/navigation_helper.dart';
import '../../../home/views/pages/global_home_page.dart';
import '../../data/models/transaction_model.dart';

class TransactionSucceedPage extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionSucceedPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    double checkSize = 200;
    double checkChildSize = checkSize - 70;

    return Scaffold(
      backgroundColor: AppColors.succeedGreen,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      decoration: const BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 100),
                          const Text(
                            'Transfert réussi !',
                            style: TextStyle(fontSize: 35),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Fond transféré avec succès',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white.withAlpha(120)),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            decoration: BoxDecoration(
                              color: AppColors.white.withAlpha(80),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '1 000 000 FCFA',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Divider(
                                  thickness: 1.3,
                                  color: AppColors.white.withAlpha(100),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Destinataire',
                                          style: TextStyle(
                                              color: AppColors.white
                                                  .withAlpha(120)),
                                        ),
                                        Text('John doe'),
                                      ]),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          YemiButton(
                              onPressed: () {
                                popNavigation(context);
                              },
                              title: 'Terminer')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top:
                    MediaQuery.of(context).size.height * 0.25 - (checkSize / 2),
                width: MediaQuery.of(context).size.width - 20,
                child: Center(
                  child: Container(
                    height: checkSize,
                    width: checkSize,
                    decoration: BoxDecoration(
                      color: AppColors.succeedGreen.withAlpha(80),
                      borderRadius:
                          BorderRadius.all(Radius.circular(checkSize / 2)),
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      height: checkChildSize,
                      width: checkChildSize,
                      decoration: BoxDecoration(
                        color: AppColors.succeedGreen.withAlpha(120),
                        borderRadius: BorderRadius.all(
                            Radius.circular(checkChildSize / 2)),
                      ),
                      child: const Center(
                        child: Icon(FeatherIcons.check, size: 70),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
