import 'package:app/common/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:provider/provider.dart';

import '../../../../common/theme/app_theme.dart';
import '../../../../common/utils/navigation_helper.dart';
import '../../../../common/utils/validators.dart';
import '../../../home/views/pages/global_home_page.dart';
import '../../domain/usecases/login_usecase.dart';
import '../providers/authentication_provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    emailController.text = '';
    passwordController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 44, 24, 0),
        children: [
          FxSpacing.height(80),
          Center(
            child: Container(
              width: 200,
              height: 100,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          Center(
              child: FxText.displaySmall(
            'Heureux de revoir',
            color: AppColors.white.withAlpha(200),
          )),
          Center(
              child: FxText.titleMedium(
            'Bienvenu sur votre application',
            color: AppColors.white.withAlpha(150),
          )),
          FxSpacing.height(40),
          Padding(
            padding: FxSpacing.horizontal(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxTextField(
                  controller: emailController,
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
                  controller: passwordController,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  autoFocusedBorder: true,
                  textFieldStyle: FxTextFieldStyle.outlined,
                  textFieldType: FxTextFieldType.mobileNumber,
                  suffixIconColor: customTheme.homemadePrimary,
                  filled: true,
                  fillColor: customTheme.homemadePrimary.withAlpha(50),
                  enabledBorderColor: customTheme.homemadePrimary,
                  focusedBorderColor: customTheme.homemadePrimary,
                  prefixIconColor: customTheme.homemadePrimary,
                  labelTextColor: customTheme.homemadePrimary,
                  cursorColor: customTheme.homemadePrimary,
                  labelText: 'Numéro de téléphone',
                ),
                FxSpacing.height(16),
                Align(
                  alignment: Alignment.centerRight,
                  child: FxButton.text(
                    onPressed: () {},
                    padding: FxSpacing.y(4),
                    splashColor: customTheme.homemadePrimary.withAlpha(40),
                    child: FxText.bodySmall("Mot de passe oublié?",
                        color: customTheme.homemadePrimary),
                  ),
                ),
                FxSpacing.height(16),
                SizedBox(
                  child: Consumer<AuthenticationProvider>(
                      builder: (_, authProvider, __) {
                    return SizedBox(
                      child: FxButton.block(
                        elevation: 0,
                        borderRadiusAll: 8,
                        onPressed: () async {
                          /// Validate email
                          if (isRequired(emailController.text) != null) {
                            customSnackbar(
                                context, "Veuillez renseigner l'email");
                            return;
                          }
                          if (!isEmail(emailController.text)) {
                            customSnackbar(
                                context, "Format de l'email est incorrect");
                            return;
                          }
                          if (isRequired(passwordController.text) != null) {
                            customSnackbar(
                                context, "Veuillez renseigner un mot de passe");
                            return;
                          }
                          LoginParams params = LoginParams(
                              email: emailController.text,
                              password: passwordController.text);
                          await authProvider.processSignin(params);

                          if (authProvider.loadingState ==
                              AuthenticationLoadingState.loginFailed) {
                            customSnackbar(
                                context, "Email ou mot de passe incorrect!");
                            return;
                          }

                          pushNavigation(context, const GlobalHomePage());
                        },
                        // backgroundColor: customTheme.homemadePrimary,
                        child: const Text(
                          "Se connecter",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            // color: customTheme.homemadeOnPrimary,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                FxSpacing.height(16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
