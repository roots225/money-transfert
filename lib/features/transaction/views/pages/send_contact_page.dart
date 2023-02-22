import 'package:app/common/components/section_title.dart';
import 'package:app/common/components/yemi_app_bar.dart';
import 'package:app/common/utils/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../app_colors.dart';
import '../../../../common/utils/dialogs.dart';
import '../../../contact/data/models/contact_model.dart';
import '../../../contact/views/widgets/contact_item.dart';
import '../components/enter_number_dialog.dart';
import 'send_amount_page.dart';

class SendContactPage extends StatefulWidget {
  const SendContactPage({super.key});

  @override
  State<SendContactPage> createState() => _SendContactPageState();
}

class _SendContactPageState extends State<SendContactPage> {
  @override
  Widget build(BuildContext context) {
    List<ContactModel> contacts = [
      ContactModel(fullName: 'Alain doe', phoneNumber: '0988776689'),
    ];
    List<ContactItem> listWidgets = contacts
        .map((item) => ContactItem(
              contact: item,
              onPressed: (c) {
                pushReplacement(context, SendAmountPage());
              },
            ))
        .toList();

    return Scaffold(
      appBar: YemiAppBar(
        title: 'Sélectionnez le bénéficiaire',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(FeatherIcons.search),
                  prefixIconColor: AppColors.white,
                  hintText: 'Numéro de téléphone, e-mail ou username',
                ),
              ),
              ListTile(
                onTap: () {
                  displayDialog(
                      context,
                      EnterNumberDialog(
                        onChanged: (v) {},
                        onConfirmed: (v) {
                          pushReplacement(context, SendAmountPage());
                        },
                      ), onCancel: () {
                    popNavigation(context);
                  });
                },
                leading: const Icon(FeatherIcons.phoneCall),
                title: const Text(
                  'Taper un numéro',
                  style: TextStyle(color: AppColors.white),
                ),
                trailing: const Icon(FeatherIcons.chevronRight),
              ),
              const SizedBox(height: 20),
              SectionTitle(
                label: 'Vos contacts',
                titleColor: AppColors.white.withAlpha(150),
              ),
              const SizedBox(height: 10),
              ...listWidgets
            ],
          ),
        ),
      ),
    );
  }
}
