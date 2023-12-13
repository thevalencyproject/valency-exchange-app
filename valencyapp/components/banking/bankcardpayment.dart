import 'package:flutter/material.dart';
import 'package:valencyapp/components/textfield.dart';

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
      ValencyTextField(
        controller,
        "Card Number",
        false,
      ),
      ValencyTextField(
        controller,
        "Expiry Date (MM/YY)",
        false,
      ),
      ValencyTextField(
        controller,
        "CCV Controller",
        true,
      ),
      ValencyTextField(
        controller,
        "Name on Card",
        false,
      ),
    );
  }
}

class ValencyDisplayBankCardDetails extends StatelessWidget {
  final String sessionId;        // The session ID
  final String passcode;         // The passcode to access the session

  // The system does NOT send CCV numbers in display bank card detail requests for security reasons!!!
  String getCardNumber() {}
  String getExpiry() {}
  String getNameOnCard() {}

  const ValencyDisplayBankCardDetails({
    super.key,
    required this.sessionId,
    required this.passcode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(

      Text(
        'Card Number: + ${getCardNumber()}', 
        style: TextStyle(
          color: Colors.black, 
          fontSize: 96
        ),
      ),

      Text(
        'Expiry: + ${getBSB()}', 
        style: TextStyle(
          color: Colors.black, 
          fontSize: 96
        ),
      ),

      Text(
        'Name on Card: + ${getNameOnCard()}', 
        style: TextStyle(
          color: Colors.black, 
          fontSize: 96
        ),
      ),

    );
  }
}