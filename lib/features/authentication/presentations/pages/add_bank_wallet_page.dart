import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../../../../common/components/yemi_app_bar.dart';
import '../../../../common/theme/app_theme.dart';
import '../../../../common/utils/navigation_helper.dart';
import '../../../wallet/data/models/wallet_model.dart';
import 'account_validation_page.dart';

class AddBankWalletPage extends StatefulWidget {
  final WalletModel wallet;
  const AddBankWalletPage({super.key, required this.wallet});

  @override
  State<AddBankWalletPage> createState() => _AddBankWalletPageState();
}

class _AddBankWalletPageState extends State<AddBankWalletPage> {
  WalletModel get wallet => widget.wallet;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YemiAppBar(
        title: 'Inscription',
      ),
      body: ListView(
        padding: FxSpacing.fromLTRB(24, 44, 24, 0),
        children: [
          FxText.titleLarge(
            wallet.name,
            color: customTheme.homemadePrimary,
            fontWeight: 700,
          ),
          FxSpacing.height(60),
          FxTextField(
            labelText: 'Nom de la bank',
            floatingLabelBehavior: FloatingLabelBehavior.never,
            autoFocusedBorder: true,
            textFieldStyle: FxTextFieldStyle.outlined,
            textFieldType: FxTextFieldType.name,
            filled: true,
            fillColor: customTheme.homemadePrimary.withAlpha(50),
            enabledBorderColor: customTheme.homemadePrimary,
            focusedBorderColor: customTheme.homemadePrimary,
            prefixIconColor: customTheme.homemadePrimary,
            labelTextColor: customTheme.homemadePrimary,
            cursorColor: customTheme.homemadePrimary,
          ),
          FxSpacing.height(24),
          FxTextField(
            labelText: "Numéro de compte",
            floatingLabelBehavior: FloatingLabelBehavior.never,
            autoFocusedBorder: true,
            textFieldStyle: FxTextFieldStyle.outlined,
            textFieldType: FxTextFieldType.mobileNumber,
            filled: true,
            fillColor: customTheme.homemadePrimary.withAlpha(50),
            enabledBorderColor: customTheme.homemadePrimary,
            focusedBorderColor: customTheme.homemadePrimary,
            prefixIconColor: customTheme.homemadePrimary,
            labelTextColor: customTheme.homemadePrimary,
            cursorColor: customTheme.homemadePrimary,
          ),
          FxSpacing.height(24),
          FxButton.block(
            elevation: 0,
            borderRadiusAll: 8,
            onPressed: () {
              pushNavigation(context, AccountValidationPage(wallet: wallet));
            },
            backgroundColor: customTheme.homemadePrimary,
            child: FxText.titleMedium(
              "Suivant",
              fontWeight: 700,
              color: Colors.black,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}
