import 'package:app/common/components/yemi_app_bar.dart';
import 'package:app/common/utils/navigation_helper.dart';
import 'package:app/features/authentication/presentations/pages/login_screen.dart';
import 'package:app/features/home/views/pages/global_home_page.dart';
import 'package:app/features/wallet/data/models/wallet_model.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutx/flutx.dart';

import '../../../../common/theme/app_theme.dart';
import '../../../../common/utils/app_colors.dart';
import 'account_validation_page.dart';
import 'add_bank_wallet_page.dart';
import 'add_mobile_wallet_page.dart';
import 'add_visa_wallet_page.dart';

class AddWalletPage extends StatefulWidget {
  const AddWalletPage({Key? key}) : super(key: key);

  @override
  _AddWalletPageState createState() => _AddWalletPageState();
}

class _AddWalletPageState extends State<AddWalletPage> {
  late WalletModel wallet;
  late ThemeData theme;
  late CustomTheme customTheme;
  late Widget nextPage;

  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    wallet = WalletModel(
      name: 'Mobile monnaie',
      type: WalletType.mobile,
      code: 'mobile',
      userData: UserWalletData(),
    );
    nextPage = AddMobileWalletPage(wallet: wallet);
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
            "Ajouter un wallet",
            color: customTheme.homemadePrimary,
            fontWeight: 700,
          ),
          FxSpacing.height(60),
          Padding(
            padding: FxSpacing.horizontal(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: FormBuilderDropdown(
                    name: 'walletType',
                    initialValue: wallet.code,
                    dropdownColor: AppColors.black,
                    items: const [
                      DropdownMenuItem(
                          value: 'mobile', child: Text('Mobile monnaie')),
                      DropdownMenuItem(value: 'visa', child: Text('Visa')),
                      DropdownMenuItem(value: 'bank', child: Text('Banque'))
                    ],
                    decoration: InputDecoration(
                      labelText: 'Type de wallet',
                      hintText: "",
                      border: theme.inputDecorationTheme.border,
                      enabledBorder: theme.inputDecorationTheme.border,
                      focusedBorder: theme.inputDecorationTheme.focusedBorder,
                      prefixIcon: const Icon(
                        FeatherIcons.creditCard,
                        size: 24,
                      ),
                    ),
                    onChanged: (v) {
                      setState(() {
                        wallet.code = v ?? '';
                        switch (v) {
                          case 'mobile':
                            nextPage = AddMobileWalletPage(wallet: wallet);
                            wallet.type = WalletType.mobile;
                            wallet.name = 'Mobile monnaie';
                            break;
                          case 'visa':
                            nextPage = AddVisaWalletPage(wallet: wallet);
                            wallet.type = WalletType.visa;
                            wallet.name = 'Carte Visa';
                            break;
                          case 'bank':
                            nextPage = AddBankWalletPage(wallet: wallet);
                            wallet.type = WalletType.bank;
                            wallet.name = 'Banque';
                            break;
                          default:
                        }
                      });
                    },
                  ),
                ),
                FxSpacing.height(24),
                FxButton.block(
                  elevation: 0,
                  borderRadiusAll: 8,
                  onPressed: () {
                    pushNavigation(context, nextPage);
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
          ),
        ],
      ),
    );
  }
}
