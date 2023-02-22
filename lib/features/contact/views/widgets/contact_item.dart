import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../app_colors.dart';
import '../../data/models/contact_model.dart';

class ContactItem extends StatelessWidget {
  final ContactModel contact;
  final double leadingSize;
  final ValueChanged<ContactModel> onPressed;
  const ContactItem(
      {super.key,
      required this.contact,
      required this.onPressed,
      this.leadingSize = 40});

  @override
  Widget build(BuildContext context) {
    String firstChar = contact.fullName.substring(0, 1);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: AppColors.white.withAlpha(100)),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        leading: Container(
          margin: const EdgeInsets.only(top: 4),
          height: leadingSize,
          width: leadingSize,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(leadingSize / 2))),
          child: Center(
            child: Text(
              firstChar,
              style: const TextStyle(color: AppColors.black),
            ),
          ),
        ),
        title: Text(
          contact.fullName,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          contact.phoneNumber,
          style: TextStyle(color: AppColors.white.withAlpha(150)),
        ),
        trailing: const Icon(FeatherIcons.chevronRight),
        onTap: () {
          onPressed(contact);
        },
      ),
    );
  }
}
