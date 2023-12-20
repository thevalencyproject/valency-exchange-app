import 'package:flutter/material.dart';
import 'package:valencyapp/components/textfield.dart';

class ValencyBankCardPayment extends StatelessWidget {
  ValencyBankCardPayment({
    super.key,
    required this.numberController,
    required this.expiryController,
    required this.ccvController,
    required this.nameOnCardController,
  });

  final TextEditingController numberController;        // The controller that can access the card number
  final TextEditingController expiryController;        // The controller that can access the cards expiry date
  final TextEditingController ccvController;           // The controller that can access the cards ccv
  final TextEditingController nameOnCardController;    // The controller that can access the name on the card
  bool saveCardInfo = false;                           // Whether or not to save the card info - false by default
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Credit/Debit Card',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ValencyTextField(
                  controller: numberController,
                  hintText: "Card Number",
                  obscureText: false,
                  width: 550,
                ),
              ),
              SizedBox(width: 10),
              ValencyTextField(
                controller: expiryController,
                hintText: "Expiry Date (MM/YY)",
                obscureText: false,
                width: 132,
              ),
              SizedBox(width: 10),
              ValencyTextField(
                controller: ccvController,
                hintText: "CCV",
                obscureText: true,
                width: 65,
              ),
            ],
          ),
          SizedBox(height: 10),
          ValencyTextField(   // No need for width value as default ValencyTextField will take up entire width
            controller: nameOnCardController,
            hintText: "Name on Card",
            obscureText: false,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: saveCardInfo,
                onChanged: (bool? value) {
                  saveCardInfo = value ?? false;
                },
              ),
              Text(
                'Save Card Info',
                style: TextStyle(fontSize: 32),
              ),
            ],
          ),

          SizedBox(height: 10),

          Text(
            'Please Note: This card should belong to you and be in your name.',
            style: TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
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
          fontSize: 32
        ),
      ),

      Text(
        'Expiry: + ${getBSB()}', 
        style: TextStyle(
          color: Colors.black, 
          fontSize: 32
        ),
      ),

      Text(
        'Name on Card: + ${getNameOnCard()}', 
        style: TextStyle(
          color: Colors.black, 
          fontSize: 32
        ),
      ),

    );
  }
}