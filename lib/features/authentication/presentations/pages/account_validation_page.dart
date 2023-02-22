import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutx/flutx.dart';

import '../../../../common/components/yemi_app_bar.dart';
import '../../../../common/theme/app_theme.dart';
import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/navigation_helper.dart';
import '../../../wallet/data/models/wallet_model.dart';

class AccountValidationPage extends StatefulWidget {
  final WalletModel wallet;
  const AccountValidationPage({super.key, required this.wallet});

  @override
  State<AccountValidationPage> createState() => _AccountValidationPageState();
}

class _AccountValidationPageState extends State<AccountValidationPage> {
  String get name => widget.wallet.name;
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
            name,
            color: customTheme.homemadePrimary,
            fontWeight: 700,
          ),
          FxSpacing.height(60),
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: FormBuilderDropdown(
              name: 'mobileMoneyType',
              dropdownColor: AppColors.black,
              items: const [
                DropdownMenuItem(value: 'om', child: Text('Orange Money')),
                DropdownMenuItem(value: 'moov', child: Text('Moov Money')),
                DropdownMenuItem(value: 'mtn', child: Text('MTN Mobile Money')),
                DropdownMenuItem(value: 'wave', child: Text('Wave'))
              ],
              decoration: InputDecoration(
                labelText: 'Type de mobile money',
                hintText: "",
                border: theme.inputDecorationTheme.border,
                enabledBorder: theme.inputDecorationTheme.border,
                focusedBorder: theme.inputDecorationTheme.focusedBorder,
                prefixIcon: const Icon(
                  FeatherIcons.creditCard,
                  size: 24,
                ),
              ),
              onChanged: (v) {},
            ),
          ),
          FxSpacing.height(24),
          FxTextField(
            labelText: 'Numéro mobile money',
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
              final wallet = WalletModel(
                  name: 'Mobile monnaie',
                  type: WalletType.mobile,
                  code: 'mobile');
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
