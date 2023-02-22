import 'package:app/common/utils/navigation_helper.dart';
import 'package:app/features/authentication/presentations/pages/login_screen.dart';
import 'package:app/features/home/views/pages/global_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../../../../common/theme/app_theme.dart';
import 'add_wallet_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: FxSpacing.fromLTRB(24, 44, 24, 0),
        children: [
          FxText.displaySmall(
            "Bonjour !\nS'inscrire pour commencer",
            color: customTheme.homemadePrimary,
            fontWeight: 700,
          ),
          FxSpacing.height(60),
          Padding(
            padding: FxSpacing.horizontal(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxTextField(
                  labelText: 'Adresse e-mail',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  autoFocusedBorder: true,
                  textFieldStyle: FxTextFieldStyle.outlined,
                  textFieldType: FxTextFieldType.email,
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
                  labelText: 'Numéro de téléphone',
                ),
                FxSpacing.height(32),
                FxTextField(
                  labelText: "Nom d'utilisateur",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  autoFocusedBorder: true,
                  textFieldStyle: FxTextFieldStyle.outlined,
                  textFieldType: FxTextFieldType.name,
                  suffixIconColor: customTheme.homemadePrimary,
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
                    pushNavigation(context, const AddWalletPage());
                  },
                  backgroundColor: customTheme.homemadePrimary,
                  child: FxText.titleMedium(
                    "S'INSCRIRE",
                    fontWeight: 700,
                    color: Colors.black,
                    letterSpacing: 0.4,
                  ),
                ),
                FxSpacing.height(16),
                Center(
                  child: FxButton.text(
                    onPressed: () {
                      pushNavigation(context, const LogInScreen());
                    },
                    splashColor: customTheme.homemadePrimary.withAlpha(40),
                    child: FxText.bodySmall("J'ai déjà un compte",
                        decoration: TextDecoration.underline,
                        color: customTheme.homemadePrimary),
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
