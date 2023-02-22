// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// import '../../../../common/colors/app_colors.dart';
// import '../../../../common/components/alerts/app_snackbar.dart';
// import '../../../../common/components/buttons/rounded_button.dart';
// import '../../../../common/components/utils/loading.dart';
// import '../../../../common/utils/inputs_utils.dart';
// import '../../../../common/utils/navigation_helper.dart';
// import '../../../../common/utils/validators.dart';
// import '../../../home/presentations/pages/GlobalHomePage.dart';
// import '../providers/authentication_provider.dart';
// import '../widgets/auth_state.dart';
// import '../widgets/authentication_card.dart';

// class ForgotPasswordPage extends StatefulWidget {
//   const ForgotPasswordPage({super.key});

//   @override
//   State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
// }

// class _ForgotPasswordPageState extends AuthState<ForgotPasswordPage> {
//   TextEditingController emailController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void onPasswordRecovery(Session session) {
//     if (mounted) {
//       context
//           .read<AuthenticationProvider>()
//           .establishedResetPassword(session)
//           .then((_) {
//         if (context
//             .read<AuthenticationProvider>()
//             .userPreferences
//             .isUserLoggedIn()) {
//           pushAndRemoveAll(context, const GlobalHomePage());
//         } else {
//           AppSnackbar.error(context, 'Erreur lors de la connexion.');
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AuthenticationCard(
//       title: 'Mot de passe oublié ?',
//       titleHeight: MediaQuery.of(context).size.height * 0.45,
//       child: Consumer<AuthenticationProvider>(builder: (_, authProvider, __) {
//         return Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 decoration: defaultDecoration('Email'),
//                 controller: emailController,
//                 validator: (value) => isRequired(value),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: 150,
//                 child: authProvider.loadingState ==
//                         AuthenticationLoadingState.resetingPassword
//                     ? const Loading()
//                     : AuthenticationButton(
//                         title: "Continuer",
//                         backgroundColor: AppColors.primaryColor,
//                         onPressed: () async {
//                           if (!_formKey.currentState!.validate()) {
//                             AppSnackbar.error(context, "L'email est requis");
//                             return;
//                           }

//                           await authProvider
//                               .attemptResetPassword(emailController.text);

//                           if (authProvider.error != null) {
//                             AppSnackbar.error(
//                                 context,
//                                 authProvider.error?.message ??
//                                     'Aucun compte associé à cet email.');
//                             return;
//                           }

//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AlertDialog(
//                                 title: const Text("Confirmation inscription"),
//                                 content: const Text(
//                                     "Nous vous avons envoyé un email contenant un lien magique de connexion. Veuillez cliquez sur le lien se trouvant dans le email avec mon téléphone."),
//                                 actions: [
//                                   TextButton(
//                                     child: const Text("OK"),
//                                     onPressed: () {
//                                       popNavigation(context);
//                                     },
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         },
//                       ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
