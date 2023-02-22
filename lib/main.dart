import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'features/home/views/pages/global_home_page.dart';
import 'features/transaction/views/pages/transactions_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.black,
        fontFamily: GoogleFonts.lato().fontFamily,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 14.0),
          bodyText2: TextStyle(fontSize: 12.0),
        ),
        scaffoldBackgroundColor: AppColors.black.withOpacity(0.7),
        colorScheme: AppColors.darkScheme,
      ),
      home: const GlobalHomePage(),
      routes: {'/transactions': (context) => const TransactionPage()},
    );
  }
}
