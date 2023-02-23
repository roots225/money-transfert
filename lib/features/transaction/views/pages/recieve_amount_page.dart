import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../../../../common/theme/app_theme.dart';

class RecieveAmountPage extends StatefulWidget {
  const RecieveAmountPage({super.key});

  @override
  State<RecieveAmountPage> createState() => _RecieveAmountPageState();
}

class _RecieveAmountPageState extends State<RecieveAmountPage> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Lien'),
            Text('Lien'),
            FxSpacing.height(24),
            FxButton.block(
              elevation: 0,
              borderRadiusAll: 8,
              onPressed: () {
                // pushNavigation(context, AccountValidationPage(wallet: wallet));
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
    );
  }
}
