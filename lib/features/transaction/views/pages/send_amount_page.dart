import 'package:app/common/components/yemi_app_bar.dart';
import 'package:app/common/utils/navigation_helper.dart';
import 'package:app/features/transaction/data/models/transaction_model.dart';
import 'package:flutter/material.dart';

import '../../../../app_colors.dart';
import 'transaction_succeed_page.dart';

class SendAmountPage extends StatefulWidget {
  const SendAmountPage({super.key});

  @override
  State<SendAmountPage> createState() => _SendAmountPageState();
}

class _SendAmountPageState extends State<SendAmountPage> {
  String? enterAmount = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YemiAppBar(
        title: 'Orange Money',
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Column(
                children: [
                  Text(
                    'A:',
                    style: TextStyle(color: AppColors.white.withAlpha(180)),
                  ),
                  const Text('0777887766'),
                  const SizedBox(height: 20),
                  Material(
                    color: AppColors.white.withAlpha(20),
                    child: Form(
                      child: TextFormField(
                        initialValue: enterAmount,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontSize: 25),
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: '0',
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 8),
                          focusedBorder: InputBorder.none,
                          focusColor: AppColors.white,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 3),
                            child: Text(
                              'FCFA',
                              style: TextStyle(
                                color: AppColors.white.withAlpha(180),
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        onChanged: (v) {
                          setState(() {
                            enterAmount = v;
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Veuillez renseigner ce champ';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Frais de la transaction',
                        style: TextStyle(color: AppColors.white.withAlpha(180)),
                      ),
                      Text("${enterAmount ?? 0} FCFA"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Montant total à payer',
                        style: TextStyle(
                            color: AppColors.white.withAlpha(200),
                            fontSize: 14),
                      ),
                      Text(
                        "${enterAmount ?? 0} FCFA",
                        style: TextStyle(
                            color: AppColors.white.withAlpha(200),
                            fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      pushAndRemoveAll(
                        context,
                        const TransactionSucceedPage(
                          transaction: TransactionModel(
                              amount: 1000,
                              operator: 'orange',
                              direction: 'debit'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Confirmer',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
