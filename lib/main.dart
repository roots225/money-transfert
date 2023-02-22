import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_colors.dart';
import 'common/theme/app_theme.dart';
import 'features/authentication/data/models/user_preferences.dart';
import 'features/authentication/presentations/pages/login_screen.dart';
import 'features/authentication/presentations/pages/register_page.dart';
import 'features/authentication/presentations/providers/authentication_provider.dart';
import 'features/home/views/pages/global_home_page.dart';
import 'features/transaction/views/pages/transactions_page.dart';

import "dependency_injection.dart" as di;
import 'profile/presentations/providers/profile_provider.dart';

void main() async {
  // Needs to be called so that we can await for EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  // Dependencies injections
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthenticationProvider(
              loginUsecase: di.sl(), userPreferences: di.sl()),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(
            preferences: di.sl(),
            fetchUserUsecase: di.sl(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.black,
          fontFamily: GoogleFonts.lato().fontFamily,
          textTheme: const TextTheme(
            headline1: TextStyle(color: Colors.white),
            headline2: TextStyle(color: Colors.white),
            headline3: TextStyle(color: Colors.white),
            headline4: TextStyle(color: Colors.white),
            headline5: TextStyle(color: Colors.white),
            headline6: TextStyle(color: Colors.white),
            subtitle1: TextStyle(color: Colors.white),
            subtitle2: TextStyle(color: Colors.white),
            caption: TextStyle(color: Colors.white),
            overline: TextStyle(color: Colors.white),
            bodyText1: TextStyle(fontSize: 14.0, color: Colors.white),
            bodyText2: TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          scaffoldBackgroundColor: AppColors.black.withOpacity(0.7),
          colorScheme: AppColors.darkScheme,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => _getHomePage(),
          '/transactions': (_) => const TransactionPage()
        },
      ),
    );
  }

  Widget _getHomePage() {
    // Get user custom local settings
    UserPreferences preference = UserPreferences(
      sharedPreferences: di.sl<SharedPreferences>(),
    );

    if (preference.isUserLoggedIn()) {
      return const GlobalHomePage();
    } else {
      return const RegisterPage();
    }
  }
}
