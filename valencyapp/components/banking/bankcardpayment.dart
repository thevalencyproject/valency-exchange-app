import 'package:flutter/material.dart';

class ValencyBankCardPayment extends StatelessWidget {
  final numberController;        // The controller that can access the card number
  final expiryController;        // The controller that can access the cards expiry date
  final ccvController;           // The controller that can access the cards ccv
  final nameOnCardController;    // The controller that can access the name on the card

  const ValencyBankCardPayment({
    super.key,
    required this.numberController,
    required this.expiryController,
    required this.ccvController,
    required this.nameOnCardController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      
    );
  }
}