// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../../common/colors/app_colors.dart';
// import '../../../../common/components/buttons/rounded_button.dart';
// import '../../../../common/utils/inputs_utils.dart';
// import '../../../../common/utils/validators.dart';
// import '../widgets/authentication_card.dart';
// import 'athentication_succeed_page.dart';

// class ProfileSummaryValidationPage extends StatefulWidget {
//   final UserModel user;
//   const ProfileSummaryValidationPage({super.key, required this.user});

//   @override
//   State<ProfileSummaryValidationPage> createState() =>
//       _ProfileSummaryValidationPageState();
// }

// class _ProfileSummaryValidationPageState
//     extends State<ProfileSummaryValidationPage> {
//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController lastnameController;
//   late TextEditingController firstnameController;
//   late TextEditingController addressController;
//   late TextEditingController emailController;
//   late TextEditingController phoneController;

//   @override
//   void initState() {
//     super.initState();

//     lastnameController = TextEditingController(text: widget.user.lastName);
//     firstnameController = TextEditingController(text: widget.user.firstName);
//     addressController = TextEditingController(text: widget.user.address);
//     emailController = TextEditingController(text: widget.user.email);
//     phoneController = TextEditingController(text: widget.user.phone);
//   }

//   @override
//   void dispose() {
//     lastnameController.dispose();
//     firstnameController.dispose();
//     addressController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AuthenticationCard(
//       centerContent: false,
//       title: 'Validation du profile',
//       titleHeight: MediaQuery.of(context).size.height * 0.35,
//       child: Consumer<AuthenticationProvider>(builder: (_, authProvider, __) {
//         return Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Veuillez vérifier vos informations.',
//                 style: TextStyle(
//                   color: AppColors.primaryColor,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 16,
//                 ),
//               ),
//               TextFormField(
//                 controller: lastnameController,
//                 decoration: defaultDecoration('Nom'),
//                 validator: (value) => isRequired(value),
//               ),
//               TextFormField(
//                 controller: firstnameController,
//                 decoration: defaultDecoration('Prénoms'),
//                 validator: (value) => isRequired(value),
//               ),
//               TextFormField(
//                 controller: addressController,
//                 decoration: defaultDecoration('Adresse'),
//               ),
//               TextFormField(
//                 controller: emailController,
//                 decoration: defaultDecoration('Email'),
//               ),
//               TextFormField(
//                 controller: phoneController,
//                 decoration: defaultDecoration('Téléphone'),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: 150,
//                 child: authProvider.loadingState ==
//                         AuthenticationLoadingState.userProfile
//                     ? const Loading()
//                     : AuthenticationButton(
//                         title: "Terminer",
//                         backgroundColor: AppColors.primaryColor,
//                         onPressed: () async {
//                           if (!_formKey.currentState!.validate()) {
//                             AppSnackbar.error(context,
//                                 "Veuillez renseigner tous les champs obligatoire.");
//                             return;
//                           }
//                           UserModel params = UserModel(
//                             userId: widget.user.id,
//                             role: widget.user.role,
//                             firstName: firstnameController.text.trim(),
//                             lastName: lastnameController.text.trim(),
//                             address: addressController.text,
//                             email: isEmail(emailController.text.trim())
//                                 ? emailController.text.trim()
//                                 : null,
//                             phone: !isEmail(emailController.text.trim())
//                                 ? emailController.text.trim()
//                                 : null,
//                           );
//                           await authProvider.createUserProfile(params);

//                           if (authProvider.error != null) {
//                             AppSnackbar.error(
//                                 context, authProvider.error?.message ?? '');
//                             return;
//                           }

//                           pushReplacement(
//                               context, const AuthenticationSucceedPage());
//                         },
//                       ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
