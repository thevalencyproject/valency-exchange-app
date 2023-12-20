import 'package:flutter/material.dart';
import 'package:valencyapp/components/textfield.dart';
import 'package:valencyapp/components/textbutton.dart';

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
  const ValencyDisplayBankCardDetails({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    required this.nameOnCard,
    required this.numberController,
    required this.expiryController,
    required this.ccvController,
    required this.nameOnCardController,
  });

  final String cardNumber;                             // Passthrough - Card Number (should show first and last 4 digits for security)
  final String expiryDate;                             // Passthrough - Card Expiry Date
  final String nameOnCard;                             // Passthrough - Name on the Bank Card
  final TextEditingController numberController;        // If user wants to use a different card - The controller that can access the card number
  final TextEditingController expiryController;        // If user wants to use a different card - The controller that can access the cards expiry date
  final TextEditingController ccvController;           // If user wants to use a different card - The controller that can access the cards ccv
  final TextEditingController nameOnCardController;    // If user wants to use a different card - The controller that can access the name on the card

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saved Card Details:',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          
          SizedBox(height: 10),

          Text(
            'Card Number: $cardNumber',
            style: TextStyle(fontSize: 32),
          ),

          SizedBox(height: 2),

          Text(
            'Expiry Date: $expiryDate',
            style: TextStyle(fontSize: 32),
          ),

          SizedBox(height: 2),

          Text(
            'Name On Card: $nameOnCard',
            style: TextStyle(fontSize: 32),
          ),

          SizedBox(height: 20),

          ValencyTextButton(  
            onTap: () {       // When pressed, replace current widget with ValencyBankCardPayment widget and pass all the text field controllers
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ValencyBankCardPayment(
                  numberController: numberController, 
                  expiryController: expiryController, 
                  ccvController: ccvController, 
                  nameOnCardController: nameOnCardController
                  )
                ),
              );
            },
            buttonColor: Colors.blue,
            buttonText: 'Use another card',
          ),
        ],
      ),
    );
  }
}