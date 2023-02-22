import 'package:flutter/material.dart';

import '../../../../app_colors.dart';
import '../../../../common/components/yemi_button.dart';

class EnterNumberDialog extends StatefulWidget {
  ValueChanged<String> onChanged;
  ValueChanged<String> onConfirmed;
  EnterNumberDialog({
    super.key,
    required this.onChanged,
    required this.onConfirmed,
  });

  @override
  State<EnterNumberDialog> createState() => _EnterNumberDialogState();
}

class _EnterNumberDialogState extends State<EnterNumberDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            color: AppColors.black.withAlpha(90),
            child: Form(
              key: formKey,
              child: TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Numéro de téléphone, email, ou un username',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.white.withAlpha(100))),
                  focusColor: AppColors.white,
                ),
                onChanged: (v) {
                  widget.onChanged(v);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value?.isEmpty ?? true)
                    return 'Veuillez renseigner ce champ';
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              YemiButton(
                title: 'Annuler',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              YemiButton(
                title: 'Confirmer',
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    widget.onConfirmed('test');
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
