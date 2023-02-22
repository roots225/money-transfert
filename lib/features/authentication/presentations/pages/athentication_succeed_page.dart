// import 'package:easy_life_mobile/core/components/buttons/rounded_button.dart';
// import 'package:easy_life_mobile/core/utils/navigation_helper.dart';
// import 'package:easy_life_mobile/features/home/presentations/pages/GlobalHomePage.dart';
// import 'package:flutter/material.dart';

// import '../../../../common/colors/app_colors.dart';
// import '../../../../common/colors/app_radius.dart';

// class AuthenticationSucceedPage extends StatelessWidget {
//   const AuthenticationSucceedPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       bottom: false,
//       child: Scaffold(
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//             color: AppColors.primaryColor,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Bravo !'.toUpperCase(),
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 60,
//                 ),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.7,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:
//                       BorderRadius.circular(AppRadius.primaryRadius / 2),
//                 ),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                 margin: const EdgeInsets.symmetric(vertical: 40),
//                 child: Wrap(
//                   children: const [
//                     Text(
//                       'Vous etes maintenant membre de la communauté PHARMA24, nous espérons que vous vous plairez ici.',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 16),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: 170,
//                 child: AuthenticationButton(
//                   backgroundColor: Colors.white,
//                   color: Colors.black,
//                   title: 'Commencer',
//                   onPressed: () {
//                     pushAndRemoveAll(context, const GlobalHomePage());
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
