import 'package:flutter/material.dart';
import 'package:valencyapp/components/textfield.dart';

class ValencyOnlineBankingPayment extends StatelessWidget {
  final numberController;   // The controller that can access the card number
  final bsbController;      // The controller that can access the cards expiry date
  final nameController;     // The controller that can access the name on the card

  const ValencyOnlineBankingPayment({
    super.key,
    required this.numberController,
    required this.bsbController,
    required this.nameController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      ValencyTextField(
        CONTROLLERGOESHERE,
        "Account Number",
        false,
      ),
      ValencyTextField(
        CONTROLLERGOESHERE,
        "BSB",
        false,
      ),
      ValencyTextField(
        CONTROLLERGOESHERE,
        "Name of Account Holder",
        false,
      ),
    );
  }
}