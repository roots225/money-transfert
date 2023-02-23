import 'package:app/features/home/views/pages/global_home_page.dart';
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
            "Reference",
            color: customTheme.homemadePrimary,
            fontWeight: 700,
          ),
          FxSpacing.height(60),
          Text(wallet.type.name),
          Text('resumé'),
          FxSpacing.height(24),
          FxButton.block(
            elevation: 0,
            borderRadiusAll: 8,
            onPressed: () {
              pushNavigation(context, const GlobalHomePage());
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
