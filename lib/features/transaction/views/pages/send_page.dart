import 'package:app/common/components/yemi_app_bar.dart';
import 'package:app/common/utils/navigation_helper.dart';
import 'package:flutter/material.dart';

import '../../../../app_colors.dart';
import '../../../../common/components/yemi_button.dart';
import '../components/payment_method_action.dart';
import 'send_contact_page.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  double topRadius = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YemiAppBar(
        title: "Envoyer de l'argent",
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            const SizedBox(height: 10),
            PaymentMethodAction(
              icon: Image.asset('assets/images/om.png'),
              name: 'Orange Money',
              onPressed: () {
                pushPage(context, const SendContactPage());
              },
            ),
            PaymentMethodAction(
              icon: Image.asset('assets/images/wave.png'),
              name: 'Wave CI',
              onPressed: () {},
            ),
            PaymentMethodAction(
              icon: Image.asset('assets/images/moov-money.png'),
              name: 'Moov CI',
              onPressed: () {},
            ),
            PaymentMethodAction(
              icon: Image.asset('assets/images/mtn-mobile-money.png'),
              name: 'MTN Mobile Money CI',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
